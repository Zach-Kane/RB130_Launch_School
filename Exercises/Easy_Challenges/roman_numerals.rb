=begin

write a RomanNumeral class
  class has a method to_roman
    which converts input integer to roman numeral

There is no need to be able to convert numbers larger than about 3000. 

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:
1000=M
900=CM
90=XC

2008 is written as MMVIII:
2000=MM
8=VIII

I	1	
V	5	
X	10	
L	50	
C	100	
D	500	
M	1,000	

1000  900   80    8
M     CM    LXXX  VIII

break number into ^^

digits = []
[10, 100, 1000]
number.size.downto(0) do |index|
  digits << 

=end



# class RomanNumeral
#   KEY = [%w[I V], %w[X L], %w[C D], %w[M]].freeze

#   attr_reader :number

#   def initialize(number)
#     @number = number.digits
#   end

#   def to_roman
#     roman_numeral = []
#     number.each_with_index do |num, idx|
#       numeral = ''
#       while num > 0
#         if num == 9
#           numeral = (KEY[idx][0]) + (KEY[idx + 1][0])
#           num -= 9
#         elsif num > 5
#           numeral = (KEY[idx][0]) + numeral
#           num -= 1
#         elsif num == 5
#           numeral = KEY[idx][1] + numeral
#           num -= 5
#         elsif num == 4
#           numeral = (KEY[idx][0]) + (KEY[idx][1])
#           num -= 4
#         elsif num < 4
#           numeral = (KEY[idx][0]) + numeral
#           num -= 1
#         end
#       end
#       roman_numeral << numeral
#     end
#     p roman_numeral.reverse.join
#   end
# end


class RomanNumeral
  attr_accessor :numeral

  def initialize(number)
    @numeral = number.digits
  end

  NUM = %w(I V X L C D M V)

  def to_roman
    idx = -2
    numeral.map! do |num|
      idx += 2
      case num
      when 1..3 then NUM[idx] * num
      when 4 then NUM[idx] + NUM[idx + 1]
      when 5..8 then NUM[idx + 1] + (NUM[idx] * (num - 5))
      when 9 then NUM[idx] + NUM[idx + 2]
      end
    end.reverse.join
  end
end


def time_it
  start = Time.new
  yield
  stop = Time.new
  p stop - start
end

time_it {RomanNumeral.new(1982).to_roman}