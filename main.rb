# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/tic_tac_toe'

player_one = Player.new('Player 1', 'X')
player_two = Player.new('Player 2', 'O')
game = TicTacToe.new(player_one, player_two)
game.play
