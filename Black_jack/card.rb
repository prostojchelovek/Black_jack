class Card
  RANKS = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  SUITS = %w{♣ ♥ ♠ ♦}

  attr_reader :card

  def initialize(card)
    @card = card
  end

  def rank
    card[:ranks]
  end
end
