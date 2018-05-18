require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should detect pegs not finished" do
    expect(board.has_pegs_not_finished?).to be_truthy
  end

  it "should detect pegs not finsihed" do
    board.pegs = [[32,31,30,1],[32,31,30,29],[32,31,30,29],[32,31,30,29]]
    expect(board.has_pegs_not_finished?).to be_truthy
  end

  it "should detect pegs all finsihed" do
    board.pegs = [[32,31,30,29],[32,31,30,29],[32,31,30,29],[32,31,30,29]]
    expect(board.has_pegs_not_finished?).to be_falsey
  end
end
