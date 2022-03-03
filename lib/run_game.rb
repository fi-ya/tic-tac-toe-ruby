require_relative "board"

def start_game
    new_board = Board.new 
    new_board.game_setup
    new_board.turn
end

start_game