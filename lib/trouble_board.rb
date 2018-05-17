class TroubleBoard
  include Player
  attr_accessor :pegs

  def initialize(player_count)
    @turn = 1
    @player_count = player_count
    @pegs = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  def has_pegs_not_finished?
    @pegs.flatten.sort.take_while {|i| i < 29 }.any?
  end

  def current_player
    (@turn - 1) % @player_count
  end

  def next_turn
    @turn += 1
  end

  def curr_peg(peg_index, position=nil)
    if position
      @pegs[current_player][peg_index] = position
    else
      @pegs[current_player][peg_index]
    end
  end

  def curr_peg_is_home?(peg)
    curr_peg(peg) == 0
  end

  def target_space_occupied_indicies(targent_space)
    indexes = []
    @pegs.each_with_index do |color_pegs,ci|
      search_result = color_pegs.index(targent_space)
      if not search_result.nil?
        indexes << ci
        indexes << search_result
        break
      end
    end
    indexes
  end

  def send_opponent_home(indicies)
    @pegs[indicies[0]][indicies[1]] = 0
  end

  def move(peg, n)
    if curr_peg_is_home?(peg) and n == 6
      target_space = (current_player * 7) + 1
    else
      ts = curr_peg(peg) + n
      target_space = ts > 28 ? ts - 28 : ts
    end

    indicies = target_space_occupied_indicies(target_space)
    if indicies.any?
      send_opponent_home(indicies)
    end
    curr_peg(peg, target_space)
  end
end
