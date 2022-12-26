# frozen_string_literal: true

# Store player name and piece information
class Player
  attr_accessor :turn
  attr_reader :name, :piece, :selection

  def initialize(name, piece, turn)
    @name = name
    @piece = piece
    @turn = turn
  end

  def place_piece
    puts "Pick a free square to place #{@piece}"
    @selection = gets.chomp.to_i
  end
end
