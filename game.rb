class Game
  def initialize
    @board = Board.new
    @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
    @current_player = @players.first