class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, ' ')
  end
  
  def reset!
    @cells = Array.new(9, ' ')
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    return @cells[input.to_i - 1]
  end
  
  def full?
    return @cells.all? { |cell| cell == 'O' || cell == 'X' }
  end
  
  def turn_count
    count = 0
    @cells.each { |cell|
      count += 1 if cell == 'O' || cell == 'X'
    }
    return count
  end
  
  def taken?(input)
    return position(input) == 'O' || position(input) == 'X'
  end
  
  def valid_move?(input)
    return input.to_i > 0 && input.to_i < 10 && !taken?(input)
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
