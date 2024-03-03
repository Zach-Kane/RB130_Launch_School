require 'date'

class Meetup
  WEEK = %w(first second third fourth fifth)

  TEENTH = [*13..19]

  attr_reader :year, :month
  
  def initialize(year, month)
    @year = year
    @month = month
  end

  def make_days(day)
    day = "#{day.downcase}?".to_sym
    days = []
    date = Date.new(year, month)
    while date.month == month
      days << date
      date = date.next
    end
    days.select(&day)
  end

  def day(day, week)
    week = week.downcase
    days = make_days(day)
    case week
    when 'last' then days.last
    when 'teenth' then days[days.index {|day| TEENTH.any?(day.mday)}] 
    else days[WEEK.index(week)]
    end
  end
end

