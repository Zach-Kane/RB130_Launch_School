class Tree
  include Enumerable

  def initialize
    @collection = [1,2,3,4,5]
  end

  def each
    index = 0
    while index < @collection.size
      yield(@collection[index])
      index += 1
    end
  end
end


elm = Tree.new

p elm.any?(&:even?)