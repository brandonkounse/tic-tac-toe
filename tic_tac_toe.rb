# frozen_string_literal: true

require './game_board'
require './player'

# Instances of Tic Tac Toe to be played
class TicTacToe
  attr_reader :p1, :p2, :board, :game_over

  def initialize(player1, player2, board)
    @p1 = player1
    @p2 = player2
    @board = board
    @game_over = false
  end

  def player_turn?(player)
    return true unless player.turn == false
  end

  def change_turns(player)
    player.turn = !player.turn
    # player2.turn = !player2.turn
  end

  def game_turn(player)
    player_turn?(player)
    player.place_piece
    @board.square_available?(player.selection)
    @board.update_board(player.selection, player.piece)
    change_turns(player)
  end
end

p1 = Player.new('Player 1', 'X', true)
p2 = Player.new('Player 2', 'O', false)
board = GameBoard.new
game = TicTacToe.new(p1, p2, board)

until game.game_over == true
  game.game_turn(p1)
  game.game_turn(p2)
end
