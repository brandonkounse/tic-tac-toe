# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class TicTacToe
  attr_reader :player_one, :player_two, :board

  def initialize(player_one, player_two, board = Board.new)
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def play
    loop do
      break if handle_turn(@player_one)
      break if @board.full?
      break if handle_turn(@player_two)
      break if @board.full?
    end

    information
    declare_winner
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

  def handle_turn(player)
    information
    print "Please select a square for #{player.piece}: "
    take_turn(player)
    three_in_row?(player)
  end

  def three_in_row?(player)
    @board.winning_combinations.any? do |combo|
      combo.all? { |value| @board.squares[value] == player.piece }
    end
  end

  private

  def valid_input?(player_input)
    return true if (player_input).match?(/\A[1-9]\z/)

    puts 'Please enter a valid square!'
    false
  end

  def information
    system 'clear'
    list_players
    @board.draw
  end

  def list_players
    puts "\n#{@player_one.name}: #{@player_one.piece}  |  #{@player_two.name}: #{@player_two.piece}"
  end

  def declare_winner
    if three_in_row?(@player_one)
      puts "#{@player_one.name} wins!"
    elsif three_in_row?(@player_two)
      puts "#{@player_two.name} wins!"
    else
      puts "It's a draw!"
    end
  end
end
