require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should start with all pegs in home positions" do
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should know who current player is" do
    expect(board.current_player).to eq RED
    board.next_turn
    expect(board.current_player).to eq BLUE
    board.next_turn
    expect(board.current_player).to eq GREEN
    board.next_turn
    expect(board.current_player).to eq YELLOW
    6.times { board.next_turn }
    expect(board.current_player).to eq BLUE
    9.times { board.next_turn }
    expect(board.current_player).to eq GREEN
  end
end
