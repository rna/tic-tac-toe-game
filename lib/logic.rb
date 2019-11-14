class game
  @@board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]

  def initiate
    @active_player = 1
    @game_on = true
    @counter = 0
  end

  def start_game
    while @game_on
      display_board(board)
      puts "Player-#{active_player}: Please enter box number:-"
      box = gets.chomp.to_i
      arr = if box > 6
              2
            elsif box > 3
              1
            else
              0
            end

      if (box == 1) || (box == 4) || (box == 7)
        cell = 0
      elsif (box == 2) || (box == 5) || (box == 8)
        cell = 1
      elsif (box == 3) || (box == 6) || (box == 9)
        cell = 2
      end
      board[arr][cell] = active_player.even? ? 'O' : 'X'
      counter += 1  
      
      # Checking the game winning status
      # Horizontal Win check

      board.each_with_index do |sub, i|
        if sub.all? { |e| e == 'O' }
          display_board(board)
          game_on = false
          puts 'Player 2 wins'
          play_again
          break
        elsif sub.all? { |e| e == 'X' }
          display_board(board)
          game_on = false
          puts 'Player 1 wins'
          play_again
          break
        elsif counter >= 9
          display_board(board)
          game_on = false
          puts 'Game is drawn'
          play_again
          break
        end
      end
      puts '----------------'

      active_player += 1
    end
  end
end