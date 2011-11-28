require 'rubygems'
require 'sinatra'  
require 'redis'  

# redis = Redis.new  

configure do  
   require 'redis'
   redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
   uri = URI.parse(redisUri) 
   redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

# configure do
#   require 'redis'
#   ENV["REDISTOGO_URL"] ||= "redis://username:password@host:1234/"
#   uri = URI.parse(ENV["REDISTOGO_URL"])
#   REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# end

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

get 'css/application.css' do
  content_type 'text/css'
  #sass :"stylesheets/screen"
  File.read(File.join('public', 'css/application.css'))
end

get 'javascript/asdf.js' do
  content_type 'text/javascript'
  File.read(File.join('public', 'javascript/asdf.js'))
end

post '/' do  
  if params[:url] and not params[:url].empty?  
    @shortcode = random_string 5  
    redis.setnx "links:#{@shortcode}", params[:url]  
  end  
  erb :index  
end  

get '/:shortcode' do  
  @url = redis.get "links:#{params[:shortcode]}"  
  redirect @url || '/'  
end  
