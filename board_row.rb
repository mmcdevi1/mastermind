require_relative 'board_hole'

module MasterMind

  class BoardRow
    attr_accessor :hole

    def initialize
      @hole = []
      (1..4).each { @hole << BoardHole.new(' ') }
    end

    def render_holes
      puts "#{hole[0]} | #{hole[1]} | #{hole[2]} | #{hole[3]}"
    end

    def empty_holes
      hole.select { |item| item.empty? }
    end

    def full_row?
      empty_holes.size == 0
    end
  end

end