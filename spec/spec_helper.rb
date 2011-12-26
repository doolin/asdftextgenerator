require File.join(File.dirname(__FILE__), '..', 'blurb.rb')

require 'sinatra'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Rack::Test::Methods
  #config.mock_with :rspec
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  def app
  	Sinatra::Application
  end
end