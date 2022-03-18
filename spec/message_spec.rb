# frozen_string_literal: true

require 'message'

describe Message do
  subject(:message) { described_class.new }

  context 'returns correct string ' do
    it 'welcome message' do
      expect(message.welcome).to eq("\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n")
    end

    it 'show current player' do 
      expect(message.show_current_player('X', 'Human')).to eq("\nPlayer X (Human) your turn to make a move...\n")
    end

    it 'enter number instruction' do
      expect(message.enter_num).to eq("\nEnter a number between 1-9: ")
    end

    it 'players move' do
      player = 'X'
      move = 1
      expect(message.players_move(player, move)).to eq("\nPlayer X chose 1 \n\n")
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

    it 'choose_game_mode' do
      expect(message.choose_game_mode).to eq("\nSelect a game:\n 1. Human vs Human\n 2. Computer vs Human\n\n")
    end

    it 'error_game_mode' do
      expect(message.error_game_mode).to eq("\nInvalid option selected. Please try again:\n1. Human vs Human\n2. Computer vs Human\n\n")
    end
  end
end
