# frozen_string_literal: true
require 'ostruct'

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

  def reduce(bank, to)
    rate = bank.rate(currency, to)
    Money.new(amount / rate, to)
  end
end

class Bank
  def initialize
    @rates = {}
  end

  def reduce(expr, to)
    expr.reduce(self, to)
  end

  def add_rate(from, to, rate)
    pair = OpenStruct.new(from: from, to: to)
    rates[pair] = rate
  end

  def rate(from, to)
    return 1 if from == to
    pair = OpenStruct.new(from: from, to: to)
    rates[pair]
  end

  private

  attr_reader :rates
end

class Sum
  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
    Money.new(amount, to)
  end
end
