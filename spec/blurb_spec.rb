require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Blurb/)
  end

end

describe RandomText do
  
  it "should return ' hjkl' for rt" do
    RandomText.rt.should == ' hjkl'
  end

  it "should generate only letters in 'asdfghjkl'" do
   puts RandomText.mt
  end
end