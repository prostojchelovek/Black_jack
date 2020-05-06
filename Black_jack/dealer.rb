class Dealer < Player
  attr_reader :deck

  def initialize(name = "dealer")
    super
    @deck = Deck.new
  end

  def skip_or_add
    distribute_cards(1) if points < 17 && cards.size >= 2
  end

  def distribute_cards(quantity)
    deck.take_random_cards(quantity)
  end
end
