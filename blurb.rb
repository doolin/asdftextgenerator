require 'rubygems'
require 'sinatra'  
# require 'redis'  
require './lib/randomtext'

# Do this later after Heroku and caching is
# figured out. These get added to config.ru
#require 'sass/plugin/rack'
#use Sass::Plugin::Rack

# redis = Redis.new  
# configure do  
#    require 'redis'
#    redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
#    uri = URI.parse(redisUri) 
#    REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# end

helpers do  
  include Rack::Utils  
  alias_method :h, :escape_html  
end  

get '/' do  
  erb :index  
end  

post '/' do  
  @random = RandomText.new()
  # if params[:url] and not params[:url].empty?  
  #   @blurb = params[:url] 
  @block = @random.passage
  #   redis.setnx "links:#{@block}", params[:url]  
  # end
  erb :index
end  

get '/:blurb' do  
  # @url = redis.get "links:#{params[:url]}"  
  redirect @url || '/'  
end

=begin
get 'stylesheets/bootstrap.css' do
  #content_type 'text/css'
  #File.read(File.join('public', 'stylesheets/bootstrap.css'))
end
=end

=begin
get 'css/application.css' do
  content_type 'text/css'
  #sass :"stylesheets/screen"
  #File.read(File.join('public', 'css/application.css'))
end
=end

get 'images/600full-marilyn-monroe.jpg' do
  content_type 'image/jpeg'
  #sass :"stylesheets/screen"
  #File.read(File.join('public', 'images/600full-marilyn-monroe.jpg'))
end

get 'javascript/asdf.js' do
  content_type 'text/javascript'
  #File.read(File.join('public', 'javascript/asdf.js'))
end

