require "board"

describe Board do 

    before { @new_board = Board.new }

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

    context "players take turns" do
        
        it "displays player X marker in top left and player O marker bottom right" do
            
            play_turn_1 = @new_board.play_turn("X", 0)
            play_turn_2 = @new_board.play_turn("0", 8)
            
            output = @new_board.generate_board()
            expect(output).to eq(" X |   |   \n-----------\n   |   |   \n-----------\n   |   | 0 \n")
        end

        it "checks to see if position is taken returns true" do
            play_turn_1 = @new_board.play_turn("X", 0)

            output = @new_board.position_taken?(0)
            expect(output).to eq(true)
        end

        it "checks to see if position is taken returns false" do
            play_turn_1 = @new_board.play_turn("X", 0)
            play_turn_2 = @new_board.play_turn("0", 8)

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

        xit "error message when invaild move" do
            output = @new_board.play_turn("X", 9)
            expect(output).to eq("\n Invalid move. Try again\n\n")
        end

        it "if player picks 4 move is vaild and board updates" do
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
            play_turn_2 = @new_board.play_turn("0", 1)
            output = @new_board.turn_count
            expect(output).to eq(2)
        end
        
        # xit "verify after 3rd turn goes back to first player" do
        # end
    end

    context "console messages" do 
       
        it "displays correct welcome message" do
            output = @new_board.welcome_msg
            expect(output).to eq("\n Let's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n")
        end
        
        it "displays correct enter number instruction" do
            output = @new_board.enter_num_msg
            expect(output).to eq("\n Enter a number between 0-8\n\n")
        end

        it "displays invalid move message" do
            output = @new_board.invalid_move_msg
            expect(output).to eq("\n Invalid move. Try again\n\n")
        end

        it "displays game over message" do
            output = @new_board.game_over_msg
            expect(output).to eq("\n Game Over!\n\n")
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