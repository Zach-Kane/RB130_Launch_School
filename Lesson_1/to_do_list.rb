
## My work here. Could use some work to match was LS did.


class Todo
  DONE_MARKER = 'X'.freeze
  UNDONE_MARKER = ' '.freeze

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    if item.class == Todo
      @todos << item
    else
      puts "Can only add todo items"
    end
  end

  # def <<(todo)
  #   raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

  #   @todos << todo
  # end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def to_a
    @todos.map {|ea| ea.to_s}
  end

  def done?
    @todos.all? { |ea| ea.done == true }
  end

  def item_at(index)
    begin
      @todos.fetch(index)
    rescue IndexError
      'IndexError - Not within bounds'
    end
  end

  def mark_done_at(index)
    @todos.fetch(index).done!
  end

  def mark_undone_at(index)
    @todos.fetch(index).undone!
  end

  def done!
    @todos.each {|ea| ea.done!}
  end

  def to_s
    @todos.each {|ea| puts ea}
  end

  def shift
    @todos.shift.to_s
  end

  def pop
    @todos.pop.to_s
  end

  # def remove_at(idx)
  #   @todos.delete(item_at(idx))
  # end

  def remove_at(index)
    begin
      @todos.fetch(index)
      @todos.delete_at(index)
    rescue IndexError
      'IndexError - Not within bounds'
    end
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.<<(todo3)                 # adds todo3 to end of list, returns list
list.add(1)                     # raises TypeError with message "Can only add Todo objects"
list.to_s
# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
#list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
p list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----
list.to_s
# shift
p list.shift                      # removes and returns the first item in list

# pop
p list.pop                        # removes and returns the last item in list

# remove_at
#list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
p list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym