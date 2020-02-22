# frozen_string_literal: true
class Money
  attr_reader :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def self.dollar(amount)
    Dollar.new(amount, "USD")
  end

  def self.franc(amount)
    Franc.new(amount, "CHF")
  end

  def ==(other)
    amount == other.amount && self.class == other.class
  end

  protected

  attr_reader :amount
end

class Dollar < Money
  def times(multiplier)
    Money.dollar(amount * multiplier)
  end
end

class Franc < Money
  def times(multiplier)
    Money.franc(amount * multiplier)
  end
end
