#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player'

puts 'Welcome to a game of Tic-Tac-Toe!'

puts "Enter Player 1's name"
player1 = gets.chomp

while player1.nil? || player1.empty?
  puts 'Please enter your name'
  player1 = gets.chomp
end

puts "Enter Player 2's name"
player2 = gets.chomp

while player2.nil? || player2.empty?
  puts 'Please enter your name'
  player2 = gets.chomp
end

player = Player.new(player1, player2)
player.start

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

def play_again(player)
  option = true
  while option
    puts 'Would you like to start again?'
    puts '1. Yes'
    puts '2. No'
    choice = gets.chomp.to_i

    case choice
    when 1
      option = false
      player.start
    when 2
      option = false
      exit
    else
      puts 'Please enter a valid choice'
    end
  end
end

while player.game_on
  display_board(player.board)
  puts "#{player.display_name}: Please enter box number:-"
  box = gets.chomp.to_i

  while player.check_input(box)
    puts "#{player.display_name}: Only enter a number from 1-9:-"
    box = gets.chomp.to_i
  end

  while player.receive_inputs(box)
    puts "#{player.display_name}: Only choose an empty box:-"
    box = gets.chomp.to_i
  end
  player.check_status

  if player.condition[:status] == 'win' || player.condition[:status] == 'draw'
    display_board(player.board)
    puts(player.message)
    play_again(player)
  end

  player.switch_player
end
