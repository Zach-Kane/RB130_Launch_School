require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def setup
    @value = "pooba"
  end

  def test_kind_of
    assert_kind_of Numeric, @value
  end
end