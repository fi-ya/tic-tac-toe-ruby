require_relative "messages"

def display_board(board)
    puts row = " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
    puts separator = "-----------"
    puts row = " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
    puts separator
    puts row = " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} " 
    puts ""
end 

def player_input(board, player)
    player_move = gets.chomp.to_i
    move_avail_msg(player_move)
    play_turn(board, player_move, player)
end 

def play_turn(board, index, player)
    if valid_move?(board, index)
        move(board, index, player)
    else
        error_msg
    end
end 

def position_taken?(board, index)
    if board[index] == "X" || board[index] == "0" || board[index] == nil
        return true
    else
        return false
    end
end

def valid_move?(board, index)
    if !position_taken?(board, index) && (index).between?(0,8)
        return true
    else
        return false
    end
end

def move(board,index, player)
    # p index , "index in move method check if int"
    board[index] = player
end

welcome_msg
board = [" "," "," "," "," "," "," "," "," "]
player_x = "X"
player_o = "O"
display_board(board)

enter_number_msg

player_input(board,player_x)
display_board(board)

player_input(board, player_o)
display_board(board)

player_input(board,player_x)
display_board(board)

player_input(board,player_o)
display_board(board)

player_input(board,player_x)
display_board(board)

player_input(board,player_o)
display_board(board)
