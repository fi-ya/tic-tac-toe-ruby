require_relative "board"

class Display

    def initialize(board)
     @board = board
    end

        # to array add new character string at pos 2, 5 8
        # array to string 
        # split string at pos 2 - now rows
            def add_grid(board)
                # board.map { |space| space.push}
            end
        
            def array_string
                @board.join()
            end
            
            def split_to_row(board_string)
            board_string
            end
end

    # def display_board(grid)
    #     puts "
    #     #{grid[0]} | #{grid[1]} | #{grid[2]}
    #     ---------
    #     #{grid[3]} | #{grid[4]} | #{grid[5]}
    #     ---------
    #     #{grid[6]} | #{grid[7]} | #{grid[8]}"
    # end

    # board = Board.new.board
    #     new_display = Display.new(board)
            # p display_board(new_display)
    



