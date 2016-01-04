require_relative 'board'
require_relative 'player'
require 'colorize'

module MasterMind

  class Game
    attr_accessor :board

    SECRET_CODE = Array.new
    CHOICES = { red: 'r', blue: 'b', green: 'g', yellow: 'y', magenta: 'm', cyan: 'c' }

    def initialize
      @player = Player.new
      @board = Board.create
      play
    end

    private

    def render_board
      board.render 
    end

    def generate_secret_code
      4.times do 
        SECRET_CODE << CHOICES.values.shuffle.last
      end
    end

    def display_secret_code
      p SECRET_CODE
    end

    def play
      generate_secret_code

      i = 1
      guess_element = 0

      loop do 
        render_board
        display_secret_code
        print 'Make a guess: '
        guess_array = gets.chomp.downcase.split('')

        board.board_row[i].hole.each do |item|
          
          item.mark_value(guess_array[guess_element])
          guess_element += 1

        end

        if guess_array == display_secret_code
          render_board
          puts 'You win'
          break
        end

        guess_element = 0
        i += 1
      end

    end
  end

end

game = MasterMind::Game.new























































