# frozen_string_literal: true

# Provides the interaction between player and game board
module GamePlay
  X = 'X'
  O = 'O'

  def player_piece(player)
    if player == 'X'
      @X
    else
      @O
    end
  end

end
