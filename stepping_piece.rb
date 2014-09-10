class SteppingPiece < Piece

  def moves
    possible_positions = []
    directions = move_dirs
    directions.each do |direction|
      current_row = @position[0] + direction[0]
      current_col = @position[1] + direction[1]
      
      pos_valid = @board.valid_position?(current_row, current_col)
      
      if pos_valid 
        item_at_pos = @board.get_piece(current_row,current_col)
        if item_at_pos.nil? || item_at_pos.color != self.color
          possible_positions << [current_row, current_col]
        end
      end
    end
    
    possible_positions
  end 
  
end