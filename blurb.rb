require 'rubygems'
require 'sinatra'  
require 'redis'  

# Do this later after Heroku and caching is
# figured out. These get added to config.ru
#require 'sass/plugin/rack'
#use Sass::Plugin::Rack

redis = Redis.new  
configure do  
   require 'redis'
   redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
   uri = URI.parse(redisUri) 
   REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

helpers do  
  include Rack::Utils  
  alias_method :h, :escape_html  

  def random_string(length)  
    rand(36**length).to_s(36)  
  end  
end  

get '/' do  
  erb :index  
end  

post '/' do  
  @random = RandomText.new()
  if params[:url] and not params[:url].empty?  
    @blurb = params[:url] 
    @block = RandomText.mt * 5
    # @block = @blurb * 5 + RandomText.rt
    redis.setnx "links:#{@block}", params[:url]  
  end  
  erb :index  
end  

get '/:blurb' do  
  @url = redis.get "links:#{params[:url]}"  
  redirect @url || '/'  
end

=begin
get 'stylesheets/bootstrap.css' do
  #content_type 'text/css'
  #File.read(File.join('public', 'stylesheets/bootstrap.css'))
end
=end

get 'css/application.css' do
  content_type 'text/css'
  #sass :"stylesheets/screen"
  #File.read(File.join('public', 'css/application.css'))
end

get 'images/600full-marilyn-monroe.jpg' do
  content_type 'image/jpeg'
  #sass :"stylesheets/screen"
  #File.read(File.join('public', 'images/600full-marilyn-monroe.jpg'))
end

get 'javascript/asdf.js' do
  content_type 'text/javascript'
  #File.read(File.join('public', 'javascript/asdf.js'))
end


class RandomText

  def initialize
    @prng = Random.new()
  end

  def letter
    letters = %w{a s d f g h j k l}
    letters[@prng.rand(0..8)]
  end

  def word
    length = @prng.rand(1..9)
    word = ''
    length.times do
      word += letter
    end
    word
  end

  def sentence
    length = @prng.rand(1..15)
    sentence = ''
    length.times do
      sentence += word
    end
    sentence
  end

  def self.rt
    " hjkl"
  end

  def self.mt
    @nl = 5
    o =  [('a'..'z')].map{|i| i.to_a}.flatten;
    string  =  (0..@nl-1).map{ o[rand(o.length)]  }.join;
  end
end
