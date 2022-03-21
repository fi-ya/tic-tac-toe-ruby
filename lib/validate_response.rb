# frozen_string_literal: true

class ValidateResponse
  VALID_GAME_MODES = [1, 2].freeze
  VALID_PLAY_AGAIN = [1, 2].freeze

  def game_mode?(choice)
    VALID_GAME_MODES.include?(choice)
  end

  def play_again?(choice)
    VALID_PLAY_AGAIN.include?(choice)
  end

  def single_char?(marker)
    marker.length != 1 
  end

  def is_number?(marker)
    [0,1,2,3,4,5,6,7,8,9].include?(marker)
  end

  def is_comp_marker?(marker)
    marker == "#"
  end

  # if custom_marker1.length != 1 
  #   print_error_custom_marker
  #   custom_marker1_choice
  # elsif is_number?(custom_marker1) 
  #   print_error_number_custom_marker
  #   custom_marker1_choice
  # elsif custom_marker1 == "#" 
  #   print_error_computer_taken_marker
  #   custom_marker1_choice

end
