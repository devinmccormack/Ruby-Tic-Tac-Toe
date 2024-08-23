class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def get_move
    puts "#{name}, enter your move as row,col:"
    gets.chomp.split(',').map(&:to_i)
  end
  
end
