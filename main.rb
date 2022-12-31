# frozen_string_literal: true

require './player'
require './game_board'
require './tic_tac_toe'

p1 = Player.new('Player 1', 'X')
p2 = Player.new('Player 2', 'O')
board = GameBoard.new
game = TicTacToe.new

while game.game_over == false
  game.list_players(p1, p2)
  game.game_loop(p1, board, game)
  break unless game.game_over == false

  game.list_players(p1, p2)
  game.game_loop(p2, board, game)
end
