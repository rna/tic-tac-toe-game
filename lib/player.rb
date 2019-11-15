# frozen_string_literal: true

require_relative 'logic'

class Player < Game
  attr_reader :game_on, :board, :condition, :active_player
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @active_player = 1
    super()
  end

  def start
    super()
  end

  def receive_inputs(box)
    super(box, @active_player.even? ? 'O' : 'X')
  end

  def switch_player
    if @active_player.even?
      @active_player -= 1
    else
      @active_player += 1
    end
  end

  def display_name
    @active_player == 1 ? @player1 : @player2
  end

  def message
    if @condition[:status] == 'win'
      "#{@condition[:player] == 1 ? @player1 : @player2} wins!"
    elsif @condition[:status] == 'draw'
      'Game is drawn'
    end
  end

  def check_status
    super()
  end

  def check_input(box)
    super(box)
  end
end
