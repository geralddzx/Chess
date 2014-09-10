class Bishop < SlidingPiece
  def move_dirs
    DIAGONAL_DIRS
  end
  
  def to_s
    "B "
  end
end