class Rooke < SlidingPiece
  def to_s
    "R "
  end
  def move_dirs
    ORTHAGONAL_DIRS
  end
end