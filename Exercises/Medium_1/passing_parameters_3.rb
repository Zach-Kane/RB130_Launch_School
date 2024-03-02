items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*food1, food2|
  puts food1.join(", ")
  puts food2
end


gather(items) do |food1, *food2, food3 |
  puts food1
  puts food2.join(", ")
  puts food3
end

gather(items) do | food1, *food2 |
  puts food1
  puts food2.join(", ")
end

gather(items) do | f1, f2, f3, f4|
  puts "#{f1}, #{f2}, #{f3}, and #{f4}"
end