class Card
  RANKS = %w{A 2 3 4 5 6 7 8 9 10 J Q K}.freeze
  SUITS = %w{♣ ♥ ♠ ♦}.freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    validate!
  end

  private

  def validate!
    raise "Этот объект не является игральной картой" unless RANKS.include?(@rank.to_s) && SUITS.include?(@suit.to_s)
  end
end
