class Game
  include Interface

  attr_reader :player, :dealer

  def initialize
    @dealer = Dealer.new
  end

  def run
    start_game
  end

  private

  def start_game
    @player = Player.new(enter_name)
    game_logic
    begin
      restart_information
      check = gets.chomp.to_s
      case check
      when '1'
        reset
        game_logic
      when '0'
        break
      end
    end while enough_money? || ! check == '0'
  end

  def game_logic
    player.bank.rate
    dealer.bank.rate
    add_card_player(2, player)
    data_player(player)
    add_card_player(2, dealer)
    hidden_information(dealer)
    select_option
    check = gets.chomp.to_s
    if check == '1'
      dealer.skip_or_add
      calculation_results
    elsif check == '2'
      add_card_player(1, player)
      data_player(player)
      dealer.skip_or_add
      calculation_results
    elsif check == '3'
      calculation_results
    end
    puts "Деньги игрока: #{player.bank.money}$"
    puts "Деньги дилера: #{dealer.bank.money}$"
  end

  def reset
    dealer.deck.update_deck
    player.zeroize_points
    dealer.zeroize_points
    player.give_cards
    dealer.give_cards
  end

  def add_card_player(quantity, player)
    player.take_cards(dealer.distribute_cards(quantity))
    player.sum_points
  end

  def calculation_results
    data_player(dealer)
    if player_win?
      player.bank.winning
      view_winner(player)
    elsif dealer_win?
      dealer.bank.winning
      view_winner(dealer)
    elsif draw?
      puts 'Ничья'
      player.bank.draw
      dealer.bank.draw
    end
  end

  def enough_money?
    player.bank.money > 0 and dealer.bank.money > 0
  end

  def player_win?
    player.points > dealer.points && player.points <= 21
  end

  def draw?
    player.points == dealer.points
  end

  def dealer_win?
    ! player_win? && ! draw?
  end
end
