require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should select current peg" do
    board.current_player YELLOW
    board.pegs = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,9,0]]
    expect(board.curr_peg(2)).to eq 9
  end

  it "should set current peg" do
    board.current_player RED
    board.curr_peg(0, 2)
    board.current_player BLUE
    board.curr_peg(1, 7)
    board.current_player YELLOW
    board.curr_peg(2, 9)

    expect(board.pegs).to eq [ [2,0,0,0], [0,7,0,0], [0,0,0,0], [0,0,9,0] ]
  end

  it "should do nothing when nil peg is chosen" do
    board.move(nil,3)
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end
end
