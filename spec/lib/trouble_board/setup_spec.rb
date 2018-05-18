require 'spec_helper'
include Player

RSpec.describe TroubleBoard do
  let(:board) { TroubleBoard.new(4) }

  it "should start with all pegs in home positions" do
    expect(board.pegs).to eq [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
  end

  it "should know who current player is" do
    expect(board.current_player).to eq RED
    board.next_turn 3
    expect(board.current_player).to eq BLUE
    board.next_turn 3
    expect(board.current_player).to eq GREEN
    board.next_turn 2
    expect(board.current_player).to eq YELLOW
    6.times { board.next_turn 5 }
    expect(board.current_player).to eq BLUE
    9.times { board.next_turn 1 }
    expect(board.current_player).to eq GREEN
  end

  it "should stay RED's turn when 6 is rolled" do
    expect(board.current_player).to eq RED
    expect(board.turn).to eq 1
    board.next_turn 6

    expect(board.current_player).to eq RED
    expect(board.turn).to eq 2

    board.next_turn 1
    expect(board.current_player).to eq BLUE
    expect(board.turn).to eq 3
  end

  it "current player should be RED" do
    expect(board.current_player).to eq RED

    board.current_player YELLOW
    expect(board.current_player).to eq YELLOW

    board.current_player BLUE
    expect(board.current_player).to eq BLUE
  end
end
