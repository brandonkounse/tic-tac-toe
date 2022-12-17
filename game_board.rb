# frozen_string_literal: true

# create game board which will update X and O position
class GameBoard
  attr_accessor :game_squares

  def initialize
    @game_squares = {
      top_row: %w[1 2 3],
      middle_row: %w[4 5 6],
      bottom_row: %w[7 8 9]
    }
  end

  def display_player_pieces(player_one, player_two)
    puts "\n#{player_one.name}: #{player_one.game_piece} | #{player_two.name}: #{player_two.game_piece}\n\n"
  end

  def display_game_board(game_squares)
    puts " #{game_squares[:top_row].join(' | ')}"
    puts '-----------'
    puts " #{game_squares[:middle_row].join(' | ')}"
    puts '-----------'
    puts " #{game_squares[:bottom_row].join(' | ')}"
  end

  def update_game_board; end
end
