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

