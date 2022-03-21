require 'custom_maker'

describe CustomMarker do
    let(:message) { Message.new }
    let(:board) { Board.new }
    let(:validate_response) { ValidateResponse.new }
    ley(:display) { Display.new(message, board, validate_response) }
  
    subject(:custom_marker) { described_class.new(display) }
    
    

end