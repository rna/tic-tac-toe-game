#!/usr/bin/env ruby
# frozen_string_literal: true

board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
active_player = 1
# result = false

counter = 0

while counter
  if active_player.odd?
    puts "Player-#{active_player}: Please enter box number:-"
    box = gets.chomp.to_i
    arr = box > 6 ? 2 : (box > 3 ? 1 : 0)
    board[arr][box] = 'X'
    active_player += 1
    counter += 1
    print board
  end

  next unless active_player.even?
    puts "Player-#{active_player}: Please enter box number:-"
    box = gets.chomp.to_i
    arr = box > 6 ? 2 : (box > 3 ? 1 : 0)
    board[arr][box] = 'O'
    active_player -= 1
    counter += 1
    print board
end
