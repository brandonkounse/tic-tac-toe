# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Instances of Tic Tac Toe to be played
class TicTacToe
  attr_reader :game_over, :game_won, :player_one, :player_two, :board

  def initialize
    @game_over = false
    @game_won = false
    @player_one = Player.new('Player 1', 'X')
    @player_two = Player.new('Player 2', 'O')
    @board = Board.new
  end

  def game_loop
    @board.draw
    game.take_turn(@player_one)
    board.update_winning_combinations(player)
    game.three_in_row?(player, board)
    game.end_game?(board, game)
    victory(player)
  end

  def list_players
    puts "\n#{@player_one.name}: #{@player_one.piece}  |  #{@player_two.name}: #{@player_two.piece}"
  end

  def take_turn(player)
    player.pick_square
    take_turn(player) unless @board.update_square(player.piece) == true
  end

  def three_in_row?(player, board)
    board.winning_combinations.each do |check|
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
    if @game_over == true && @game_won == false
      puts 'The game is a tie!'
    elsif @game_won == true
      puts "#{player.name} is the winner!"
    else
      system 'clear'
    end
  end
end
