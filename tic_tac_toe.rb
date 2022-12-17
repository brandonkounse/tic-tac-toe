# frozen_string_literal: true

require './game_board'
require './player'

p1 = Player.new(1)
p2 = Player.new(2)
p1.player_info
p2.player_info
p1.different_player_pieces?
p2.different_player_pieces?

game = GameBoard.new(p1, p2)
game.game_loop
