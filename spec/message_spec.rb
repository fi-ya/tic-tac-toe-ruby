require 'message'

describe Message do 

    before { @message = Message.new }

    context "terminal messages" do 
        
        it "should display correct welcome message" do
            output = @message.welcome
            expect(output).to eq("\n Let's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n")
        end
        
        it "should display correct enter number instruction" do
            output = @message.enter_num
            expect(output).to eq("\n Enter a number between 0-8\n\n")
        end

        it "should display invalid move message" do
            output = @message.invalid_move
            expect(output).to eq("\n Invalid move. Try again\n\n")
        end

        it "should display game over message" do
            output = @message.game_over
            expect(output).to eq("\n Game Over!\n\n")
        end
    end

end