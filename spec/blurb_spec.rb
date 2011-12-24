require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Blurb/)
  end

  # Missing Capybara matcher methods.
  xit "should respond to POST with random text" do
    post '/'
    fill_in :url, :with => "foo"
    click_button :submit
    last_response.body.should match(/aa/)
  end

end

describe "Redis" do

  before do
    @redis = Redis.new
  end

  it "should return Redis object" do
    @redis.should_not == nil
  end

  # Missing correct method on Redis object.
  xit "should return stored record" do
    @redis.get("links:#{params[:url]}").should == @rt
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