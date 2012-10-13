require 'rubygems'
require 'sinatra'  
require './lib/randomtext'

# Do this later after Heroku and caching is
# figured out. These get added to config.ru
#require 'sass/plugin/rack'
#use Sass::Plugin::Rack

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  @random = RandomText.new()
#=begin
  if params[:type] == 'Lorem'
    @block = @random.lorem_passage
  elsif params[:type] == 'ASDF'
    @block = @random.passage
  else
    @block = @random.passage
  end
#=end
  #@block = @random.passage
  erb :index
end

get 'images/600full-marilyn-monroe.jpg' do
  content_type 'image/jpeg'
end

get 'javascript/asdf.js' do
  content_type 'text/javascript'
end

