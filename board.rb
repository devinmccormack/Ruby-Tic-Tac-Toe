class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  def display
    @grid.each_with_index do |row, index|
      puts row.map { |cell| cell.nil? ? " " : cell }.join(" | ")
      puts "--+---+--" unless index == 2
    end
  end

  def update(position, marker)
    row, col = position
    if @grid[row][col].nil?
      @grid[row][col] = marker
    else
      puts "This position is already taken!"
    end
  end

  def valid_move?(position)
    row, col = position
    row.between?(0, 2) && col.between?(0, 2) && @grid[row][col].nil?
  end

  def full?
    @grid.flatten.none?(&:nil?)
  end

  def winner?
    winning_combinations = [
      [[0, 0], [0, 1], [0, 2]], # Top row
      [[1, 0], [1, 1], [1, 2]], # Middle row
      [[2, 0], [2, 1], [2, 2]], # Bottom row
      [[0, 0], [1, 0], [2, 0]], # Left column
      [[0, 1], [1, 1], [2, 1]], # Middle column
      [[0, 2], [1, 2], [2, 2]], # Right column
      [[0, 0], [1, 1], [2, 2]], # Diagonal
      [[0, 2], [1, 1], [2, 0]]  # Diagonal
    ]

    winning_combinations.any? do |combo|
      markers = combo.map { |row, col| @grid[row][col] }
      markers.uniq.length == 1 && markers.first != nil
    end
  end
end
