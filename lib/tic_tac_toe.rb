# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Instances of Tic Tac Toe to be played
class TicTacToe
  attr_reader :game_over, :game_won, :player_one, :player_two, :board

  def initialize(player_one, player_two, board = Board.new)
    @game_over = false
    @game_won = false
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def game_loop
    @board.draw
    take_turn(@player_one)
    board.update_winning_combinations(player)
    three_in_row?(player, board)
    end_game?(board, game)
    victory(player)
  end

  def list_players
    puts "\n#{@player_one.name}: #{@player_one.piece}  |  #{@player_two.name}: #{@player_two.piece}"
  end

  def take_turn(player)
    loop do
      square = player.pick_square
      if valid_input?(square) && board.square_available?(square.to_i)
        @board.update_square(square.to_i, player.piece)
        break
      end
    end
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

  private

  def valid_input?(player_input)
    return true if (player_input).match?(/[1-9]/)

    puts 'Please enter a valid square!'
    false
  end
end
