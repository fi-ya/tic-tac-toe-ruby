# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'display'
class ComputerPlayer < Player
  attr_accessor :marker, :name, :board, :display, :computers_move

  def initialize(marker, name, board, display)
    @marker = marker
    @name = name
    @board = board
    @display = display
  end

  def get_move
    @computers_move = board.available_moves[0].to_i
    display.print_players_move(computers_move)
    computers_move
  end
end
