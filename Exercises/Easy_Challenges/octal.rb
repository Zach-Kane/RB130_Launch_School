=begin

** Input: octal input string
Implement octal to decimal conversion. 
Given an octal input string
** produce a decimal output. 

**Treat invalid input as octal 0.

** Output: Integer ** decimal output **

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

string to characters

2  0  4  7 octal
 32 7

1063
iterator = 0
each chacter
155 % 128

[1, 8, 64, 512, 4096, 32768, 262144, 2097152, 16777216, 134217728]
=end

OCTALS = Enumerator.new do |yielder|
  octal = 8
  power = 0
  loop do
    yielder << (octal**power)
    power += 1
  end
end

class Octal
  attr_reader :octal, :number

  def initialize(number)
    @number = number
    @octal = number.to_i.to_s.chars.map(&:to_i)
    octal.unshift if octal[0] == 0
  end

  def not_valid
    number.chars.any? { |ea| /[a-z]/ =~ ea } ||
      [8, 6789].any?(number.to_i)
  end


  def to_decimal
    return 0 if not_valid
    return 1 if @number.to_i == 1
    digits = OCTALS.take(octal.size).reverse.zip(octal)
    decimal = digits.map! { |ea| ea.inject(:*) }.sum
    decimal == @number.to_i ? 0 : decimal
  end
end

p Octal.new('123abc').to_decimal