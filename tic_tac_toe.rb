# frozen_string_literal: true

require './game_board'
require './player'
require 'pry-byebug'

# Instances of Tic Tac Toe to be played
class TicTacToe
  attr_accessor :game_over

  def initialize
    @game_over = false
  end
end

p1 = Player.new('Player 1', 'X')
p2 = Player.new('Player 2', 'O')
board = GameBoard.new
game = TicTacToe.new

while game.game_over == false
  board.draw_board
  p1.place_piece
  board.square_available?(p1.selection)
  board.update_board_spaces(p1.selection, p1.piece)
  if board.board_full? then game.game_over = true end
end
