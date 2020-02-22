class Money
  def initialize(amount)
    @amount = amount
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  def ==(other)
    amount == other.amount && self.class == other.class
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  protected

  attr_reader :amount
end

class Dollar < Money; end
class Franc < Money; end
