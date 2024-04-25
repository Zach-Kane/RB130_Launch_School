class CustomSet
  attr_accessor :set

  def initialize(set=[])
    @set = set
  end

  def empty?
    @set.empty?
  end

  def contains?(item)
    set.include?(item)
  end

  def subset?(other)
    set.all? { |ea| other.set.any?(ea) }
  end

  def disjoint?(other)
    set.none? { |ea| other.set.any?(ea) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(item)
    set << item
    self
  end

  def ==(other)
    eql?(other)
  end

  def intersection(other)
    set.select! { |ea| other.set.any?(ea) }
    self
  end

  def difference(other)
    set.select! { |ea| other.set.none?(ea) }
    self
  end

  def union(other)
    self.set = (set + other.set).uniq
    self
  end
end

set = CustomSet.new.intersection(CustomSet.new)

p set