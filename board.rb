class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    puts "Current Board:"
    @grid.each_with_index do |row, index|
      puts row.join(" | ")
      puts "--+---+--" unless index == 2
    end
  end

  def update(position, marker)
    row, col = position
    @grid[row][col] = marker
  end

  def valid_move?(position)
    row, col = position
    (0..2).include?(row) && (0..2).include?(col) && @grid[row][col] == " "
  end

  def full?
    @grid.flatten.none? { |cell| cell == " " }
  end

  def winner?
    winning_combinations.any? do |combo|
      markers = combo.map { |row, col| @grid[row][col] }
      markers.uniq.length == 1 && markers.first != " "
    end
  end

  def winning_combinations
    rows = @grid
    cols = @grid.transpose
    diagonals = [
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]]
    ]
    rows + cols + diagonals
  end

end