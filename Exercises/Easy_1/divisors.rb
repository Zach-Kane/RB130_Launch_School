=begin

Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

input: Integer

Ouput: a new array
 * Array is every divisor of the positive integer
  passed in as an argument.
     - A divisor is a number that divides another number evenly, meaning without leaving a remainder. 
* return array can be any in any sequence I wish

divisors(12) == [1, 2, 3, 4, 6, 12]

for every number between 1 and input:
  if input % number equals zero, add number to array

make a number
make a loop
  if number is a divosor ass to array
  increment number by one
return array

=end

# def divisors(input)
#   divisors = []
#   number = 1
#   start = Time.new
#   number.upto(input) do |num|
#     divisors << num if (input % num).zero?
#   end
#   stop = Time.new
#   p stop - start
#   divisors
# end

def divisors(number)
  start = Time.new
  divisors = 1.upto(number).select do |num|
    (number % num).zero?
  end
  stop = Time.new
  p stop - start
  divisors
end






p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]