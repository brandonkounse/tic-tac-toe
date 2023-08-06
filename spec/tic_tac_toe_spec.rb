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
    it 'returns error message if input isn\'t X or Y' do
      allow(player1).to receive(:pick_square).and_return('%', '1')
      expect { game.take_turn(player1) }.to output("Please enter a valid square!\n").to_stdout
    end
  end
end
