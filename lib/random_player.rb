class RandomPlayer
  include Player

  attr_accessor :name, :color

  def initialize(name=nil)
    @color = color
    @name = name || Faker::Name.name
    @pegs = []
  end

  def my_pegs
    @pegs[@color]
  end

  def choose_peg(roll_number)
    if roll_number == 6 and start_space_open?
      choose_first_home_peg
    elsif peg_options.any?
      choose_random_peg_option
    else
      nil
    end
  end

  def update(pegs)
    @pegs = pegs
  end

  def start_space_open?
    my_pegs.include?((@color * 7) + 1) == false
  end

  def choose_first_home_peg
    my_pegs.index(0)
  end

  def peg_options
    my_pegs.inject([]){|a, p| a << p if p > 0; a}
  end

  def choose_random_peg_option
    #peg_options[rand(0..peg_options.count-1)]
    rand(0..peg_options.count-1)
  end
end

