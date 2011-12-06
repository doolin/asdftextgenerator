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
  if params[:url] and not params[:url].empty?  
    @blurb = random_string 5  
    REDIS.setnx "links:#{@blurb}", params[:url]  
  end  
  erb :index  
end  

get '/:blurb' do  
  @url = REDIS.get "links:#{params[:blurb]}"  
  redirect @url || '/'  
end  

get 'css/application.css' do
  content_type 'text/css'
  #sass :"stylesheets/screen"
  File.read(File.join('public', 'css/application.css'))
end

get 'images/600full-marilyn-monroe.jpg' do
  content_type 'image/jpeg'
  #sass :"stylesheets/screen"
  File.read(File.join('public', 'images/600full-marilyn-monroe.jpg'))
end

get 'javascript/asdf.js' do
  content_type 'text/javascript'
  File.read(File.join('public', 'javascript/asdf.js'))
end