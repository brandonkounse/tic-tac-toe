# frozen_string_literal: true

# Store player name and piece information
class Player
  attr_accessor :turn
  attr_reader :name, :piece

  def initialize(name, piece, turn)
    @name = name
    @piece = piece
    @turn = turn
  end
end
