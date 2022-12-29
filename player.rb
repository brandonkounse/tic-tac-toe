# frozen_string_literal: true

# Store player name and piece information
class Player
  attr_reader :name, :piece, :selection

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def place_piece
    print "Pick a free square to place #{@piece}: "
    @selection = gets.chomp.to_i
  end
end
