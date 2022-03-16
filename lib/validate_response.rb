class ValidateResponse

    VALID_GAME_MODES = [1,2]

    def game_mode?(choice)
        VALID_GAME_MODES.include?(choice)
    end

end