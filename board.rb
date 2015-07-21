require_relative 'square'

class Board
  BOARD_POSITIONS = (1..9).to_a
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  attr_reader :board

  def initialize
    @board = []
    BOARD_POSITIONS.each do |num|
      @board << Square.new(num)
    end
  end

  def available_positions
  	@board.select { |square| square.number if square.value == " " }
  end

  def positions_full?
    @board.select { |square| square.value == " "}.empty?
  end

  def three_in_a_row?(player_stamp)
    WINNING_LINES.each do |line|
      if @board[line[0] - 1].value == player_stamp && @board[line[1] - 1].value == player_stamp && @board[line[2] - 1].value == player_stamp
        return true
      end
    end
    false
  end

  def draw_board
    system 'clear'
    puts "Welcome to Tic Tac Toe!"
    puts
    puts " #{@board[0].value} | #{@board[1].value} | #{@board[2].value} "
    puts "-----------"
    puts " #{@board[3].value} | #{@board[4].value} | #{@board[5].value} "
    puts "-----------"
    puts " #{@board[6].value} | #{@board[7].value} | #{@board[8].value} "
    puts
    puts "Enter a value between 1 - 9"
  end
end
