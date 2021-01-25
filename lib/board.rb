class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.all? { |index| index == "X" || index == "O"}
  end

  def turn_count
    turn = 0
    @cells.each do |index|
      if index == "X" || index == "O"
        turn += 1
      else
        turn += 0
      end
    end
    turn
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    (0..8).include?(input.to_i-1) && !taken?(input)
  end

  def update(input, player)
    index = input.to_i - 1
    if valid_move?(input)
      @cells[index] = player.token
    end
  end
end
