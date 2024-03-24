class Element
  attr_accessor :datum, :element

  def initialize(datum, element=nil)
    @datum = datum
    @element = element
  end

  def tail?
    element.nil?
  end

  def next
    element
  end
end

class SimpleLinkedList
  attr_accessor :head

  def push(datum)
    element = Element.new(datum, head)
    self.head = element
  end

  def size
    size = 0
    temp_head = head
    while temp_head
      size += 1
      temp_head = temp_head.next
    end
    size
  end

  def empty?
    true unless head
  end

  def peek
    head ? head.datum : nil
  end

  def pop
    datum = peek
    self.head = head.next
    datum
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    array.reverse.each { |ea| list.push(ea) } if array
    list
  end

  def to_a
    array = []
    temp_head = head
    while temp_head
      array << temp_head.datum
      temp_head = temp_head.next
    end
    array
  end

  def reverse
    array = to_a.reverse
    self.class.from_a(array)
  end
end
