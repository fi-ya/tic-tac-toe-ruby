require "board"

describe Board do 

    before :each do
        @new_board = Board.new
      end

    context "initialize" do
       

        it "should display the board" do
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end   
 
        it "should display correct player marker in the top left corner" do
            verify_top_left('X', 0)
            verify_top_left('O', 0)
        end

        def verify_top_left(player, index)
            @new_board.place_player(player, 0)
            output = @new_board.generate_board()
            expect(output).to eq(" #{player} |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
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

        # it "should display an X in the bottom right row" do
        #     @new_board.place_player("X", 8)
        #     output = @new_board.generate_board()
        #     expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   | X \n")
        # end

        it "should display correct players marker in the bottom right row" do
            verify_bottom_right('X')
            verify_bottom_right('O')
        end

        def verify_bottom_right(player)
            @new_board.place_player(player, 8 )
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   | #{player} \n")
        end


    end

end