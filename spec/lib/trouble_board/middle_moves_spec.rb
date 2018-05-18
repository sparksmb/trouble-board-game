require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should move current peg the number on the die" do
    board.pegs = [ [1,0,0,0], [8,0,0,0], [15,0,0,0], [22,0,0,0] ]
    6.times {|n|
      board.move(0,n)
      board.next_turn
    }
    expect(board.pegs).to eq [ [5,0,0,0], [14,0,0,0], [17,0,0,0], [25,0,0,0] ]
  end

  it "should detect target space occupied" do
    board.pegs = [[0,0,0,0], [7,0,0,0], [0,0,0,0], [0,0,0,0]]
    expect(board.target_space_occupied_indicies(7)).to eq [1,0]

    board.pegs = [[0,0,0,0], [4,0,0,0], [0,0,0,0], [0,0,0,0]]
    expect(board.target_space_occupied_indicies(7)).to eq []
  end

  it "should send opponent home" do
    board.pegs = [[1,0,0,0], [7,0,0,0], [0,0,0,0], [0,0,0,0]]
    board.send_opponent_home(7)
    expect(board.pegs).to eq [[1,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should send RED home when YELLOW advances 5 spaces" do
    board.pegs = [[13,2,0,0], [0,0,0,0], [0,0,0,0], [25,0,0,0]]
    3.times{ board.next_turn }
    board.move(0,5)
    expect(board.pegs).to eq [[13,0,0,0], [0,0,0,0], [0,0,0,0], [2,0,0,0]]
  end

  it "should move 2nd BLUE peg 5 spaces out of start" do
    board.pegs = [[1,0,0,0], [23,8,0,0], [0,0,0,0], [0,0,0,0]]
    board.next_turn
    board.move(1,5)
    expect(board.pegs).to eq [[1,0,0,0], [23,13,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should move 1st YELLOW peg 5 spaces" do
    board.pegs = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [25,0,0,0]]
    3.times{ board.next_turn }
    board.move(0,5)
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [2,0,0,0]]
  end
end
