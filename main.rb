require './player.rb'
require './board.rb'
require './game.rb'

class Main
  def self.start
    puts "Welcome to Tic-Tac-Toe!"
    
    # Initialize players
    puts "Enter Player 1's name:"
    player1_name = gets.chomp
    player1 = Player.new(player1_name, "X")

    puts "Enter Player 2's name:"
    player2_name = gets.chomp
    player2 = Player.new(player2_name, "O")

    # Start a new game
    game = Game.new(player1, player2)
    game.play

    # Option to restart the game
    puts "Do you want to play again? (yes/no)"
    answer = gets.chomp.downcase
    if answer == "yes"
      start # Recursively call start to restart the game
    else
      puts "Thanks for playing!"
    end
  end
end

Main.start