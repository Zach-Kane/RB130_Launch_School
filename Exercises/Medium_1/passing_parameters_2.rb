birds = %w(dove sparrow hawk osprey eagle)

def parameters(bird1, bird2, *raptors)
  yield(raptors)

end

raptors = []
parameters(*birds) {|rap| raptors = rap }

p raptors



birds = %w(dove sparrow hawk osprey eagle)

def sort_birds(birds)
  yield(*birds)
end

more_raptors = []
sort_birds(birds) do |b1, b2, *b3|
  p b1
  p b2
  more_raptors = b3
end


p more_raptors


cars = %w(chevy caddy subie)
def park_cars(c1, c2, c3)
  p c1
  p c2
  p c3
end

park_cars(*cars)


def other_cars(cars)
  yield(cars)
end


other_cars(cars) do |c1, c2, c3| 
  p c1
  p c2
  p c3
end