require_relative "SimpleNumber"
require "test/unit" 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_simple
    assert_equal(4, SimpleNumber.new(2).add(2) )
    assert_equal(6, SimpleNumber.new(2).multiply(3), "Has fallado")
    assert_equal(9, SimpleNumber.new(3).multiply(3), "Has fallado")
    assert_equal(7, SimpleNumber.new(4).add(3), "Has fallado")
  end
 
end