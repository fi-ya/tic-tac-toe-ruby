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
 
        it "should display an X in the top left corner" do
            @new_board.place_X(0)
            output = @new_board.generate_board()
            expect(output).to eq(" X |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

            it "should display an X in the top middle row" do
            @new_board.place_X(1)
            output = @new_board.generate_board()
            expect(output).to eq("   | X |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the top right row" do
            @new_board.place_X(2)
            output = @new_board.generate_board()
            expect(output).to eq("   |   | X \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the middle left row" do
            @new_board.place_X(3)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n X |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the middle middle row" do
            @new_board.place_X(4)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   | X |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the middle right row" do
            @new_board.place_X(5)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   | X \n-----------\n   |   |   \n")
        end

        it "should display an X in the bottom left row" do
            @new_board.place_X(6)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n X |   |   \n")
        end

        it "should display an X in the bottom middle row" do
            @new_board.place_X(7)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   | X |   \n")
        end

        it "should display an X in the bottom left row" do
            @new_board.place_X(8)
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   | X \n")
        end
    end

end