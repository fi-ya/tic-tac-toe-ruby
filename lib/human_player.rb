# frozen_string_literal: true

require_relative 'player'
require_relative 'display'
class HumanPlayer < Player
  attr_accessor :marker, :name, :display

  def initialize(marker, name, display)
    @marker = marker
    @name = name
    @display = display
  end

  def get_move
    display.get_player_input
  end
end
