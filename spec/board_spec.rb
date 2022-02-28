require "board"

describe Board do 

    context "initialize" do
        it "method returns the string with correct number of index" do
            new_board = Board.new
            expect(new_board.board).to eq(["-","-","-","-","-","-","-","-","-"])
            expect(new_board.board.length).to eq(9)
        end 





    end

end