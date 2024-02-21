=begin
Write a method called max_by that behaves similarly for Arrays. 
It should take an Array and a block, 
  and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

=end

def max_by(array)
  return nil if array.empty?
  max = yield(array[0])
  max_index = 0
  array.each_with_index do |ea, idx|
    if yield(ea) > max
      max = yield(ea)
      max_index = idx
    end
  end
  array[max_index]
end
p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil