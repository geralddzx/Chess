require_relative 'game'
require_relative 'humanplayer'
require_relative 'piece'
require_relative 'sliding_piece'
require_relative 'stepping_piece'
require_relative 'board'
require_relative 'king'
require_relative 'rook'
require_relative 'knight'
require_relative 'pawn'
require_relative 'bishop'
require_relative 'queen'


if $PROGRAM_NAME == __FILE__
  Game.new.play
  # b = Board.new_board_setup
  # b.move([7,1],[5,0])
  # b.move([0, 3], [7, 3])
  # puts b.display
  # b.move([7, 3], [5, 3])
  # puts b.display
  # b.move([7, 2], [6, 1])
  # b.move([0, 5], [2, 7])
  # b.move([5, 3], [6, 3])
  # puts b.display
  # puts b.checkmate?(:white)
  # # move([7, 0], [6, 0])
  # puts b.display
end

