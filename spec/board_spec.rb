require "board"

describe Board do 

    before :each do
        @new_board = Board.new
      end

    context "initialize" do
        it "method returns the string with correct number of index" do
            expect(@new_board.board).to eq(["-","-","-","-","-","-","-","-","-"])
            expect(@new_board.board.length).to eq(9)
        end 

        it "should display the board" do
            output = @new_board.generate_board()
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end   
 
        it "should display an X in the top level corner" do
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

    end

end