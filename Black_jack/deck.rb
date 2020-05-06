class Deck
  def initialize
    @stack_of_cards = []
    update_deck
  end

  def update_deck
    @stack_of_cards.clear
    Card::SUITS.each do |suit|
      Card::RANKS.each do |ranks|
        @stack_of_cards << Card.new( ranks: ranks, suit: suit )
      end
    end
  end

  def shuffle_cards
    @stack_of_cards.shuffle!
  end

  def take_random_cards(quantity)
    shuffle_cards
    @stack_of_cards.slice!(0..quantity - 1)
  end
end
