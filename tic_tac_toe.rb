# frozen_string_literal: true

# create players for game session
class Players
  attr_accessor :name, :game_piece

  def initialize
    puts 'Enter player name: '
    self.name = gets.chomp
  end

  def x_or_o
    puts 'Please pick X or O for first player'
    self.game_piece = gets.chomp.upcase
    x_or_o unless game_piece == 'X' || game_piece == 'O'
  end
end

p1 = Players.new
p1.x_or_o
puts p1.game_piece
