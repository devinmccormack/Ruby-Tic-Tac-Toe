require './player.rb'
require './board.rb'
require './game.rb'

class Main
  def self.start
    puts "Welcome to Tic-Tac-Toe!"
    
    # Initialize players
    puts "Enter Player 1's name:"
    player1_name = gets.chomp

    puts "Enter Player 2's name:"
    player2_name = gets.chomp

    # Start a new game
    game = Game.new(player1_name, player2_name)
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