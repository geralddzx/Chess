class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
  end
  
  def self.new_board_setup
    board = Board.new
    [[0, :black], [7, :white]].each do |index, color|
      board.set_grid(color, [index, 0], Rooke)
      board.set_grid(color, [index, 1], Knight)
      board.set_grid(color, [index, 2], Bishop)
      board.set_grid(color, [index, 3], Queen)
      board.set_grid(color, [index, 4], King)
      board.set_grid(color, [index, 5], Bishop)
      board.set_grid(color, [index, 6], Knight)
      board.set_grid(color, [index, 7], Rooke)
    end
    board
  end
  
  def set_grid(color, position, piece)
    @grid[position[0]][position[1]] = piece.new(self, position, color)
  end
  
  def display
    @grid.map do |row|
      row.map do |piece| 
        if piece.nil?
          "  " 
        else
          piece.to_s
        end
      end.join("|")
    end.join("\n")
  end
  
  def valid_position?(row, col)
    row.between?(0, 7) && col.between?(0, 7)
  end
 
  def get_piece(row, col)
    @grid[row][col]
  end
  
  def get_team_pieces(color)
    @grid.flatten.compact.select do |piece|
      piece.color == color
    end
  end
  
  def king_pos(c)
    @grid.each_with_index do |row, index1|
      row.each_with_index do |col, index2|
        if col.is_a?(King) && col.color == c
          return [index1, index2]
        end
      end
    end
  end
  
  def in_check?(c)
    king_position = king_pos(c)

    @grid.flatten.compact.each do |piece| 
      if piece.color != c
        return true if piece.moves.include?(king_position)
      end    
    end
    false
  end

  def move(start, end_pos, color)
    if !valid_position?(start[0],start[1]) || 
      !valid_position?(end_pos[0],end_pos[1])
      raise "Out of board" 
    end
    
    start_piece = @grid[start[0]][start[1]]
    raise "There's no piece there" if start_piece.nil?
    raise "This is not your color" if start_piece.color != color
    unless start_piece.moves.include?(end_pos)
      raise "You can't move there" 
    end
    raise "Will be in check!" unless start_piece.valid_moves.include?(end_pos)
    
  #rescue error scue error unless checkmate
    move!(start, end_pos)
  end
  
  def move!(start, end_pos)
    start_piece = @grid[start[0]][start[1]]
    
    @grid[start[0]][start[1]] = nil
    @grid[end_pos[0]][end_pos[1]] = start_piece
    start_piece.position = end_pos
  end
  
  def checkmate?(color)
    return false unless in_check?(color)
    team_pieces = get_team_pieces(color)
    
    team_pieces.all? { |piece| piece.valid_moves.empty? }
  end
  
  def dup
    dup_board = Board.new
    
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, piece_idx|
        unless piece.nil?
          dup_board.set_grid(piece.color, piece.position.dup, piece.class)
        end
      end
    end
    dup_board
  end

end