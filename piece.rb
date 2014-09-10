class Piece
  attr_accessor :color, :position
  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def valid_moves
    moves.select do |move|
      new_board = @board.dup
      new_board.move!(self.position, move)
      !new_board.in_check?(self.color)
    end
  end
  
end