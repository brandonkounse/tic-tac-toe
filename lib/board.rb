# frozen_string_literal: true

class Board
  attr_reader :board_squares, :winning_combinations

  def initialize
    @board_squares = [*1..9]
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def draw_board
    puts "\n #{@board_squares[0..2].join(' | ')}"
    puts "-----------\n"
    puts " #{@board_squares[3..5].join(' | ')}"
    puts "-----------\n"
    puts " #{@board_squares[6..8].join(' | ')}\n\n"
  end

  def update_board_squares(selection, piece)
    @board_squares[selection - 1] = piece if square_available?(selection)
  end

  def update_winning_combinations(player)
    @winning_combinations.each do |set|
      set.map! do |space|
        if space == player.selection
          player.piece
        else
          space
        end
      end
    end
  end

  def board_full?
    if @board_squares.all? { |spaces| spaces.is_a? String }
      true
    else
      false
    end
  end

  private

  def square_available?(selection)
    if @board_squares[selection - 1].is_a? Numeric
      true
    else
      puts "\nThat square is already occupied!!\n\n"
      false
    end
  end
end
