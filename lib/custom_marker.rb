require_relative 'display'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class CustomMarker 
    attr_reader :display

    def initialize(display)
        @display = display
    end

    def choose_custom_maker
        display.print_ask_custom_marker
    end

end