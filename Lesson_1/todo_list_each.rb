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

  def each
    index = 0
    while index < todos.size
      yield(todos[index]) if block_given?
      index += 1
    end
  end

  private

  attr_accessor :todos

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_done_at(0)

list.each do |todo|
  puts "You will #{todo} TODAY!" unless todo.done?
end