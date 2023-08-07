require 'spec_helper'
require_relative '../lib/tic_tac_toe'

describe TicTacToe, 'game behavior' do
  subject(:game) { described_class.new(Player.new('Player 1', 'X'), Player.new('Player 2', 'O')) }
  let(:player1) { game.player_one }
  let(:player2) { game.player_two }

  context 'when a player takes a turn with valid input' do
    let(:board) { game.board }

    it 'updates square 1 with X' do
      allow(player1).to receive(:pick_square).and_return('1')
      expect { game.take_turn(player1) }.to change { board.squares[0] }.to('X')
    end

    it 'updates square 2 with O' do
      allow(player2).to receive(:pick_square).and_return('2')
      expect { game.take_turn(player2) }.to change { board.squares[1] }.to('O')
    end
  end

  context 'when a player takes a turn with invalid input' do
    it 'returns error with input %' do
      allow(player1).to receive(:pick_square).and_return('%', '1')
      expect { game.take_turn(player1) }.to output("Please enter a valid square!\n").to_stdout
    end

    it 'returns error with input 33' do
      allow(player2).to receive(:pick_square).and_return('33', '4')
      expect { game.take_turn(player2) }.to output("Please enter a valid square!\n").to_stdout
    end

    it 'returns error with input of 0' do
      allow(player1).to receive(:pick_square).and_return('0', '7')
      expect { game.take_turn(player1) }.to output("Please enter a valid square!\n").to_stdout
    end

    it 'returns error with input of -17' do
      allow(player2).to receive(:pick_square).and_return('-17', '5')
      expect { game.take_turn(player2) }.to output("Please enter a valid square!\n").to_stdout
    end
  end

  context 'when checking for three in a row' do
    let(:board) { game.board }

    it 'returns true for top horizontal row' do
      board.instance_variable_set(:@squares, ['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      expect(game.three_in_row?(player1)).to be true
    end

    it 'returns true for diagonal' do
      board.instance_variable_set(:@squares, ['O', 2, 3, 4, 'O', 6, 7, 8, 'O'])
      expect(game.three_in_row?(player2)).to be true
    end

    it 'returns true for anti-diagonal' do
      board.instance_variable_set(:@squares, [1, 2, 'X', 4, 'X', 6, 'X', 8, 9])
    end

    it 'returns true for bottom horizontal row' do
      board.instance_variable_set(:@squares, [1, 2, 3, 4, 5, 6, 'X', 'X', 'X'])
      expect(game.three_in_row?(player1)).to be true
    end

    it 'returns true for right column' do
      board.instance_variable_set(:@squares, [1, 2, 'O', 4, 5, 'O', 7, 8, 'O'])
      expect(game.three_in_row?(player2)).to be true
    end
  end
end
