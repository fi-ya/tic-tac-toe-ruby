# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'display'
class ComputerPlayer < Player
  attr_accessor :marker, :name, :board, :display

  def initialize(marker, name, board, display)
    @marker = marker
    @name = name
    @board = board
    @display = display
  end

  def get_move
    player_move = board.available_moves[0].to_i
    display.print_players_move(board.available_moves[0].to_i)
    player_move
  end
end
