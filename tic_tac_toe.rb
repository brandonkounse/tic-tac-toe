# frozen_string_literal: true

$LOAD_PATH << '.'
require 'game_board'
require 'player'

p1 = Player.new(1)
p2 = Player.new(2)
p1.player_info
p2.player_info
p1.different_player_pieces?
p2.different_player_pieces?

new_game = GameBoard.new
new_game.display_player_pieces(p1, p2)
new_game.display_game_board(new_game.game_squares)
