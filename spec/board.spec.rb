require 'spec_helper'
require_relative '../lib/board'

describe Board do
  context 'when updating board square' do
    it 'replaces number with player piece' do
      player_selection = 1
      player_piece = 'x'
      expect { subject.update_square(player_selection, player_piece) }.to change { subject.squares[player_selection - 1] }.to(player_piece)
    end

    subject(:board) { described_class.new }

    it 'returns square occupied message if square is occupied' do
      board.squares[0] = 'x'
      player_selection = 1
      player_piece = 'o'

      expect { board.update_square(player_selection, player_piece) }.to output("\nThat square is already occupied!!\n\n").to_stdout
    end
  end
end
