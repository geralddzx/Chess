class Knight < SteppingPiece

  CHANGES = [
    [-1, 2], 
    [-1, -2], 
    [1, 2], 
    [1, -2],
    [2, -1],
    [2, 1],
    [-2, -1],
    [-2, 1]
  ]
  
  def to_s
    "KN"
  end
  
  def move_dirs
    CHANGES
  end
end