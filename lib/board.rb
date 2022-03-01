class Board

    attr_accessor :board

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end 

    def generate_board
        " #{@board[0]} | #{@board[1]} | #{@board[2]} \n" + 
        "-----------\n" +
        " #{@board[3]} | #{@board[4]} | #{@board[5]} \n" +
        "-----------\n" +
        " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    end

    def place_player(player, index)
        @board[index] = player
    end

    def play_turn(player, index)
        if player == "X" && valid_move?(index)
            place_player("X", index)
        elsif player == "0" && valid_move?(index)
            place_player("0", index)
        else
            "move not vaild"
        end
    end

    def position_taken?(index)
        if board[index] == "X" || board[index] == "0" 
            return true
        else
            return false
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8) ? true : false
    end

    def turn_count()
        p board, "board in turn count"
        counter = 0
        p counter, "counter in turn count"
        board.each do |space|
            if space == "X" || space == "0"
                counter +=1
            end 
        end
        counter
    end


end

new_board = Board.new 
puts new_board.generate_board





