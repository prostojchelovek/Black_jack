class Player
  attr_reader :name, :cards, :points, :bank

  def initialize(name)
    @name = name
    @bank = Bank.new
    @points = 0
    @cards = []
  end

  def take_cards(cards)
    @cards.concat(cards)
  end

  def sum_points
    @points = 0
    @cards.each do |card|
      if pictures(card.rank)
        @points += 10
      else
        @points += card.rank.to_i
      end
      if card.rank == 'A' && points > 10
        @points += 1
      elsif card.rank == 'A'
        @points +=11
      end
    end
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
