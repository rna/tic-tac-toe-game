# frozen_string_literal: true

class Game
  def initialize
    @board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @counter = 0
    @box = 0
    @arr = 0
    @game_on = false
    @condition = {}
  end

  def start
    @board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @game_on = true
  end

  def receive_inputs(box, player) # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
    @box = box
    @arr = if box > 6
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

    if (@board[@arr][cell] == 'X') || (@board[@arr][cell] == 'O')
      true
    else
      @board[@arr][cell] = player
      @counter += 1
      false
    end
  end

  def check_input(box)
    if box > 9 || box < 1
      true
    else
      false
    end
  end

  def check_status
    winning_board = [[@board[0][0], @board[0][1], @board[0][2]],
    [@board[1][0], @board[1][1], @board[1][2]],
    [@board[2][0], @board[2][1], @board[2][2]],
    [@board[0][0], @board[1][0], @board[2][0]],
    [@board[0][1], @board[1][1], @board[2][1]],
    [@board[0][2], @board[1][2], @board[2][2]],
    [@board[0][0], @board[1][1], @board[2][2]],
    [@board[0][2], @board[1][1], @board[2][0]]]
    winning_board.each do |sub|
      if sub.all? { |e| e == 'O' }
        @game_on = false
        @condition = { status: 'win', player: 2 }
        break
      elsif sub.all? { |e| e == 'X' }
        @game_on = false
        @condition = { status: 'win', player: 1 }
        break
      elsif @counter >= 9
        @game_on = false
        @condition = { status: 'draw', player: 0 }
        break
      else
        @condition = { status: 'none', player: 0 }
      end
    end
  end
end
