=begin

Write a program that will take a 
***input: string of digits
***Output: array of arrays: size == series
 which are all the possible consecutive number series of a specified length in 
 that string.



* Series.new (input string) class
  method: slices(specified length of series)
  series == length of array slices
  overlapping slices * use each_cons

series = Series.new('31001')
[[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3)

   ** raise an argument error if:
    seriess length > input string

collection array

input string to characters
  each_cons(series)
    collection << series
  
return collection


For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string,
  you should throw an error.

=end

class Series
  attr_reader :num_array

  def initialize(string)
    @num_array = string.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if num_array.size < size
    num_array.each_cons(size).to_a
  end
end
