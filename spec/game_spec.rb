require 'game'
require 'board'
require 'display'
require 'input_validation'
require 'message'
require 'human_player'
require 'computer_player'
require 'player'

describe Game do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:input_validation) { InputValidation.new }
  let(:display) { Display.new(message, board, input_validation) }
  let(:player1) { ComputerPlayer.new('X', 'Computer', display) }
  let(:player2) { HumanPlayer.new('O', 'Human', display) }
  subject(:game) { described_class.new(board, display, player1, player2) }

  context 'moves are verified' do
    it 'should verify if move is not valid if player picks zero' do
      expect(game.valid_move?(0)).to eq(false)
    end

    it 'should verify if move valid if player picks 6' do
      expect(game.valid_move?(6)).to eq(true)
    end

    it 'should verify no more moves allowed after 9 turns' do
      dummy_full_board

      expect(game.take_turn).to eq(display.print_message("\nIt's a tie. Game Over!\n\n"))
    end

    it 'should show an error message when invalid move' do
      expect { game.play_turn('X', 0) }.to output("\nInvalid move. Try again\n\n").to_stdout
    end
  end

  context 'correct game status messages' do
    it 'should print game won message ' do
      expect do
        board.grid = %w[X X X O 5 6 O 8 9]
        game.game_status
      end.to output("\nPlayer X wins!\n\n").to_stdout
    end

    it 'should print game tied message ' do
      expect do
        board.grid = %w[X O X X O X O X O]
        game.game_status
      end.to output("\nIt's a tie. Game Over!\n\n").to_stdout
    end
  end

  context 'set and update current player correctly' do
    it 'should update current player marker correctly to O' do
      board.grid = %w[X 2 3 4 5 6 7 8 9]
      game.update_current_player

      expect(game.current_player.marker).to eq('O')
    end

    it 'should update current player marker correctly to X' do
      board.grid = %w[X O 3 4 5 6 7 8 9]

      expect(game.current_player.marker).to eq('X')
    end
  end

  it 'should correctly identify winning player and return X marker' do
    board.grid = %w[X X X O 5 6 O 8 9]

    expect(game.winning_player).to eq('X')
  end

  it 'should correctly identify winning player and return O marker' do
    board.grid = %w[O O O X 5 6 X 8 9]

    expect(game.winning_player).to eq('O')
  end

  def dummy_full_board
    game.play_turn('X', 1)
    game.play_turn('O', 2)
    game.play_turn('X', 3)
    game.play_turn('O', 4)
    game.play_turn('X', 5)
    game.play_turn('O', 6)
    game.play_turn('X', 7)
    game.play_turn('O', 8)
    game.play_turn('X', 9)
  end
end
