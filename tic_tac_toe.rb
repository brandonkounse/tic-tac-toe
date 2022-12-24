# frozen_string_literal: true

require './game_board'
require './player'
require './game_play'

# The main game loop
class TicTacToe
  include GamePlay

  def initialize
    game = GameBoard.new
    game.draw_board
    player1 = Player.new('Player 1', player_piece('X'))
    player2 = Player.new('Player 2', player_piece('O'))

    p player1.piece
    p player2.piece
  end
end

game = TicTacToe.new
