class Players::Computer < Player
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
  
  def move(board)
    WIN_COMBINATIONS.each { |combination|
      opponent_count = 0
      computer_count = 0
      combination.each { |index|
        if board.cells[index] != ' '
          if board.cells[index] != self.token
            opponent_count += 1
          else
            computer_count += 1
          end
        end
      }
      if opponent_count > 1 || computer_count > 1
        combination.each { |index|
          if board.cells[index] == ' '
            return (index + 1).to_s
          end
        }
      end
    }
    return rand(1..9).to_s
  end
end
