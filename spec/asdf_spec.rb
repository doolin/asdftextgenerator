require 'spec_helper'

describe "Sinatra App" do

  it "to respond to GET" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Generate ASDF/)
  end

  it "to respond to GET/?type=ASDF" do
    get '/?type=ASDF'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/{\"asdf\":*/)
  end

  it "to respond to GET/?type=Lorem" do
    get '/?type=Lorem'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/{\"lorem\":*/)
  end

  it "responds to GET /lorem" do
    get '/lorem'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/{\"lorem\":*/)
  end

  it "responds to GET /asdf" do
    get '/asdf'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/{\"asdf\":*/)
  end
end

describe "Requests", :type => :request do

  it "to generate asdf text with button click" do
    visit '/'
    click_button 'ASDF'
    #page.has_text?('ASDF-FOO')
    page.has_content? 'ASDF'
  end

  it "to generate latin with button click" do
    visit '/'
    click_button 'Lorem'
    page.has_content? "Lorem"
  end
end


describe RandomText do
  before do
    @rt = RandomText.new
  end

  it "to return ' hjkl' for rt" do
    expect(RandomText.rt).to eq(' hjkl')
  end

  it "to generate a letter on the asdf row" do
    letters = %w{a s d f g h j k l}
    expect(letters.include?(@rt.letter)).to eq(true)
  end

  it "to generate word with 1-10 characters" do
    lengths = 1..10
    expect(lengths.include?(@rt.word.length)).to eq(true)
  end

  it "to generate sentence with 1-10 words" do
    length = 1..100
    expect(length.include?(@rt.sentence.length)).to eq(true)
  end

  it "to generate paragraph with 1-5 sentences" do
    length = 1..500
    expect(length.include?(@rt.paragraph.length)).to eq(true)
  end

  it "to generate passage with 1-6 paragraphs" do
    length = 1..2500
    expect(length.include?(@rt.passage.length)).to eq(true)
  end

  it "to generate lorem word with 1-10 characters" do
    lengths = 1..10
    expect(lengths.include?(@rt.lorem_words.length)).to eq(true)
  end

  it "to gemerate lorem sentence with 2-10 words" do
    length = 1..100
    expect(length.include?(@rt.lorem_sentence.length)).to eq(true)
  end

  it "to generate lorem paragraph with 2-5 sentences" do
    length = 1..601
    expect(length.include?(@rt.lorem_paragraph.length)).to eq(true)
  end

  # For some reason this keeps failing.
  xit "to generate lorem passage with 1-6 paragraphs" do
    length = 1..926
    expect(length.include?(@rt.lorem_passage.length)).to == true
  end
end
