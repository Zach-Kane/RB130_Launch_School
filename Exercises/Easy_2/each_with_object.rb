=begin
Write a method called each_with_object that behaves similarly for Arrays. 
It should take an Array and an object 
of some sort as an argument, and a block. 
It should yield each element and the object to the block. 
each_with_object should return the final value of the object.
input: array / object (array or hash)
  arg 1
  array of integers
  array can be empty
  arg 2
  array or hash
method must deal with assignment of both an array and a hash
  use an if / else here

output: is object passed in as argument updated with return values of the block.
  block argument(value = array, list = obeject)

=end

def each_with_object(array, object)
  array.each do |value|
    yield(value, object)
  end
  object
end


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}