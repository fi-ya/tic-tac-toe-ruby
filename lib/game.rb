class Game
    attr_reader :board, 
    
    def initialize(board, display, players)
      @board = board
      @display = display 
      @players = players
    end

    # def display_board
    # @display.display_board(@board.grid)
    # end

end

