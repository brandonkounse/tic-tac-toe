require 'spec_helper'
require_relative '../lib/board'

describe Board do
  context 'when updating board square' do
    it 'replaces number with player piece' do
      player_selection = 1
      player_piece = 'x'
      expect { subject.update_board_squares(player_selection, player_piece) }.to change { subject.board_squares[player_selection - 1] }.to(player_piece)
    end
  end
end
