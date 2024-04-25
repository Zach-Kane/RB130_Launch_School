require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)
    @list.done!
    assert(@list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add('a') }
    assert_raises(TypeError) { @list.<<(2) }
  end

  def test_shovel
    @todo4 = Todo.new("Bake Cookies")
    @todos = [@todo1, @todo2, @todo3, @todo4]
    @list << @todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_alias
    @todo4 = Todo.new("Clean Garage")
    @todos = [@todo1, @todo2, @todo3, @todo4]
    @list.add(@todo4)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(99) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert(@list.shift.done?)
    refute(@list.remove_at(1).done?)
    assert_raises(IndexError) { @list.mark_done_at(99)}
  end

  def test_undone_done_at
    refute(@todo1.done?)
    @todos.each {|ea| ea.done!}
    assert(@todo1.done?)
    @list.mark_undone_at(0)
    refute(@todo1.done?)
    assert(@todo2.done?)
    assert_raises(IndexError) { @list.mark_undone_at(99)}
  end

  def test_done!
    refute(@todos.any? {|todo| todo.done?})
    @list.done!
    assert(@todos.all? {|todo| todo.done?})
  end
  
  def test_remove_at
    assert_equal(@todos, @list.to_a)
    assert_equal(@todo3, @list.remove_at(2))
    @todos.pop
    assert_equal(@todos, @list.to_a)
    assert_raises(IndexError) { @list.remove_at(99)}
  end

  def test_to_s
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_all_done_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    refute(@list.done?)
    @list.each { |todo| todo.done! }
    assert(@list.done?)
  end

  def test_each_return
    assert_equal(@list, @list.each { nil })
  end

  def test_select
    @todo1.done!
    assert_equal([@todo1], @list.select {|todo| todo.done?}.to_a)
  end

  def test_find_by_title
    assert_equal @todo1, @list.find_by_title("Buy milk")
  end

  def test_all_done
    @todo1.done!
    assert_equal [@todo1], @list.all_done.to_a
  end

  def test_all_not_done
    @todo1.done!
    assert_equal [@todo2, @todo3], @list.all_not_done.to_a
  end
end