=begin

make a diamond from input letter ('C') as such 'A' upto 'C' then back to 'A'

  A
 B B
C   C
 B B
  A

array =  [a .. c]
A to C each do something

    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A


=end

def make_diamond(input)
  letters = [*'A'..input]
  space = letters.size
  diamond = []
  letters.each_with_index do |letter, index|
    idx = index == 1 ? 1 : (index * 2) - 1
    if index.zero?
      diamond << "#{' ' * (space - 1)} A"
    else
      diamond << "#{' ' * space}#{letter}#{' ' * (idx)}#{letter}"
    end
    space -= 1
  end
  puts diamond
  diamond.pop
  puts diamond.reverse
end

make_diamond('Z')
