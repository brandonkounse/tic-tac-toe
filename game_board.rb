# frozen_string_literal: true

# Game board to play X's and O's
class GameBoard
  attr_accessor :game_board, :board_spaces

  def initialize
    @board_spaces = [*1..9]
    draw_board
  end

  def draw_board
    puts "\n #{@board_spaces[0..2].join(' | ')}"
    puts "-----------\n"
    puts " #{@board_spaces[3..5].join(' | ')}"
    puts "-----------\n"
    puts " #{@board_spaces[6..8].join(' | ')}\n\n"
  end

  def update_board(selection, piece)
    @board_spaces[selection - 1] = piece
    draw_board
  end

  def square_available?(selection)
    if @board_spaces[selection].is_a? Numeric
      true
    else
      puts 'That square is already occupied'
      false
    end
  end
end
