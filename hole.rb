module MasterMind

  class Hole
    attr_accessor :value

    def initialize(value)
      @value = value
    end

    def to_s
      empty? ? 'O' : self.value
    end

    def empty?
      self.value == ' '
    end

    def mark_value(peg)
      self.value = peg
    end
  end

end