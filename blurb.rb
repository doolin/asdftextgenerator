require 'sinatra'  
require 'redis'  
require 'erb'

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
    @shortcode = random_string 5  
    redis.setnx "links:#{@shortcode}", params[:url]  
  end  
  erb :index  
end  

get '/:shortcode' do  
  @url = redis.get "links:#{params[:shortcode]}"  
  redirect @url || '/'  
end  
