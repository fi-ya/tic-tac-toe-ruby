require 'message'

describe Message do
  subject(:message) { described_class.new }

  context 'returns correct string ' do
    it 'welcome message' do
      expect(message.welcome).to eq("\nLet's play Tic Tac Toe\n------------------------\n")
    end

    it 'custom marker' do
      expect(message.ask_custom_marker).to eq("\nEnter one letter sign to identify you on the board eg. X, O, A \n")
    end

    it 'Player 1 choose marker' do
      expect(message.player1_custom_marker('Human')).to eq("\nPlayer 1 (Human) choose your custom marker: ")
    end

    it 'Player 1 custom marker' do
      expect(message.player1_custom_marker_choice('Human', 'S')).to eq("\nPlayer 1 (Human) your marker is S \n")
    end

    it 'Player 2 choose marker' do
      expect(message.player2_custom_marker('Human')).to eq("\nPlayer 2 (Human) choose your custom marker: ")
    end

    it 'Player 2 custom marker' do
      expect(message.player2_custom_marker_choice('Human', 'B')).to eq("\nPlayer 2 (Human) your marker is B \n")
    end

    it 'custom marker error' do
      expect(message.error_custom_marker).to eq("\nMarker not available. Please enter a SINGLE alphabetic character.\n\n")
    end

    it 'show current player' do
      expect(message.show_current_player('X', 'Human')).to eq("\nPlayer X (Human) your turn to make a move...\n")
    end

    it 'enter number instruction' do
      expect(message.enter_num).to eq("\nEnter a number between 1-9: ")
    end

    it 'computer_thinking' do
      expect(message.computer_thinking).to eq("\nComputer thinking... ")
    end

    it 'players move' do
      expect(message.players_move('X', 'Human', 1)).to eq("\nPlayer X (Human) chose 1 \n\n")
    end

    it 'invalid move message' do
      expect(message.invalid_move).to eq("\nInvalid move. Try again\n\n")
    end

    it 'tie message' do
      expect(message.tie).to eq("\nIt's a tie. Game Over!\n\n")
    end

    it 'winning message' do
      player = 'X'
      expect(message.won(player)).to eq("\nPlayer X wins!\n\n")
    end

    it 'game_mode_selection' do
      expect(message.game_mode_selection).to eq("\nSelect a game:\n 1. Human vs Human\n 2. Computer vs Human\n\n")
    end

    it 'error_game_mode' do
      expect(message.error_game_mode).to eq("\nInvalid option selected. Please try again:\n1. Human vs Human\n2. Computer vs Human\n\n")
    end
  end
end
