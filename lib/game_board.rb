# frozen_string_literal: true

# Game board to play X's and O's
class GameBoard
  attr_accessor :game_board, :board_spaces
  attr_reader :winning_spaces

  def initialize
    @board_spaces = [*1..9]
    @winning_spaces = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def draw_board
    puts "\n #{@board_spaces[0..2].join(' | ')}"
    puts "-----------\n"
    puts " #{@board_spaces[3..5].join(' | ')}"
    puts "-----------\n"
    puts " #{@board_spaces[6..8].join(' | ')}\n\n"
  end

  def update_board_spaces(selection, piece)
    @board_spaces[selection - 1] = piece
  end

  def update_winning_spaces(player)
    @winning_spaces.each do |set|
      set.map! do |space|
        if space == player.selection
          player.piece
        else
          space
        end
      end
    end
  end

  def square_available?(selection)
    if @board_spaces[selection - 1].is_a? Numeric
      true
    else
      puts "\nThat square is already occupied!!\n\n"
      false
    end
  end

  def board_full?
    if @board_spaces.all? { |spaces| spaces.is_a? String }
      true
    else
      false
    end
  end
end
