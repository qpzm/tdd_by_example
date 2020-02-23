require 'minitest/autorun'
require_relative 'money'

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Money.dollar 5
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_equality
    assert_equal Money.dollar(5), Money.dollar(5)
    refute_equal Money.dollar(5), Money.dollar(6)
    refute_equal Money.franc(5), Money.dollar(5)
  end

  def test_currency
    assert_equal "USD", Money.dollar(1).currency
    assert_equal "CHF", Money.franc(1).currency
  end

  def test_addition_between_same_currency
    sum = Money.dollar(5).plus(Money.dollar(5))
    assert_equal Money.dollar(10), sum

    sum = Money.dollar(5).plus(Money.dollar(5))
  end
end
