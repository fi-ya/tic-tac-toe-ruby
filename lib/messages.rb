def welcome_msg
    puts "\n Let's play Tic Tac Toe"
    puts "------------------------\n\n"
end

def enter_number_msg
    puts "Enter number 0-8 "
end

def check_move_avail_msg(player_move)
    puts "You entered #{player_move.to_s}. Lets see if that is available"
end

def error_msg
    puts "Move not available. Try again!"
end