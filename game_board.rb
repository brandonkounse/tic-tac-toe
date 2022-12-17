# frozen_string_literal: true

# create game board which will update X and O index_of_square
class GameBoard
  attr_accessor :game_squares, :current_move, :player_one, :player_two

  def initialize(player_one, player_two)
    self.player_one = player_one
    self.player_two = player_two
    self.game_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_player_pieces
    puts "\n#{player_one.name}: #{player_one.game_piece} | #{player_two.name}: #{player_two.game_piece}\n\n"
  end

  def display_game_board
    puts " #{game_squares[0..2].join(' | ')}"
    puts '-----------'
    puts " #{game_squares[3..5].join(' | ')}"
    puts '-----------'
    puts " #{game_squares[6..8].join(' | ')}"
  end

  def add_game_piece
    puts 'Please enter the number for the square you choose: '
    self.current_move = gets.chomp.to_i
    if current_move >= 1 || current_move <= 9
      current_move
    else
      add_game_piece
    end
  end

  def update_board
    position = game_squares.index(current_move)
    game_squares[position] = player_one.game_piece
  end

  def game_loop
    count = 0
    while count < 5
      display_player_pieces
      display_game_board
      add_game_piece
      update_board
      count += 1
    end
  end
end
