class SlidingPiece < Piece
  
  DIAGONAL_DIRS = [[-1, -1], [1, -1], [-1, 1], [1, 1]]
  ORTHAGONAL_DIRS = [[-1, 0], [0, -1], [0, 1], [1, 0]]
 
  def moves
    possible_positions = []
    directions = move_dirs
    
    directions.each do |direction|

      i = 1
      while true
        current_row = @position[0] + (i * direction[0])
        current_col = @position[1] + (i * direction[1])
        pos_valid = @board.valid_position?(current_row, current_col)
        if pos_valid
          item_at_pos = @board.get_piece(current_row,current_col)
          if item_at_pos.nil?
            possible_positions << [current_row,current_col]
          elsif item_at_pos.color != self.color
            possible_positions << [current_row,current_col]
            break
          else
            break
          end
        else
          break
        end
        i += 1
      end
    end
    possible_positions
  end
end