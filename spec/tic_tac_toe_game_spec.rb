# frozen_string_literal: true

require_relative '../lib/logic.rb'

RSpec.describe 'Game_Logic' do
  describe '#check_status' do
    it 'returns the game win if the same symbol exists in top row' do
      status = Game.new
      expect(status.game_over()).to eql(true)
    end
  end
end
