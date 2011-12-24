
class RandomText

  def initialize
    @prng = Random.new()
  end

  def letter
    letters = %w{a s d f g h j k l}
    letters[@prng.rand(0..8)]
  end

  def word
    length = @prng.rand(1..9)
    word = ''
    length.times do
      word += letter
    end
    word
  end

  def sentence
    length = @prng.rand(1..15)
    sentence = ''
    length.times do
      sentence += word
    end
    sentence
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
