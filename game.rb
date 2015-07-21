require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @game_board = Board.new
    @player = Player.new
    @computer = Computer.new
    @current_player = @player
  end

  def player_selects_square
    loop do
      position = gets.chomp.to_i
      if @game_board.available_positions.include?(@game_board.board[position - 1])
        @game_board.board[position - 1].value = @current_player.stamp
        break
      else
        puts "Position unavailable"
      end
    end
  end

  def build_board
    @game_board.draw_board
  end

  def gameplay_logic
    if @current_player == @player
      player_selects_square
    else
      @game_board.available_positions.sample.value = @current_player.stamp
    end
  end

  def alternate_player
    if @current_player == @player
      @current_player = @computer
    else
      @current_player = @player
    end
  end

  def winner?
    @game_board.three_in_a_row?(@current_player.stamp)
  end

  def tie?
    @game_board.positions_full?
  end

  def game_loop
    until winner? || tie?
      loop do
        build_board
        gameplay_logic
        break if  winner? || tie?
        alternate_player
      end
      build_board
    end
  end

  def game_results
    case
    when winner? && !tie?
      puts "THREE IN A ROW! #{@current_player.name} Wins!"
    when winner? && tie?
      puts "THREE IN A ROW! #{@current_player.name} Wins!"
    else
      puts "The game is a tie"
    end
  end

  def play
    game_loop
    game_results
  end
end

loop do
  Game.new.play
  puts "Would you like to play again? Type yes or hit enter to exit"
  answer = gets.chomp
  break unless answer == "yes"
end
