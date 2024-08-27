class Game
  # Create board and initialize players
  def initialize(player1_name, player2_name)
    @board = Board.new
    @players = [Player.new(player1_name, "X"), Player.new(player2_name, "O")]
    @current_player = @players.first
  end

  def play
    loop do
      # Display game board and the next move from the next player
      @board.display
      move = @current_player.get_move
      # Verify that the player sent correct input for a valid move
      if @board.valid_move?(move)
        @board.update(move, @current_player.marker)
        # Check if there is a winner or if the game tied, if not, switch turns.
        if @board.winner?
          @board.display
          puts "#{@current_player.name} wins!"
          break
        # If the board is filled, determine that it is a tie and end game.
        elsif @board.full?
          @board.display
          puts "It's a tie!"
          break
        # If no winner or tie, continue the game from the next player's turn
        else
          switch_turns
        end
      # If valid_move?() returns false, this message with display and the loop will continue
      else
        puts "Invalid move, try again."
      end
    end
  end

  # Swaps the player in focus
  def switch_turns
    @current_player = @players.rotate!.first
  end
end
    