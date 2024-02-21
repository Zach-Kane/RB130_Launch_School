
=begin
[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
Write your own version of zip that does the same type of operation. 
It should take two Arrays as arguments, and 
return a new Array 
(the original Arrays should not be changed). 
Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

input: two arrays

output: new array
  combines the two arrays into a new array
   sub arrays are one element from each array in sequence
  ** do not change input array
  ** arrays have same number of elements 

=end


# def zip(arr1, arr2)
#   new_array = []
#   arr1.size.times do |idx|
#     new_array << [arr1[idx], arr2[idx]]
#   end
#   new_array
# end

def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(ea, idx), new_arr|
    new_arr << [ea, arr2[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]