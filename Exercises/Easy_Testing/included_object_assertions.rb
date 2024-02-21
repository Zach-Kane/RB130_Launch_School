# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_includes?
    value = [1, 2, 'xyzz']
    assert_includes(value, 'xyz')
  end
end