# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'display'
class ComputerPlayer < Player
  attr_accessor :marker, :name, :display, :computers_move

  def initialize(marker, name, display)
    @marker = marker
    @name = name
    @display = display
  end

  def get_move
    display.computers_move(marker, name)
  end
end
