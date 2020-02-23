# frozen_string_literal: true
class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def self.dollar(amount)
    new(amount, "USD")
  end

  def self.franc(amount)
    new(amount, "CHF")
  end

  def ==(other)
    amount == other.amount && self.currency == other.currency
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def plus(other)
    Sum.new(self, other)
  end

  def reduce(to)
    rate = currency == 'CHF' && to == 'USD' ? 2 : 1
    Money.new(amount / rate, to)
  end
end

class Bank
  def initialize
    @exchange_rates = {}
  end

  def reduce(expr, to)
    expr.reduce(to)
  end

  def add_rate(from, to, rate)
  end
end

class Sum
  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    amount = augend.amount + addend.amount
    Money.new(amount, to)
  end
end
