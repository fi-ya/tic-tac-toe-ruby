require_relative 'display'

class GameMode 
    attr_reader :display
    def initialize(display)
        @display = display
    end

    def choose_game_mode
        display.print_choose_game_mode
        display.game_mode_choice
        display.validate_game_mode_choice
    end

    def setup_game(game_mode_chosen)
     
        # if game_mode_chosen == 1
        #   p " create hvh"
        # else game_mode_chosen == 2
        #   p "create c v h "
        # end
        # p "game.start_game"
    end

end