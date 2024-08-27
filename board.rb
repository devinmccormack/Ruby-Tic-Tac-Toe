class Board

  # Contains all possible winning combos for a symbol
  WINNING_COMBINATIONS = [
      [[0, 0], [0, 1], [0, 2]], # Top row
      [[1, 0], [1, 1], [1, 2]], # Middle row
      [[2, 0], [2, 1], [2, 2]], # Bottom row
      [[0, 0], [1, 0], [2, 0]], # Left column
      [[0, 1], [1, 1], [2, 1]], # Middle column
      [[0, 2], [1, 2], [2, 2]], # Right column
      [[0, 0], [1, 1], [2, 2]], # Diagonal
      [[0, 2], [1, 1], [2, 0]]  # Diagonal
    ]

  # Uses nested array to create the board for the game
  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  # Fills in the rows with any filled spaces and creates the borders for the board
  def display
    @grid.each_with_index do |row, index|
      puts row.map { |cell| cell.nil? ? " " : cell }.join(" | ")
      puts "--+---+--" unless index == 2
    end
  end

  # Attempts to fill a position on the board, if it is open
  def update(position, marker)
    row, col = position
    if @grid[row][col].nil?
      @grid[row][col] = marker
    else
      # Not expected to reach this spot due to valid_move?(), but it is here just in case.
      puts "This position is already taken!"
    end
  end

  # Determines if the move the player just attempted to make is valid
  def valid_move?(position)
    row, col = position
    row.between?(0, 2) && col.between?(0, 2) && @grid[row][col].nil?
  end

  # Checks if the board is filled up, indicating a potential tie
  def full?
    @grid.flatten.none?(&:nil?)
  end

  # Uses WINNING_COMBINATIONS to determine if either symbol has met the criteria for any of the winning combos
  def winner?
    WINNING_COMBINATIONS.any? do |combo|
      markers = combo.map { |row, col| @grid[row][col] }
      markers.uniq.length == 1 && markers.first != nil
    end
  end
end
