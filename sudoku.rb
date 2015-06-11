class Sudoku

  def initialize(board_string) #"18392039870284759874598374598934875627456289476"
    @board = board_string.split('')
    @boxes = {
      0 => [], 1 => [], 2 => [],
      3 => [], 4 => [], 5 => [],
      6 => [], 7 => [], 8 => []
    }

    populate_boxes
  end

  def solve!
    while @board.include?("0")
      @board.each_with_index do |num, index|
        if num == "0"
          @possible_numbers = ["1","2","3","4","5","6","7","8","9"]
          check_row(index/9)
          check_col(index%9)
          check_box(index/9, index%9)
          if @possible_numbers.length == 1
            @board[index] = @possible_numbers.shift
          end
        end
      end
    end
    p @board
  end

  def populate_boxes
    @board.each_with_index do |num, index|
      box = find_box(index/9, index%9)
      @boxes[box] << num
    end
  end

  def find_box(row, col)
    return col/ 3 if row < 3
    return col / 3 + 3 if row < 6
    col / 3 + 6
  end

  def check_row(row)
    @board = @board.each_slice(9).to_a
    @board[row].each do |num|
      @possible_numbers.delete_if { |pos_num| num == pos_num }
    @board = @board.flatten
    end
  end

  def check_col(col)
    @board = @board.each_slice(9).to_a
    @board.each do |row|
      @possible_numbers.delete_if { |pos_num| row[col] == pos_num }
    @board = @board.flatten
    end
  end

  def check_box(row, column)
    box = find_box(row, column)
    @boxes[box].each do |num|
      @possible_numbers.delete_if { |pos_num| num == pos_num }
    end
  end

  def show_current_board
    p @board
  end
end

board_string = '003020600900305001001806400008102900700000008006708200002609500800203009005010300'
game = Sudoku.new(board_string)
game.solve!