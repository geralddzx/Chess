class Queen < SlidingPiece
  def move_dirs
    DIAGONAL_DIRS + ORTHAGONAL_DIRS
  end
  
  def to_s
    "Q "
  end
end

