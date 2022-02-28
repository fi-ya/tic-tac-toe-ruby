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
 
        it "should display an X in the top level corner" do
            # Given - Arrange
            new_board = Board.new
            # When - Act
            new_board.place_X(0)
            # Then - Assert
            output = new_board.generate_board()
            expect(output).to eq(" X |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

            it "should display an X in the top middle row" do
            # Given - Arrange
            new_board = Board.new
            # When - Act
            new_board.place_X(1)
            # Then - Assert
            output = new_board.generate_board()
            expect(output).to eq("   | X |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

        it "should display an X in the top middle row" do
            # Given - Arrange
            new_board = Board.new
            # When - Act
            new_board.place_X(2)
            # Then - Assert
            output = new_board.generate_board()
            expect(output).to eq("   |   | X \n-----------\n   |   |   \n-----------\n   |   |   \n")
        end

    end

end