require_relative "SimpleNumber"
require "test/unit" 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_simple
    assert_equal(4, SimpleNumber.new(2).add(2) )
    assert_equal(10, SimpleNumber.new(2).multiply(3), "Has fallado")
  end
 
end