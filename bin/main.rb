#!/usr/bin/env ruby
# frozen_string_literal: true

$board

def display_board
  puts '----------------'
  $board.each do |sub|
    sub.each do |c|
      print "| #{c} |"
    end
    puts ' '
  end
  puts '----------------'
end

def game
  $board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  active_player = 1
  # result = false

  counter = 0
  endgame = false

  while counter < 9

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
    $board[arr][cell] = active_player.even? ? 'O' : 'X'
    counter += 1  
    
    # Checking the game winning status
    # Horizontal Win check

    $board.each do |sub|
      if sub.all? { |e| e == 'O' }
        display_board
        endgame = true
        puts 'Player 2 wins'
        break
      elsif sub.all? { |e| e == 'X' }
        display_board
        endgame = true
        puts 'Player 1 wins'
        break
      elsif counter >= 9
        display_board
        puts 'Game is drawn'
        break
      else
        display_board
        break
      end
    end
    puts '----------------'

    if active_player.even?
      active_player -= 1
    else
      active_player += 1
    end

    if endgame
      break
    end
  end
end


game

puts "Would you like to start again?"
puts "1. Yes"
puts "2. No"
choice = gets.chomp.to_i

case choice
  when 1
    game
  when 2
    exit
  else
    puts "Please enter a valid choice"
end