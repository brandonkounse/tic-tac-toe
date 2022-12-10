# frozen_string_literal: true

$LOAD_PATH << '.'
require 'game_board'
require 'players'

p1 = Players.new(1)
p2 = Players.new(2)
p1.player_info
p2.player_info
p1.update_player_pieces
p2.update_player_pieces
puts "player pieces are #{Players.pieces}"
puts "player 1 is #{p1.game_piece} and player 2 is #{p2.game_piece}"
