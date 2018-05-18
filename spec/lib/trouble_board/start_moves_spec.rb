require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should do nothing when nil peg is chosen" do
    board.move(nil,3)
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should move peg to start space" do
    4.times {
      board.move(0,6)
      board.next_turn
    }
    expect(board.pegs).to eq [ [1,0,0,0], [8,0,0,0], [15,0,0,0], [22,0,0,0] ]
  end

  it "should move RED peg to start" do
    board.move(0,6)
    expect(board.pegs).to eq [[1,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end
end
