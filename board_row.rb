require_relative 'board_hole'
require_relative 'feedback_hole'

module MasterMind

  class BoardRow
    attr_accessor :hole, :feedback_hole

    def initialize
      @hole = []
      @feedback_hole = []
      (1..4).each { @hole << BoardHole.new(' ') }
      (1..4).each { @feedback_hole << FeedbackHole.new(' ') }
    end

    def render_holes
      puts "| #{hole[0]} | #{hole[1]} | #{hole[2]} | #{hole[3]} | #{feedback_hole[0]} | #{feedback_hole[1]} | #{feedback_hole[2]} | #{feedback_hole[3]} |"
    end

    def empty_holes
      hole.select { |item| item.empty? }
    end

    def full_row?
      empty_holes.size == 0
    end
  end

end