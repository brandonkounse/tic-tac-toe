# frozen_string_literal: true

# Store player name and piece information
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def pick_square
    gets.chomp
  end
end
