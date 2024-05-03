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

class Diamond
  def self.make_diamond(letter)
    nums = [*'A'..letter]
    size = nums.size
    diamond = []
    nums.each_with_index do |ea, idx|
      if idx == 0
        diamond << ((' ' * (size - 1)) + nums[0] + (' ' * (size - 1)))
      else
        diamond << ((' ' * (size - idx - 1)) + ea + (' ' * ((idx * 2) - 1)) + ea + (' ' * (size - idx - 1)))
      end
    end
    top = diamond.dup
    diamond.pop
    bottom = diamond.reverse
   (top + bottom).join("\n") + "\n"
  end
end
