class Square
  attr_reader :number
  attr_accessor :value
  def initialize(number)
    @number = number
    @value = " "
  end

  def to_s
  	"Position: #{@number} Value: #{@value}"
  end

end
