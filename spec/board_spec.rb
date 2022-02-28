require "board"

describe Board do 

    context "initialize" do
        it "method returns the string with correct number of index" do
            new_board = Board.new
            expect(new_board.board).to eq(["-","-","-","-","-","-","-","-","-"])
            expect(new_board.board.length).to eq(9)
        end 

        it "should display the board" do
            # Given - Arrange
            new_board = Board.new
            # When - Act
            output = new_board.generate_board()

            # Then - Assert
            expect(output).to eq("   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end   
 





    end

end