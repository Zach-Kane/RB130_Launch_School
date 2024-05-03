=begin
The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.

Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

input: starting value, ending value, step value.
iterate over a range of values increasing value on each iteration by the value of the step. 
ouput the value

=end

# def step(start_value, end_value, step_value)
#   range = start_value..end_value
#   yield(start_value)
#   while start_value < end_value
#     yield(start_value += step_value)
#   end
#   range
# end


def step(start, stop, step)
  while start <= stop
    yield(start)
    start += step
  end
end


p step(1, 10, 3) { |value| puts "value = #{value}" }


# value = 1
# value = 4
# value = 7
# value = 10