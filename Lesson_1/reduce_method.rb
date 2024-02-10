def reduce(array, memo=0)
index  = 0
  while index < array.size
    memo = yield(memo, array[index])
  index += 1
  end
  memo
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass