class Bank
  attr_reader :money

  @@bank = 0

  def initialize
    @money = 100
  end

  def rate
    @money -= 10
    @@bank += 10
  end

  def draw
    @money += 10
    @@bank -= 10
  end

  def winning
    @money += @@bank
    @@bank = 0
  end
end
