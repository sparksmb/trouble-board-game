require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should select current peg" do
    board.pegs = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,9,0]]
    3.times { board.next_turn }
    expect(board.curr_peg(2)).to eq 9
  end

  it "should set current peg" do
    board.curr_peg(0, 2)
    board.next_turn
    board.curr_peg(1, 7)
    2.times { board.next_turn }
    board.curr_peg(2, 9)

    expect(board.pegs).to eq [ [2,0,0,0], [0,7,0,0], [0,0,0,0], [0,0,9,0] ]
  end

  it "should do nothing when nil peg is chosen" do
    board.move(nil,3)
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end
end
