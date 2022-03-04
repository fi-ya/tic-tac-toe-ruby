require "board"

describe Board do 

    before { @new_board = Board.new(Message.new) }

    context "display a board" do
    
        it "should display the board" do
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end   
 
        it "should display correct player marker in the top left corner" do
            verify_top_left('X', 0)
            verify_top_left('O', 0)
        end

        it "should display an X in the top middle row" do
            @new_board.place_player("X", 1)
            output = @new_board.generate_board()
            expect(output).to eq("   | X |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the top right row" do
            @new_board.place_player("X", 2)
            output = @new_board.generate_board()
            expect(output).to eq("   |   | X \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the middle left row" do
            @new_board.place_player("X", 3)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n X |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the middle middle row" do
            @new_board.place_player("X", 4)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   | X |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the middle right row" do
            @new_board.place_player("X", 5)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   | X \n-----------\n   |   |   \n")
        end

        it "should display an X in the bottom left row" do
            @new_board.place_player("X", 6)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n X |   |   \n")
        end

        it "should display an X in the bottom middle row" do
            @new_board.place_player("X", 7)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   | X |   \n")
        end

        it "should display correct players marker in the bottom right row" do
            verify_bottom_right('X')
            verify_bottom_right('O')
        end

    end

    context "players take turns and marks the board" do
        
        it "displays player X marker in top left and player O marker bottom right" do
            play_turn_1 = @new_board.play_turn("X", 0)
            play_turn_2 = @new_board.play_turn("O", 8)
            
            output = @new_board.generate_board()
            expect(output).to eq(" X |   |   \n-----------\n   |   |   \n-----------\n   |   | O \n")
        end

        it "checks to see if position is taken returns true" do
            play_turn_1 = @new_board.play_turn("X", 0)

            output = @new_board.position_taken?(0)
            expect(output).to eq(true)
        end

        it "checks to see if position is taken returns false" do
            play_turn_1 = @new_board.play_turn("X", 0)
            play_turn_2 = @new_board.play_turn("O", 8)

            output = @new_board.position_taken?(1)
            expect(output).to eq(false)
        end
        
        it "verifys if move is not valid if player picks 9" do
            output = @new_board.valid_move?(9)
            expect(output).to eq(false)
        end

        it "verify if move valid if player picks 6" do
            output = @new_board.valid_move?(6)
            expect(output).to eq(true)
        end

        it "error message when invalid move" do
            output = @new_board.play_turn("X", 9)
            expected = @new_board.print_to_terminal("\n Invalid move. Try again\n\n")
            expect(output).to eq(expected)
        end

        it "if player picks 4 move is valid and board updates" do
            @new_board.play_turn("X", 4)
            
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   | X |   \n-----------\n   |   |   \n")
        end

        it "keep count of number of turns played returns 1" do
            play_turn_1 = @new_board.play_turn("X", 4)
            
            output = @new_board.turn_count
            expect(output).to eq(1)
        end

        it "keep count of number of turns played returns 2" do
            play_turn_1 = @new_board.play_turn("X", 4)
            play_turn_2 = @new_board.play_turn("O", 1)
            
            output = @new_board.turn_count
            expect(output).to eq(2)
        end

        it "empty board returns correct player mark for initial turn for player X" do
            board = ["", "", "", "", "", "", "", "", "", ""]
            current_player_mark = @new_board.get_player_mark(board)
            expect(current_player_mark).to eq("X")
        end

        it "returns correct player mark on second turn for player O" do
            board = ["", "X", "", "", "", "", "", "", "", ""]
            current_player_mark = @new_board.get_player_mark(board)
            expect(current_player_mark).to eq("O")
        end

        it "returns correct player mark on third turn for player X" do
            board = ["", "X", "O", "", "", "", "", "", "", ""]
            current_player_mark = @new_board.get_player_mark(board)
            expect(current_player_mark).to eq("X")
        end

          it "returns correct player mark on fourth turn for player O" do
            board = ["", "X", "O", "X", "", "", "", "", "", ""]
            current_player_mark = @new_board.get_player_mark(board)
            expect(current_player_mark).to eq("O")
        end

        it "verify no more moves allowed after 9 turns" do 
            play_turn_1 = @new_board.play_turn("X", 0)
            play_turn_2 = @new_board.play_turn("O", 1)
            play_turn_3 = @new_board.play_turn("X", 2)
            play_turn_4 = @new_board.play_turn("O", 3)
            play_turn_5 = @new_board.play_turn("X", 4)
            play_turn_6 = @new_board.play_turn("O", 5)
            play_turn_7 = @new_board.play_turn("X", 6)
            play_turn_8 = @new_board.play_turn("O", 7)
            play_turn_9 = @new_board.play_turn("X", 8)
            
            output = @new_board.turn
            
            expect(output).to eq(@new_board.print_to_terminal("\n Game Over!\n\n"))
        end

    end

    context "prints to terminal" do 
        it "prints a message in the terminal" do 
            # setup exerise verify teardown
            
        end

    end

    # Helper methods
    def verify_top_left(player, index)
        @new_board.place_player(player, 0)
        output = @new_board.generate_board()
        expect(output).to eq(" #{player} |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
    end

    def verify_bottom_right(player)
        @new_board.place_player(player, 8 )
        output = @new_board.generate_board()
        expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   | #{player} \n")
    end
end