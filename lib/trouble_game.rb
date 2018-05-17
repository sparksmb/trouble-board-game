class TroubleGame
  include Player

  attr_accessor :players

  def initialize(players)
    @players = players
    @board = TroubleBoard.new(players.count)
  end

  def setup
    colors = [YELLOW, GREEN, BLUE, RED]
    @players = @players.shuffle.map {|p| p.new(colors.pop) }
  end

  def run
    while board.has_pegs_not_fininshed?
      current_player_takes_turn
    end
  end

  def current_player_takes_turn(n=nil)
    n ||= push_pop_o_matic
    peg = current_player.choose_peg(n)
    board.move(peg, n)
    end_turn
  end

  private

  def push_pop_o_matic
    rand(1..6)
  end

  def current_player
    @players[@board.current_player]
  end

  def end_turn
    @board.next_turn
    update_player_pegs
  end

  def update_player_pegs
    @players.each{|p| p.update(@board.pegs) }
  end
end
