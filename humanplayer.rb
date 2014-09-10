class HumanPlayer
  attr_reader :color
  def initialize(color)
    @color = color
  end
    
  def play_turn(board)
    puts "#{color} player make a move."
    puts "Where is the piece you would like to move?"
    start_pos = gets.chomp.split(",").map{ |char| char.to_i}
    
    puts "Where do you want to move the piece to?"
    end_pos = gets.chomp.split(",").map{ |char| char.to_i}
    [start_pos, end_pos] 
    board.move(start_pos, end_pos, self.color)
  end

end