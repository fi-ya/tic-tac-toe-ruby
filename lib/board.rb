# frozen_string_literal: true
require_relative 'message'

class Board
  attr_accessor :grid

  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
  end

  def get_player_mark(board)
    if grid.count('X') == grid.count('O')
      'X'
    elsif grid.count('X') > grid.count('O')
      'O'
    else
      'X'
    end
  end


  def available_moves
    available_moves = []
    grid.each do |cell|
      available_moves.push(cell) if cell != 'X' && cell != 'O'
    end
    available_moves
  end

  def board_full?
    available_moves.empty?
  end 

  def place_player(player, index)
    grid[index - 1] = player
  end
end
