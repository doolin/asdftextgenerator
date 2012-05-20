
class RandomText

  def initialize
    @prng = Random.new()
  end

  def letter
    letters = %w{a s d f g h j k l}
    letters[@prng.rand(0..8)]
  end

  def word
    length = @prng.rand(1..10)
    word = ''
    length.times do
      word += letter
    end
    word
  end

  def sentence
    #length = @prng.rand(5..10)
    length = @prng.rand(1..10)
    sentence = word.capitalize
    length.times do
      sentence += ' ' + word
    end
    sentence + '.'
  end

  def paragraph
    sent_count = @prng.rand(1..5)
    paragraph = '<p>' + sentence
    sent_count.times do
      paragraph += ' ' + sentence 
    end
    paragraph + '</p>'
  end

  def passage
    prgh_count = @prng.rand(1..5)
    passage = ''
    prgh_count.times do
      passage += paragraph 
    end
    passage
  end

#=begin
  def lorem_words
    lorem_words = %w{ Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis }
    lorem_words[@prng.rand(0..24)]
    #puts "lorem words"
    #puts lorem_words
  end

  def lorem_sentence
    length = @prng.rand(5..10)
    lorem_sentence = lorem_words.capitalize
    length.times do
      lorem_sentence += ' ' + lorem_words
    end
    lorem_sentence + '.'
  end

  def lorem_paragraph
    sent_count = @prng.rand(1..5)
    lorem_paragraph = '<p>' + lorem_sentence
    sent_count.times do
      lorem_paragraph += ' ' + lorem_sentence 
    end
    lorem_paragraph + '</p>'
  end

  def lorem_passage
    prgh_count = @prng.rand(1..5)
    lorem_passage = ''
    prgh_count.times do
      lorem_passage += lorem_paragraph 
    end
    lorem_passage
    #puts lorem_passage
  end
#=end

  def self.rt
    " hjkl"
  end

  def self.mt
    @nl = 5
    o =  [('a'..'z')].map{|i| i.to_a}.flatten;
    string  =  (0..@nl-1).map{ o[rand(o.length)]  }.join;
  end
end
