class Players::Human < Player
  def move(board)
    puts "\nEnter 1-9:"
    return gets.strip
  end
end
