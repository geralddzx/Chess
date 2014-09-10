class Game
  
  def initialize
    @board = Board.new_board_setup
    @player1 = HumanPlayer.new(:white)
    @player2 = HumanPlayer.new(:black)
    @turn = @player1
    # @turn = :white
  end
  
  # def prompt(color)
#     puts "#{color} player make a move."
#     puts "Where is the piece you would like to move?"
#     start_pos = gets.chomp.split(", ")
# 
#     
#     puts "Where do you want to move the piece to?"
#     end_pos = gets.chomp.split(", ")
#     
#     [start_pos, end_pos]
#   end
  
  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      puts @board.display
      begin      
        @turn.play_turn(@board)
        @turn == @player1 ? @turn = @player2 : @turn = @player1
        puts "CHECK!" if @board.in_check?(@turn.color)
      rescue StandardError => e
        puts e.message
        puts "try again"
        retry   
      end 0
      puts
    end
    if @board.checkmate(:black)
      puts "player1 wins" 
    else
      puts "player2 wins"
    end
  end
 
end