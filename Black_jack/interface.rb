module Interface
  def enter_name
    puts 'Введите имя'
    gets.chomp.to_s
  end

  def data_player(player)
    puts "Имя: #{player.name}"
    puts "Очки: #{player.points}"
    puts  player.cards.each { |card| puts card.card }
  end

  def hidden_information(dealer)
    puts "Имя: #{dealer.name}"
    puts  dealer.cards.each { |card| puts '*' }
  end

  def restart_information
    puts 'Выберите дальнейшее действие:'
    puts 'Закончить игру - 0'
    puts 'Начать заново - 1'
  end

  def select_option
    puts 'Выберите дальнейшее действие:'
    puts 'Пропустить ход - 1'
    puts 'Добавить карту - 2'
    puts 'Открыть карты - 3'
  end

  def view_winner(player)
    puts "Выиграл #{player.name}"
  end
end
