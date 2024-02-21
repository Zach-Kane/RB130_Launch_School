=begin
The Enumerable#each_cons method iterates over the members of a collection 
taking each sequence of n consecutive elements at a time 
  and passing them to the associated block for processing. 
  It then returns a value of nil.

Write a method called each_cons that behaves similarly for Arrays, 
taking the elements 2 at a time:
  The method should take an Array as an argument, and a block. 
  It should yield each consecutive pair of elements to the block, and return nil.
Update your each_cons method so it takes an argument that specifies how many elements should be processed at a time.
save each block to a has value.

iterates over the collection, passing each n-tuple(cons) to the block

=end

def each_cons(array, cons)
  0.upto(array.size - cons) do |idx|
    yield(*array[idx, cons])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}