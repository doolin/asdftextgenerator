require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Blurb/)
  end

end

describe RandomText do
  
  before do
    @rt = RandomText.new
  end

  it "should return ' hjkl' for rt" do
    RandomText.rt.should == ' hjkl'
  end

  it "should generate a words with length between 1 and 9" do
    lengths = 1..9
    lengths.include?(@rt.word.length).should == true
  end

  it "should generate a letter on the asdf row" do
    letters = %w{a s d f g h j k l}
    letters.include?(@rt.letter).should == true
  end

end