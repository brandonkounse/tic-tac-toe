# frozen_string_literal: true

require './game_board'
require './player'
require './game_play'

board = GameBoard.new
p1 = Player.new('Player 1', 'X', true)
p2 = Player.new('Player 2', 'O', false)
board.update_board(3, p1)
board.update_board(5, p2)
