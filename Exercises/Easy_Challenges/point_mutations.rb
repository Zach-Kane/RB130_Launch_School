=begin

Write a program that can calculate the Hamming distance between two DNA strands.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. 
** If you have two sequences of unequal length, 
  you should compute the Hamming distance over the shorter length.

create a DNA class ( initialize with DNA strand string)
  hamming_distance method
  start with the shortest of 2 strings if they are not equal.
  make an array of frist string 
  use a method to combine the array with the string
  count how many places in the string are different. 
  return the count

=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    short, long = [strand, other_strand].sort_by(&:size)
    short.split('').zip(long.split('')).count { |arr| arr[0] != arr[1] }
  end
end

dna = DNA.new('GAGCCTACTAACGGGAT')
p dna.hamming_distance('CATCGTAATGACGGCCT')