# frozen_string_literal: true

require_relative '../lib/player.rb'

RSpec.describe 'Game_Logic' do
  describe '#check_status' do
    it 'returns the game win if the same symbol exists in top row' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      player.receive_inputs(1)
      player.switch_player
      player.receive_inputs(4)
      player.switch_player
      player.receive_inputs(2)
      player.switch_player
      player.receive_inputs(5)
      player.switch_player
      player.receive_inputs(3)
      player.check_status
      expect(player.condition[:status]).to eql('win')
    end
    it 'returns the game win if the same symbol exists in diagonally' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      player.receive_inputs(1)
      player.switch_player
      player.receive_inputs(4)
      player.switch_player
      player.receive_inputs(5)
      player.switch_player
      player.receive_inputs(6)
      player.switch_player
      player.receive_inputs(9)
      player.check_status
      expect(player.condition[:status]).to eql('win')
    end
    it 'returns the game draw if all boxes has been filled' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      player.receive_inputs(1)
      player.switch_player
      player.receive_inputs(2)
      player.switch_player
      player.receive_inputs(3)
      player.switch_player
      player.receive_inputs(4)
      player.switch_player
      player.receive_inputs(5)
      player.switch_player
      player.receive_inputs(6)
      player.switch_player
      player.receive_inputs(7)
      player.switch_player
      player.receive_inputs(8)
      player.switch_player
      player.receive_inputs(9)
      player.check_status
      expect(player.condition[:status]).to eql('draw')
    end
  end
  describe '#player_switch' do
    it 'switches players when box is chosen' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      player.receive_inputs(1)
      player.switch_player
      expect(player.active_player).to eql(2)
    end
  end
  describe '#check_input' do
    it 'returns true if input is not between 1 and 9, otherwise returns false' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      expect(player.check_input(10)).to eql(true)
    end
    it 'returns true if input is not between 1 and 9, otherwise returns false' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      expect(player.check_input(6)).to eql(false)
    end
  end
  describe '#receive_input' do
    it 'checks whether user entered number of an already filled box' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      expect(player.receive_inputs(6)).to eql(false)
    end
    it 'checks whether user entered number of an already filled box' do
      player = Player.new('Ramesh', 'Ahmed')
      player.start
      player.receive_inputs(6)
      player.switch_player
      expect(player.receive_inputs(6)).to eql(true)
    end
  end
end
