=begin
valid?
 For a shape to be a triangle at all, all sides must be of length > 0, and 
 ** if any one side <= 0 - argument error
 the sum of the lengths of any two sides must be greater than the length of the third side.
 if s1 + s2 < s3 - Arument error



=end




class Triangle
  attr_reader :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise ArgumentError, 'incorrect side lengths' unless valid_lengths?
    raise ArgumentError, 'no side can equal zero' unless valid?
    @sides = [side1, side2, side3]
  end

  def kind
    if equilateral? then 'equilateral'
    elsif isosceles? then 'isosceles'
    elsif scalene? then 'scalene'
    end
  end

  def valid_lengths?
    return false if side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side2

    true
  end

  def valid?
    return false if [side1, side2, side3].any?(&:zero?)

    true
  end

  def equilateral?
    sides.all? { |side| side == side1 }
  end

  def isosceles?
    sides.any? { |side| sides.count(side) == 2 }
  end

  def scalene?
    sides.all? { |side| sides.count(side) == 1 }
  end
end
