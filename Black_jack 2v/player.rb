class Player
  attr_reader :name, :cards, :points, :bank, :hand

  def initialize(name)
    @name = name
    @bank = Bank.new
    @hand = Hand.new
  end
end
