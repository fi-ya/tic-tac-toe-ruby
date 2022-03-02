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

    def play_turn(player = "X", index)
        if player == "X" && valid_move?(index)
            place_player("X", index)
        elsif player == "0" && valid_move?(index)
            place_player("0", index)
        else
            "move not valid"
        end
    end

    def position_taken?(index)
        board[index] == "X" || board[index] == "0" 
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8) ? true : false
    end

    def turn_count()
        counter = 0

        board.each do |space|
            if space == "X" || space == "0"
                counter +=1
            end 
        end

        counter
    end

    def print_to_console(msg)
        puts msg
    end

    def print_board_with_msg
        print_to_console(generate_board)
        print_to_console(enter_num_msg)
    end

    def welcome_msg
        "\n Let's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n"
    end

    def enter_num_msg
        "\n Enter a number between 0-8\n\n"
    end
    
    def start_game
        print_to_console(welcome_msg)
        print_board_with_msg
    end

    def player_input
        gets.chomp().to_i
    end

    def turn 
        play_turn(player_input)
        print_board_with_msg
    end
   
end

new_board = Board.new 
new_board.start_game
new_board.turn


# puts "Enter a number between 0-8"
# player_o = gets.chomp().to_i
# p player_o
# turn_2 = new_board.play_turn("O", player_o)
# p turn_2

# puts new_board.generate_board


