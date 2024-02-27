=begin
Write a program that takes a word and a list of possibleanagrams and selects 
the correct sublist that contains the anagrams of the word.

find the anagram:
 split the word 
 sort the word
 join the word


For example, given the word "listen" and a list of candidates
 like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

=end


class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def sort(word)
    word.downcase.chars.sort.join
  end

  def match(array)
    array.select do |ea|
      sort(ea) == sort(word) && ea.downcase != word.downcase
    end
  end
end
