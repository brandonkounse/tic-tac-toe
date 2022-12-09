# frozen_string_literal: true

class Player
  @@players = []

  def initialize(player, _x_or_o)
    @@players += player
  end
end
