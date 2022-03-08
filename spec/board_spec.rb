# frozen_string_literal: true

require 'board'
describe Board do
  before do
    @message = Message.new
    @new_board = Board.new(@message)
  end

  context 'display a board' do
    it 'should display the board' do
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display correct player marker in the top left corner' do
      verify_top_left('X')
      verify_top_left('O')
    end

    it 'should display an X in the top middle row' do
      @new_board.place_player('X', 2)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | X | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the top right row' do
      @new_board.place_player('X', 3)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | X \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle left row' do
      @new_board.place_player('X', 4)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n X | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle middle row' do
      @new_board.place_player('X', 5)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | X | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle right row' do
      @new_board.place_player('X', 6)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | X \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the bottom left row' do
      @new_board.place_player('X', 7)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n X | 8 | 9 \n")
    end

    it 'should display an X in the bottom middle row' do
      @new_board.place_player('X', 8)
      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | X | 9 \n")
    end

    it 'should display correct players marker in the bottom right row' do
      verify_bottom_right('X')
      verify_bottom_right('O')
    end
  end

  context 'players take turns and marks the board' do
    it 'should display player X marker in top left and player O marker bottom right' do
      play_turn_1 = @new_board.play_turn('X', 1)
      play_turn_2 = @new_board.play_turn('O', 9)

      output = @new_board.generate_board
      expect(output).to eq(" X | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | O \n")
    end

    it 'should check to see if position is taken returns true' do
      play_turn_1 = @new_board.play_turn('X', 1)

      output = @new_board.position_taken?(1)
      expect(output).to eq(true)
    end

    it 'should check to see if position is taken returns false' do
      play_turn_1 = @new_board.play_turn('X', 0)
      play_turn_2 = @new_board.play_turn('O', 8)

      output = @new_board.position_taken?(1)
      expect(output).to eq(false)
    end

    it 'should verify if move is not valid if player picks zero' do
      output = @new_board.valid_move?(0)
      expect(output).to eq(false)
    end

    it 'should verify if move valid if player picks 6' do
      output = @new_board.valid_move?(6)
      expect(output).to eq(true)
    end

    it 'should show an error message when invalid move' do
      output = @new_board.play_turn('X', 0)
      expected = @new_board.print_to_terminal("\n Invalid move. Try again\n\n")
      expect(output).to eq(expected)
    end

    it 'should show player mark at position 4 if space is free and move is valid' do
      @new_board.play_turn('X', 4)

      output = @new_board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n X | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should keep track of available moves in an array' do
      play_turn_1 = @new_board.play_turn('X', 4)
      play_turn_2 = @new_board.play_turn('O', 1)

      output = @new_board.available_moves
      expect(output).to eq(%w[2 3 5 6 7 8 9])
      expect(output.length).to eq(7)
    end
    it 'should show an empty board and updates board with player marker X on the first play' do
      board = ['', '', '', '', '', '', '', '', '', '']
      current_player_mark = @new_board.get_player_mark(board)
      expect(current_player_mark).to eq('X')
    end

    it 'should return the correct player mark on second turn for player O' do
      board = ['', 'X', '', '', '', '', '', '', '', '']
      current_player_mark = @new_board.get_player_mark(board)
      expect(current_player_mark).to eq('O')
    end

    it 'should return the correct player mark on third turn for player X' do
      board = ['', 'X', 'O', '', '', '', '', '', '', '']
      current_player_mark = @new_board.get_player_mark(board)
      expect(current_player_mark).to eq('X')
    end

    it 'should return the correct player mark on fourth turn for player O' do
      board = ['', 'X', 'O', 'X', '', '', '', '', '', '']
      current_player_mark = @new_board.get_player_mark(board)
      expect(current_player_mark).to eq('O')
    end

    it 'should verify no more moves allowed after 9 turns' do
      dummy_full_board

      output = @new_board.turn

      expect(output).to eq(@new_board.print_to_terminal("\n It's a tie. Game Over!\n\n"))
    end

    it 'should return board_full? as false when new board is initilaised' do
      expect(@new_board.board_full?).to eq(false)
    end

    it 'should return board_full? as true when board is full' do
      dummy_full_board

      board_full = @new_board.available_moves.empty?

      expect(board_full).to eq(true)
    end
  end

  context 'correct input output' do
    it 'should print the board to the terminal' do
      expect do
        @new_board.print_to_terminal(@new_board.generate_board)
      end.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
    end

    it 'should take the correct player input from the terminal' do
      allow($stdin).to receive(:gets).and_return(0)
      expect(@new_board.player_input).to eq(0)
    end

    it 'should print game won message ' do
      expect do
        @new_board.game_status(%w[X X X 0 4 5 O 7 8])
      end.to output("\n Player X wins!\n\n").to_stdout
    end

    xit 'should print game tie message ' do
      expect do
        @new_board.game_status(%w[X X O O O X X O X])
      end.to output("\n It's a tie. Game Over!\n\n").to_stdout
    end

  end

  context 'game play' do
    it 'should have a list of winning moves' do
      winning_moves = Board::WINNING_MOVES
      expect(winning_moves).to eq([
                                    [0, 1, 2],
                                    [3, 4, 5],
                                    [6, 7, 8],
                                    [0, 3, 6],
                                    [1, 4, 7],
                                    [2, 5, 8],
                                    [0, 4, 8],
                                    [2, 4, 6]
                                  ])
    end

    it 'should correctly identify winning play and return true' do
      board = %w[X X X 0 4 5 O 7 8]
      win = @new_board.win?(board)
      expect(win).to eq(true)
    end

    it 'should correctly identify losing play and return false' do
      board = %w[X X 3 0 X 5 O 7 8]
      win = @new_board.win?(board)
      expect(win).to eq(false)
    end
  end

  # Helper methods
  def verify_top_left(player)
    @new_board.place_player(player, 1)
    output = @new_board.generate_board
    expect(output).to eq(" #{player} | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
  end

  def verify_bottom_right(player)
    @new_board.place_player(player, 9)
    output = @new_board.generate_board
    expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | #{player} \n")
  end

  def dummy_full_board
    play_turn_1 = @new_board.play_turn('X', 1)
    play_turn_2 = @new_board.play_turn('O', 2)
    play_turn_3 = @new_board.play_turn('X', 3)
    play_turn_4 = @new_board.play_turn('O', 4)
    play_turn_5 = @new_board.play_turn('X', 5)
    play_turn_6 = @new_board.play_turn('O', 6)
    play_turn_7 = @new_board.play_turn('X', 7)
    play_turn_8 = @new_board.play_turn('O', 8)
    play_turn_9 = @new_board.play_turn('X', 9)
  end
end
