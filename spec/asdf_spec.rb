require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Generate ASDF/)
  end

  xit "should respond to GET/?type=ASDF" do
    get '/?type=ASDF'
    last_response.should be_ok
    last_response.body.should match(/ASDF-FOO/)
  end

  xit "should respond to GET/?type=Lorem" do
    get '/?type=Lorem'
    last_response.should be_ok
    last_response.body.should match(/IPSUM/)
  end

end

describe "Requests", :type => :request do

  xit "should generate asdf text with button click" do
    visit '/'
    click_button 'ASDF'
    page.has_text?('ASDF-FOO')
  end

  xit "should generate latin with button click" do
    visit '/'
    click_button 'Lorem'
    page.has_content "Lorem"
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

  it "should generate word with 1-10 characters" do
    lengths = 1..10
    lengths.include?(@rt.word.length).should == true
  end

  it "should generate sentence with 1-10 words" do
    length = 1..100
    length.include?(@rt.sentence.length).should == true
  end

  it "should generate paragraph with 1-5 sentences" do
    length = 1..500
    length.include?(@rt.paragraph.length).should == true
  end

  it "should generate passage with 1-6 paragraphs" do
    length = 1..2500
    length.include?(@rt.passage.length).should == true
  end

  xit "should generate lorem word with 1-10 characters" do
    lengths = 1..10
    lengths.include?(@rt.lorem_words.length).should == true
  end

  xit "should gemerate lorem sentence with 1-10 words" do
    length = 1..100
    length.include?(@rt.lorem_sentence.length).should == true
  end

  xit "should generate lorem paragraph with 1-5 sentences" do
    length = 1..500
    #length.include?(@rt.lorem_paragraph.length).should == true
    puts @rt.lorem_paragraph
  end

  xit "should generate lorem passage with 1-6 paragraphs" do
    length = 1..625
    #length.include?(@rt.lorem_passage.length).should == true
    puts @rt.lorem_passage
  end

end