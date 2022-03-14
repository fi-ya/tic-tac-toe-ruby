# frozen_string_literal: true

class Player
  attr_reader :marker, :name

  def initalize(marker, name)
    @marker = marker
    @name = name
  end
end
