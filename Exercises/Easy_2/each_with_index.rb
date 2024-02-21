=begin
Write a method called each_with_index that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should yield each element and an index number to the block. each_with_index should return a reference to the original Array.

input: array of integers & a block
  yield each element & index to the block
ouput: reference to the original array.

=end

def each_with_index(array)
  idx = 0
  array.each do |ea|
    yield(ea, idx)
    idx += 1
  end
  array
end



result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# should output
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true