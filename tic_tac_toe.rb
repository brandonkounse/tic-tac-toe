# frozen_string_literal: true

require './game_board'
require './player'

# Instances of Tic Tac Toe to be played
class TicTacToe
  attr_accessor :game_over, :game_won

  def initialize
    @game_over = false
    @game_won = false
  end

  def list_players(player1, player2)
    puts "\n#{player1.name}: #{player1.piece}  |  #{player2.name}: #{player2.piece}"
  end

  def take_turn(player, board)
    player.place_piece
    if board.square_available?(player.selection)
      board.update_board_spaces(player.selection, player.piece)
    else
      take_turn(player, board)
    end
  end

  def three_in_row?(player, board)
    board.winning_spaces.each do |check|
      @game_won = true if check.all?(player.piece)
    end
  end

  def end_game?(board, game)
    if board.board_full?
      game.game_over = true
      board.draw_board
    elsif @game_won == true
      game.game_over = true
      board.draw_board
    else
      game.game_over = false
    end
  end

  def victory(player)
    if @game_won == true
      puts "#{player.name} is the winner!"
    elsif @game_over == true
      puts 'The game is a tie!'
    else
      system 'clear'
    end
  end

  def game_loop(player, board, game)
    board.draw_board
    game.take_turn(player, board)
    board.update_winning_spaces(player)
    game.three_in_row?(player, board)
    game.end_game?(board, game)
    victory(player)
  end
end
