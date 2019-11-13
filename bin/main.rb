#!/usr/bin/env ruby
# frozen_string_literal: true

board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
active_player = 1
# result = false

counter = 0

while counter < 9
  if active_player.odd?
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
    board[arr][cell] = 'X'
    active_player += 1
    counter += 1
    puts '----------------'
    board.each do |b|
      b.each do |c|
        print "| #{c} |"
      end
      puts ' '
    end
    puts '----------------'

    # Checking the game winning status
    # Horizontal Win check
    board.each do |sub|
      if sub.all? { |e| e == 'X' }
        puts 'Player 1 wins'
        exit
      end
    end
  end

  next unless active_player.even?

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
  board[arr][cell] = 'O'
  active_player -= 1
  counter += 1
  puts '----------------'
  board.each do |b|
    b.each do |c|
      print "| #{c} |"
    end
    puts ' '
  end
  puts '----------------'

  # Checking the game winning status
  # Horizontal Win check
  board.each do |sub|
    if sub.all? { |e| e == 'O' }
      puts 'Player 2 wins'
      exit
    end
  end
end

puts 'Game is drawn'
