class Element
  attr_reader :datum, :list
  def initialize(*input)
    @list = input
    #p datum
    #@list = make_list
  end

  # def make_list
  #   list = Enumerator.new do |yielder|
  #     @datum.each do |ea|
  #       yielder << ea
  #     end
  #   end
  # end

  def datum
    list[-1]
  end

  def next
    list[1]

  end

  def tail?
    list[-1]
  end
end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def push(element)
    list.push(Element.new(element))
  end

  def self.from_a(array) # convert to list
    simple = new
    array.each {|ea| simple.push(ea)}
    simple
  end

  def to_a # convert to array

  end

  def empty?
    list.empty?
  end

  def head # start of list
    list[-1]
  end

  def size # size of list
    list.size
  end

  def peek
    return nil if list.empty? # first item in list
    list[-1].datum
  end

  def pop
    list.pop.datum
  end
 

  def reverse

  end

end


# list = Element.new('hey')
# p list.datum

#list = SimpleLinkedList.from_a((1..10).to_a)

