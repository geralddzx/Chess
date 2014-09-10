class Pawn < SteppingPiece
  NORMAL_MOVES = { black: [1, 0], white: [-1, 0] }
  ATTACK_MOVES = { black: [[1, -1], [1, 1]], white: [[-1, -1], [-1, 1]] }
  
  def initialize(board, position, color)
    super
    @has_moved = false
  end
  
  def check_validity(direction)
    current_row = @position[0] + direction[0]
    current_col = @position[1] + direction[1]
  
    pos_valid = @board.valid_position?(current_row, current_col)
  
    if pos_valid 
      item_at_pos = @board.get_piece(current_row,current_col)
      
      if item_at_pos.nil? || item_at_pos.color != self.color
         [current_row, current_col]
      end
    end

  end
#   
#   def moves
#     possible_positions = []
#     directions = NORMAL_MOVES
#     
#     # if directions.count == 1
#         possible_positions << check_validity(direction)
#     else
#       directions = ATTACK_MOVES
#     
#       directions.each do |direction|
#         possible_positions << check_validity(direction)
#       end
#     
#     possible_positions.compact!
#   end 
def normal_moves
  direction = NORMAL_MOVES[self.color]
  
  [check_validity(direction)]
  
  if pos_valid 
    item_at_pos = @board.get_piece(current_row,current_col)
    
    if item_at_pos.nil? || item_at_pos.color != self.color
       [current_row, current_col]
    end
  end
  
end
  
  def attack_moves
    directions = ATTACK_MOVES[self.color]
    possible_positions = []
    directions.each do |direction|
      possible_positions << check_validity(direction)    
    end
    
    possible_positions
  end
  
  
 
  
  def to_s
    "P "
  end
end