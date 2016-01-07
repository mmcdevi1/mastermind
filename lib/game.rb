require_relative 'board'
require_relative 'player'
# require 'colorize'

module MasterMind

  class Game
    attr_accessor :board, :player

    SECRET_CODE = Array.new
    CHOICES = { red: 'r', blue: 'b', green: 'g', yellow: 'y', magenta: 'm', cyan: 'c' }

    def initialize
      @player = Player.new
      @board  = Board.create
      play
    end

    private

    def render_board
      board.render
    end

    def generate_secret_code
      # The opposing player must generate a secret code with
      # length of 4
      4.times do
        SECRET_CODE << CHOICES.values.shuffle.last
      end
    end

    def display_secret_code
      SECRET_CODE
    end

    def player_guesses_secret_code
      player.guess_secret_code
    end

    def players_guess_marks_board(i, guess_element)
      board.board_row[i].hole.each do |item|

        item.mark_value(player.guess[guess_element])
        guess_element += 1

      end
    end

    def feedback_for_players_guess(i, feedback_element)
      player.guess.each_with_index do |guess, index|
        if SECRET_CODE.include?(guess) && (SECRET_CODE[index] == player.guess[index])
          board.board_row[i].feedback_hole[feedback_element].value << '*'
          feedback_element += 1
        elsif SECRET_CODE.include?(guess)
          board.board_row[i].feedback_hole[feedback_element].value << 'X'
          feedback_element += 1
        end
      end
    end

    def player_wins?(guess_array)
      return true if guess_array == display_secret_code
    end

    def play
      generate_secret_code

      i = 1
      guess_element = 0
      feedback_element = 0

      loop do
        render_board
        p display_secret_code

        player_guesses_secret_code
        players_guess_marks_board(i, guess_element)
        feedback_for_players_guess(i, feedback_element)

        if player_wins?(player.guess)
          render_board
          puts "You guessed the secret code!"
          p display_secret_code
          break
        end

        guess_element = 0
        feedback_element = 0
        i += 1
      end

    end
  end

end

game = MasterMind::Game.new























































