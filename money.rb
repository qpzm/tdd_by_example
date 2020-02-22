class Dollar
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end

  def ==(other)
    amount == other.amount
  end

  protected

  attr_reader :amount
end

class Franc
  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(amount * multiplier)
  end

  def ==(other)
    amount == other.amount
  end

  protected

  attr_reader :amount
end
