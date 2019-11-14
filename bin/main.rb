#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/logic"

$game = Game.new

$game.start

def display_board(board)
  puts '----------------'
  board.each do |sub|
    sub.each do |c|
      print "| #{c} |"
    end
    puts ' '
  end
  puts '----------------'
end

def play_again
  puts "Would you like to start again?"
  puts "1. Yes"
  puts "2. No"
  choice = gets.chomp.to_i

  case choice
    when 1
      $game.start
    when 2
      exit
    else
      puts "Please enter a valid choice"
  end
end

while $game.game_on

  display_board($game.board)
  puts "Player-#{$game.active_player}: Please enter box number:-"
  box = gets.chomp.to_i
  $game.receive_inputs(box)
  $game.check_status

  if $game.condition[:status] == 'win'
    display_board($game.board)
    puts "Player #{$game.condition[:player]} wins"
    play_again
  elsif $game.condition[:status] == 'draw'
    display_board($game.board)
    puts 'Game is drawn'
    play_again
  end
  puts '----------------'

  if $game.active_player.even?
    $game.active_player -= 1
  else
    $game.active_player += 1
  end
end
