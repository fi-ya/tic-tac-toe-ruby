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
end
