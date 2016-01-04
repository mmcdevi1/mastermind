require_relative 'board_row'

module MasterMind

  class Board
    attr_accessor :board_row

    def initialize
      @board_row = {}
      (1..12).each { |row| @board_row[row] = BoardRow.new }
    end

    def self.create
      self.new
    end

    def render
      system 'clear'
      board_row.each { |_, row| puts row.render_holes }
    end
  end

end