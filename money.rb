# frozen_string_literal: true
class Money
  attr_reader :currency

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
    Money.new(amount + other.amount, currency)
  end

  protected

  attr_reader :amount
end
