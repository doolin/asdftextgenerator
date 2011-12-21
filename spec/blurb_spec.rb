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

  it "should generate a letter on the asdf row" do
    letters = %w{a s d f g h j k l}
    letters.include?(@rt.letter).should == true
  end

  it "should generate a word with length between 1 and 9" do
    lengths = 1..9
    lengths.include?(@rt.word.length).should == true
  end

  it "should should repeat 5 words of 5 random characters" do
    sentence = RandomText.rt * 5
    sentence.length.should == 25
  end

  it "should generate sentences with length between 1 and 75 characters" do
    lengths = 1..75
    lengths.include?(@rt.sentence.length).should == true
  end

  xit "should generate paragraphs with 1 to 6 sentences" do
    lengths = 1..450
    lengths.include?(@rt.paragraph.length).should == true
  end

  xit "should generate 1 to 6 paragraphs"

end