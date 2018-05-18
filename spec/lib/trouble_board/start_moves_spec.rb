require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should do nothing when nil peg is chosen" do
    board.move(nil,3)
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should move RED peg to start" do
    board.move(0,6)
    expect(board.pegs).to eq [[1,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should move peg to start space" do
    board.current_player RED
    board.move(0,6)
    board.current_player BLUE
    board.move(0,6)
    board.current_player GREEN
    board.move(0,6)
    board.current_player YELLOW
    board.move(0,6)
    expect(board.pegs).to eq [ [1,0,0,0], [8,0,0,0], [15,0,0,0], [22,0,0,0] ]
  end

  it "should get another turn when 6 is rolled" do
    n = 6
    board.move(0,n)
    expect(board.pegs).to eq [[1,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
    expect(board.turn).to eq 1
    expect(board.current_player).to eq RED
    board.next_turn n

    board.move(0,5)
    expect(board.turn).to eq 2
    expect(board.current_player).to eq RED
    expect(board.pegs).to eq [[6,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end
end
