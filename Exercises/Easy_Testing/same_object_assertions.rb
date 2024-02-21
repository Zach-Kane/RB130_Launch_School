require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def setup
    @value1 = "What is this?"
    @value2 = "Not this"
  end

  def test_same_object
    assert_same(@value1, @value2)
  end
end