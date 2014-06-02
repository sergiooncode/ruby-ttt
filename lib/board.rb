class Board
  attr_accessor :size, :squares

  def initialize(size)
    @size = size
    @squares = String.new	
    size.times do
      @squares << '-'
    end
  end
  def empty?(position)
    @squares[position] == '-'
  end
  def filled?
    filled = true
    (0..size - 1).each do |i|
      if empty?(i)
        filled = false
        break
      end
    end
    filled
  end
end
