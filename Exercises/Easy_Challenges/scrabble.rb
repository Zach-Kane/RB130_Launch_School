=begin

convert point:
  use an array to hold letters
  make a hash with array as key and point as value
=end

one = %w(A E I O U L N R S T)
two = %w(D G)
three = %w(B C M P)
four = %w(F H V W Y)
five = %w(K)
eight = %w(J X)
ten = %w(Q Z)
POINTS = [[], one, two, three, four, five, [], [], eight, [], ten]

class Scrabble
  attr_accessor :word

  def initialize(word)
    @word = word.nil? ? [] : word.upcase.chars
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    word.map do |letter|
      POINTS.index { |point| point.any?(letter) }
    end.compact.sum
  end
end
