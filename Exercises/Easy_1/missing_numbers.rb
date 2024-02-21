=begin

Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

input: sorted array of integers

ouput: array of integers
  array contains missing integers in order.
  missing integers are all those between first and last element not already in the input array.

use a new array to store integers

iterate through input array.
compare current index to next index
if they are not the same add integer to array
missing([-3, -2, 1, 5])# == [-1, 0, 2, 3, 4]

make an array of all numbers between first and last elements
option 1 - remove all the elemts from the array using input array
option 2 - Iterate though array adding elements to new array if they are not in the input array.


=end

# def missing(input)
#   all_nums = [*input[0]..input[-1]]
#   all_nums - input
# end

# def missing(array)
#   missing = []
#   (array[0]..array[-1]).each do |num|
#     missing << num unless array.any?(num)
#   end
#   missing
# end

def missing(input)
  missing = []
  input.each_cons(2) do |a, b|
    missing << [*a + 1...b]
  end
  missing.flatten
end


p missing([-3, -2, 1, 5])# == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []