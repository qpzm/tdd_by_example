require 'minitest/autorun'
require_relative 'money'

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Dollar.new 5
    product = five.times 2
    five.times 2
    assert_equal 10, product.amount

    product = five.times 3
    five.times 3
    assert_equal 15, product.amount
  end

  def test_equality
    assert_equal Dollar.new(5), Dollar.new(5)
    refute_equal Dollar.new(5), Dollar.new(6)
  end
end
