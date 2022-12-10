# frozen_string_literal: true

# create players for game session
class Players
  class << self
    attr_accessor :pieces
  end

  attr_accessor :name, :game_piece, :player_number

  def initialize(player_x)
    @player_number = player_x
  end

  def player_info
    puts "Enter player #{player_number} name: "
    self.name = gets.chomp
  end

  def x_or_o
    puts "Please pick X or O for #{player_number} player"
    self.game_piece = gets.chomp.upcase
    x_or_o unless game_piece == 'X' || game_piece == 'O'
  end

  def update_player_pieces
    if Players.pieces.nil?
      x_or_o
      Players.pieces = [game_piece]
    elsif Players.pieces.include?('X')
      self.game_piece = 'O'
      Players.pieces += [game_piece]
    else
      self.game_piece = 'X'
      Players.pieces += [game_piece]
    end
  end
end
