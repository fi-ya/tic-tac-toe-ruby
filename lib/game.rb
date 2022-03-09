# frozen_string_literal: true

class Game
  # attr_reader :board, :display

  # def initialize(board)
  #   @board = board
  #   @display = display
  # end

  # game
  # def place_player(player, index)
  #   @board[index - 1] = player
  # end

  # def play_turn(player, index)
  #   if player == 'X' && valid_move?(index)
  #     place_player('X', index)
  #   elsif player == 'O' && valid_move?(index)
  #     place_player('O', index)
  #   else
  #     print_to_terminal(@message.invalid_move)
  #   end
  # end

  # def position_taken?(index)
  #   board[index - 1] == 'X' || board[index - 1] == 'O'
  # end

  # def valid_move?(index)
  #   !position_taken?(index) && index.between?(1, 9) ? true : false
  # end

  # def turn
  #   until game_over?
  #     play_turn(get_player_mark(@board), player_input)
  #     print_to_terminal(generate_board)
  #     print_to_terminal(@message.enter_num) unless game_over?
  #   end
  #   game_status(@board)
  # end

  # def win?(board)
  #   winning_plays = []

  #   WINNING_MOVES.all? do |winning_game|
  #     winning_plays.push(board[winning_game[0]] == board[winning_game[1]] && board[winning_game[1]] == board[winning_game[2]] ? true : false)
  #   end

  #   winning_plays.any? { |game| game == true }

  # end

  # def winning_player(board)
  #   board.count('X') > board.count('O') ? 'X' : 'O'
  # end

  # def game_status(board)
  #   if board_full? && !win?(board)
  #     print_to_terminal(@message.tie)
  #   else
  #     print_to_terminal(@message.won(winning_player(board)))
  #   end
  # end

  # def game_over?
  #   board_full? || win?(@board)
  # end

end
