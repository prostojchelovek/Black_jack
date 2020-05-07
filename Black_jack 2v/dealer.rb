class Dealer < Player
  attr_reader :deck

  def initialize(name = "dealer")
    super
  end

  def skip_or_add
    hand.take_cards(hand.distribute_cards(1)) if hand.points < 17
    hand.sum_points
  end

end
