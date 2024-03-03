=begin

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first 
time you boot them up, they get a new name 

** no input
** constructor generates a new name.
** generate random name is generated, such as 
ouput string:
 RX837 or BC811
 random letter, random letter, random integer to string X 3
 random letter; A-Z

#new method 
  will wipe the name if it exists and respond with a new random name.

** The names must be random; 
  *they should not follow a predictable sequence.
Random names means there is a risk of collisions. 
** Your solution should not allow the use of the same name twice.
  use a database of names to compare new names against.

use helper method for generating? 

generate name
  - compare against database
  - if no match
  - add to database
  - replace existing name or create new name.

=end

class Robot
  attr_accessor :name

  @@names = []

  def initialize
    @name = set_name
  end

  def generate_name
    name = [[*'A'..'Z'].sample, [*'A'..'Z'].sample, rand(0..9), rand(0..9), rand(0..9)]
    name.map!(&:to_s).join
  end


  # def generate_name
  #   name = ''
  #   2.times { name << rand(65..90).chr }
  #   3.times { name << rand(0..9).to_s }
  #   name
  # end

  def set_name
    loop do
      temp_name = generate_name
      next if @@names.any? {|name| name == temp_name }
      @@names << temp_name
      return temp_name
    end
  end

  def reset
    @@names.delete(@name)
    self.name = set_name
  end
end


p Robot.new.generate_name