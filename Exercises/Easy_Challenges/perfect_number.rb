=begin

input: integer
define the integer by classification based on the number
  and the sum of it's positive divisors
For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

** outputs: string representing the classs of the input number.

* Perfect numbers have an Aliquot sum that is equal to the original number.
* Abundant numbers number > sum
  Aliquot sum that is greater than the original number.
* Deficient numbers have an Aliquot sum that is less than the original number.

6 is a perfect number since its 
  divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

=end


class PerfectNumber
  def self.get_sum(number)
    sum = 0
    1.upto(number - 1) do |num|
      sum += num if number % num == 0
    end
    sum
  end

  def self.classify(number)
    raise StandardError if number < 0
    sum = get_sum(number)

    if number == sum
      'perfect'
    elsif number < sum
      'abundant'
    else
      'deficient'
    end
  end
end
