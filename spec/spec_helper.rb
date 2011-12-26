require 'simplecov'
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'blurb.rb')

require 'sinatra'
require 'rack/test'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  #config.mock_with :rspec
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"
end