
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
    length = @prng.rand(5..10)
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

  def latin_words
    latin_words = %w{ Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis }
    latin_words[@prng.rand(0..24)]
    #puts "latin words"
    #puts latin_words
  end

  def latin_passage
    #puts "Here"
    word_count = @prng.rand(10..25)
    latin_passage = ''
    word_count.times do
      latin_passage += latin_words
    end
    latin_passage
  end

  def self.rt
    " hjkl"
  end

  def self.mt
    @nl = 5
    o =  [('a'..'z')].map{|i| i.to_a}.flatten;
    string  =  (0..@nl-1).map{ o[rand(o.length)]  }.join;
  end
end
