require 'minitest/autorun'
require_relative 'money'

class DollarTest < Minitest::Test
  def test_multiplication
    five = Money.dollar 5
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_equality
    assert_equal Money.dollar(5), Money.dollar(5)
    refute_equal Money.dollar(5), Money.dollar(6)
  end
end

class FrancTest < Minitest::Test
  def test_multiplication
    five = Money.franc 5
    assert_equal Money.franc(10), five.times(2)
    assert_equal Money.franc(15), five.times(3)
  end

  def test_equality
    assert_equal Money.franc(5), Money.franc(5)
    refute_equal Money.franc(5), Money.franc(6)
  end

  def test_equality_with_dollar
    refute_equal Money.franc(5), Money.dollar(5)
  end
end
