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



class RomanNumeral
  KEY = [%w[I V], %w[X L], %w[C D], %w[M]].freeze

  attr_reader :number

  def initialize(number)
    @number = number.digits
  end

  def to_roman
    roman_numeral = []
    number.each_with_index do |num, idx|
      numeral = ''
      while num > 0
        if num == 9
          numeral = (KEY[idx][0]) + (KEY[idx + 1][0])
          num -= 9
        elsif num > 5
          numeral = (KEY[idx][0]) + numeral
          num -= 1
        elsif num == 5
          numeral = KEY[idx][1] + numeral
          num -= 5
        elsif num == 4
          numeral = (KEY[idx][0]) + (KEY[idx][1])
          num -= 4
        elsif num < 4
          numeral = (KEY[idx][0]) + numeral
          num -= 1
        end
      end
      roman_numeral << numeral
    end
    p roman_numeral.reverse.join
  end
end


# class RomanNumeral
#   attr_reader :number

#   ROMAN_NUMERALS = {
#     "M" => 1000,
#     "CM" => 900,
#     "D" => 500,
#     "CD" => 400,
#     "C" => 100,
#     "XC" => 90,
#     "L" => 50,
#     "XL" => 40,
#     "X" => 10,
#     "IX" => 9,
#     "V" => 5,
#     "IV" => 4,
#     "I" => 1
#   }

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     p roman_version
#   end
# end


def time_it
  start = Time.new
  yield
  stop = Time.new
  p stop - start
end

time_it {RomanNumeral.new(1982).to_roman}