class Player
  attr_reader :stamp
  attr_accessor :name

  def initialize
    player_greeting
    @name = gets.chomp
    @stamp = "X"
  end

  def player_greeting
    system 'clear'
    puts "Welcome to Tic Tac Toe!"
    puts
    puts "Enter your name"
  end

end

class Computer < Player
  def initialize
    @name = "Computer"
    @stamp = "O"
  end
end
