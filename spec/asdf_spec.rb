require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Generate ASDF/)
  end

end

describe "Requests", :type => :request do

  it "should generate asdf text with button click" do
    visit '/'
    click_button 'submit'
    page.has_content? "Generated text"
  end

  it "should generate latin with button click" do
    visit '/'
    click_button 'Latin'
    page.has_content? "Generated text"
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

  it "should generate a word with length between 1 and 10" do
    lengths = 1..10
    lengths.include?(@rt.word.length).should == true
  end

  it "should generate sentences with length between 1 and 10 words" do
    length = 1..100
    length.include?(@rt.sentence.length).should == true
  end

  it "should generate paragraphs with 1 to 6 sentences" do
    length = 1..500
    length.include?(@rt.paragraph.length).should == true
  end

  it "should generate 1 to 6 paragraphs" do
    length = 1..2500
    length.include?(@rt.passage.length).should == true
  end

  it "generates random Latin" do
    length = 1..625
    length.include?(@rt.latin_passage.length).should == true
  end
end