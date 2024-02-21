# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_odd?
    assert(2.odd?, 'value not odd')
  end
end