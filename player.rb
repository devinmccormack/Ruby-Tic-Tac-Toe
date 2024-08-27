class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
  
  def get_move
    loop do
      puts "#{name}, enter your move as 'row,col' (e.g., 0,1):"
      input = gets.chomp

      # Check if the input matches the correct format (e.g., "1,2")
      if input.match?(/^\d+,\d+$/)
        row, col = input.split(',').map(&:to_i)
        return [row, col] if row.between?(0, 2) && col.between?(0, 2)

        puts "Invalid move: row and column must be between 0 and 2."
      else
        puts "Invalid input: Please enter numbers in the format 'row,col'."
      end
    end
  end
end
