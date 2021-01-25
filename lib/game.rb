class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    num = self.board.turn_count
    if num.odd?
      player_2
    else
      player_1
    end
  end

  def won?
    winning_combo = []
    WIN_COMBINATIONS.each do |combo|
      winning_1 = combo[0]
      winning_2 = combo[1]
      winning_3 = combo[2]

      pos_1 = self.board.cells[winning_1]
      pos_2 = self.board.cells[winning_2]
      pos_3 = self.board.cells[winning_3]

      if pos_1 == pos_2 && pos_2 == pos_3 && self.board.taken?(winning_1)
        winning_combo = combo
      end
    end

    if winning_combo != []
      winning_combo
    else
      false
    end
  end

  def draw?
    if self.board.full?
      if self.won?
        false
      else
        true
      end
    end
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def winner
    if self.over?
      if draw?
        nil
      else
    #if game over
      #if draw
        #nil
      #else
        #check for player token somehow
  end
end
