# frozen_string_literal: true

class ValidateResponse
  VALID_GAME_MODES = [1, 2].freeze
  VALID_PLAY_AGAIN = [1, 2].freeze
  VALID_CUSTOM_MARKER_LENGTH = 1
  COMPUTER_MARKER = "#"

  def game_mode?(choice)
    VALID_GAME_MODES.include?(choice)
  end

  def play_again?(choice)
    VALID_PLAY_AGAIN.include?(choice)
  end

  def is_not_single_char?(marker)
    marker.length != VALID_CUSTOM_MARKER_LENGTH
  end

  def is_number?(marker)
    marker.count("0-9") > 0
  end

  def is_comp_marker?(marker)
    marker == COMPUTER_MARKER 
  end

  def valid_custom_marker?(marker)
    !is_not_single_char?(marker) && !is_number?(marker) && !is_comp_marker?(marker)
  end

  def valid_custom_marker2?(custom_marker2, custom_marker1)
    valid_custom_marker?(custom_marker2) && !marker_taken?(custom_marker2, custom_marker1)
  end

  def marker_taken?(custom_marker2, custom_marker1)
    custom_marker2 == custom_marker1
  end

end
