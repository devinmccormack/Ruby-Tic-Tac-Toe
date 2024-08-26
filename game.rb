class Game
  def initialize(player1_name, player2_name)
    @board = Board.new
    @players = [Player.new(player1_name, "X"), Player.new(player2_name, "O")]
    @current_player = @players.first
  end

  def play
    loop do
      @board.display
      move = @current_player.get_move
      if @board.valid_move?(move)
        @board.update(move, @current_player.marker)
        if @board.winner?
          @board.display
          puts "#{@current_player.name} wins!"
          break
        elsif @board.full?
          @board.display
          puts "It's a tie!"
          break
        else
          switch_turns
        end
      else
        puts "Invalid move, try again."
      end
    end
  end

  def switch_turns
    @current_player = @players.rotate!.first
  end
end
    