# frozen_string_literal: true

# create game board which will update X and O position
class GameBoard
  attr_accessor :top_row, :middle_row, :bottom_row

  def initialize
    @top_row = [1, 2, 3]
    @middle_row = [4, 5, 6]
    @bottom_row = [7, 8, 9]
  end

  def display_player_pieces(player_one, player_two)
    puts "\n#{player_one.name}: #{player_one.game_piece} | #{player_two.name}: #{player_two.game_piece}"
  end

  def display_game_board
    puts "\n  1  |  2  |  3  "
    print '------------------'
    puts "\n  4  |  5  |  6  "
    print '------------------'
    puts "\n  7  |  8  |  9  \n"
  end

  def update_game_board
    
  end
end
