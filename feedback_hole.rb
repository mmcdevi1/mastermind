require_relative 'hole'

module MasterMind

  class FeedbackHole < Hole

    def to_s
      empty? ? '_' : self.value
    end

  end

end