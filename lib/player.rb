module MasterMind

  class Player
    attr_accessor :name, :guess

    def guess_secret_code
      @guess = []
      print 'Make a guess: '
      guess_array = gets.chomp.downcase.split('')

      guess_array.each do |item|
        guess << item
      end
    end
  end

end