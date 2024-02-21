def compute(num)
  return yield(num) if block_given?
  "No need for #{num}."
end

p compute(6) {|num| num + 4 } == 10
p compute("say") {|word| word + ' so' } == 'say so'
x = 10
p compute(x) == "No need for #{x}."
