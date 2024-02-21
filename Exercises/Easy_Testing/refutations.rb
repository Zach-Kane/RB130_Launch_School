require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def setup
    @value1 = ['xyz']
  end

  def test_refute_includes
    refute_includes(@value1, 'xyz')
  end
end