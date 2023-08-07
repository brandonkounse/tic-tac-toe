require 'spec_helper'
require_relative '../lib/board'

describe Board do
  context 'when updating an available board square' do
    it 'replaces number with player piece' do
      player_selection = 1
      player_piece = 'x'
      expect { subject.update_square(player_selection, player_piece) }.to change { subject.squares[player_selection - 1] }.to(player_piece)
    end

    it 'replaces another number with player piece' do
      player_selection = 5
      player_piece = 'o'
      expect { subject.update_square(player_selection, player_piece) }.to change { subject.squares[player_selection - 1] }.to(player_piece)
    end
  end

  context 'when updating a square that\'s already taken' do
    subject(:board) { described_class.new }

    it 'returns square occupied message if square is occupied' do
      board.squares[0] = 'x'
      player_selection = 1
      player_piece = 'o'

      expect { board.update_square(player_selection, player_piece) }.to output("\nThat square is already occupied!!\n\n").to_stdout
    end
  end

  context 'when the board is full' do
    subject(:full_board) { described_class.new }

    before do
      full_board.squares.map! { |square| square = 'x' }
    end

    it 'returns true if board is full' do
      expect(full_board.full?).to be true
    end
  end

  context 'when the board is not full' do
    subject(:partial_board) { described_class.new }

    it 'returns false if board is not full' do
      partial_board.squares[0] = 'x'
      expect(partial_board.full?).to be false
    end
  end
end
