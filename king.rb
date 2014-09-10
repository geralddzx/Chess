class King < SteppingPiece

  def move_dirs
    changes = []
    (-1..1).each do |row|
      (-1..1).each do |col|
        next if row == 0 && col == 0
        changes << [row, col]
      end
    end
    changes      
  end
  
  def to_s
    "KI"
  end
  
end