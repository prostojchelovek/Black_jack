class Hand
  attr_reader :points, :cards, :deck

  def initialize
    @cards = []
    @points = 0
    @deck = Deck.new
  end

  def sum_points
    @points = 0
    ace = 0
    @cards.each do |card|
      if pictures(card.rank)
        @points += 10
      elsif card.rank == "A"
        ace += 1
        @points += 1
      else
        @points += card.rank.to_i
      end
    end
    while points <= 11 && ace > 0
      @points += 10
      ace -= 1
    end
  end

  def take_cards(cards)
    @cards.concat(cards)
  end

  def distribute_cards(quantity)
    deck.take_random_cards(quantity)
  end

  def zeroize_points
    @points = 0
  end

  def pictures(card)
    card == 'J' || card == 'Q' || card == 'K'
  end

  def give_cards
    @cards = []
  end
end
