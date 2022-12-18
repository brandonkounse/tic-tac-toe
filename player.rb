# frozen_string_literal: true

# create player for game session
class Player
  class << self
    attr_accessor :pieces
  end

  attr_accessor :name, :game_piece, :player_number

  def initialize(player)
    self.player_number = player
  end

  def player_info
    print "Enter player #{player_number} name: "
    self.name = gets.chomp
  end

  def x_or_o
    puts "Please pick X or O for player #{player_number}: "
    self.game_piece = gets.chomp.upcase
    x_or_o unless game_piece == 'X' || game_piece == 'O'
  end

  def different_player_pieces?
    if Player.pieces.nil?
      x_or_o
      Player.pieces = [game_piece]
    elsif Player.pieces.include?('X')
      self.game_piece = 'O'
      Player.pieces.push(game_piece)
    else
      self.game_piece = 'X'
      Player.pieces.push(game_piece)
    end
  end
end
