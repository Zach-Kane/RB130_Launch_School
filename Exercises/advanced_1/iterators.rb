facts = Enumerator.new do |yielder|
  yielder << stop = 1
  loop do
    yielder << [*1..stop].inject(:*)
    stop += 1
  end
end

7.times { |num| puts "#{num}! == #{facts.next}" }
puts '-' * 20
3.times { |num| puts "#{num}! == #{facts.next}" }
puts '-' * 20
facts.rewind
7.times { |num| puts "#{num}! == #{facts.next}" }
puts '-' * 20
facts.take(7).each_with_index do |ea, idx|
  puts "#{idx}! == #{ea}"
end
puts '-' * 20
p facts.take(7)
