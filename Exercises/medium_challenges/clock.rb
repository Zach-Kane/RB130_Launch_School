=begin

Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes 
from the time represented by a given Clock object. Note that you should not mutate Clock
objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.
1440 minutes 
=end

class Clock
  include Comparable

  attr_accessor :time

  def initialize(hours, minutes)
    @time = (hours * 60) + minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def +(minutes)
    self.time = ((time + minutes) % 1440)
    h, m = time.divmod(60)
    Clock.new(h, m)
  end

  def -(minutes)
    self.time = ((time - minutes) % 1440)
    1440 - time if time > 0
    h, m = time.divmod(60)
    Clock.new(h, m)
  end

  def to_s
    hrs, min = time.divmod(60)
    # "#{format('%.2d', hrs)}:#{format('%.2d', min)}"
    format('%02d:%02d', hrs, min)
  end

  def <=>(other)
    time <=> other.time
  end
end


# clock = Clock.at(10) - 3061
# p clock.to_s

# clock1 = Clock.at(15, 37)
# p clock1.to_s