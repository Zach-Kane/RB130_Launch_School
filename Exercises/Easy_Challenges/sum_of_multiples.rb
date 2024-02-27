=begin
Write a program that, given a natural number and a set of one or more other numbers
can find the sum of all the multiples of the numbers in the set that are less than 
the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 
that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

=end

class SumOfMultiples
  attr_reader :set

  def initialize(*nums)
    @set = nums.empty? ? [3, 5] : nums
  end

  def to(number)
    (1...number).select do |num|
      set.any? { |ea| (num % ea).zero? }
    end.sum
  end

  def self.to(number)
    #SumOfMultiples.
    new().to(number)
  end
end