=begin

Enumerable#p one? processes elements in a collection by passing each element value to a block that is provided in the method call. 

** If the block returns a truthy value for exactly p one element, then #p one? returns true. Otherwise, #p one? returns false. 

** Note in particular that #p one? will stop searching the collection the second time the block returns true.

Write a method called p one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly p one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true a second time.

If the Array is empty, p one? should return false, regardless of how the block is defined.

input: array, block

** return `true` if the block returns true for exactly p one of the elements.
  ** if  more than p one returns true then return false
** the block should stop processing after the second true

output: true / false

return false if array empty
make a counter = 0

array each - 
  if true counter += 1
  return false if counter == 2
end

return false if counter == 1
true
=end

def one?(array)
  return false if array.empty?
  counter = 0
  array.each do |element|
    counter += 1 if yield(element)
    return false if counter == 2
  end
  return false if counter == 0
  true
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false