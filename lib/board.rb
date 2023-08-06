# frozen_string_literal: true

class Board
  attr_reader :squares, :winning_combinations

  def initialize
    @squares = [*1..9]
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def draw
    puts "\n #{@squares[0..2].join(' | ')}"
    puts "-----------\n"
    puts " #{@squares[3..5].join(' | ')}"
    puts "-----------\n"
    puts " #{@squares[6..8].join(' | ')}\n\n"
  end

  def update_square(selection, piece)
    @squares[selection - 1] = piece if square_available?(selection)
  end

  def square_available?(selection)
    if @squares[selection - 1].is_a? Numeric
      true
    else
      puts "\nThat square is already occupied!!\n\n"
      false
    end
  end

  def full?
    return false if @squares.any? { |square| square.is_a? Numeric }

    true
  end
end
