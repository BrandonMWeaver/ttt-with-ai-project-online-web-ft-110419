require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
  
  def initialize(player_1 = Players::Human.new('X'),
                 player_2 = Players::Human.new('O'),
                 board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    return @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.each { |combination|
      index_0 = combination[0]
      index_1 = combination[1]
      index_2 = combination[2]
      if @board.cells[index_0] == 'O' && @board.cells[index_1] == 'O' && @board.cells[index_2] == 'O'
        return combination
      end
      if @board.cells[index_0] == 'X' && @board.cells[index_1] == 'X' && @board.cells[index_2] == 'X'
        return combination
      end
    }
    return false
  end
  
  def draw?
    return @board.turn_count == 9 && !won?
  end
  
  def over?
    return won? || draw?
  end
  
  def winner
    return won? != false ? @board.cells[won?[0]] : nil
  end
  
  def turn
    validated = false
    while !validated do
      move = current_player.move(@board)
      if @board.valid_move?(move)
        @board.update(move, current_player)
        validated = true
        puts "\n"
        @board.display
      end
    end
  end
  
  def play
    @board.display
    while !over? do
      turn
    end
    puts "\n"
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
