require 'spec_helper'
include Player

RSpec.describe RandomPlayer do
  let(:player) { RandomPlayer.new(RED) }

  describe "choose_peg" do
    it "should choose nothing when no peg can move" do
      player.update([[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
      expect(player.choose_peg(3)).to eq nil
    end

    it "should choose 1st home peg when rolling a 6" do
      player.update([[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
      expect(player.choose_peg(6)).to eq 0
    end

    it "should choose next home peg when rolling a 6" do
      player.update([[5,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
      expect(player.choose_peg(6)).to eq 1

      player.update([[9,5,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
      expect(player.choose_peg(6)).to eq 2

      player.update([[9,7,5,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
      expect(player.choose_peg(6)).to eq 3

      player.update([[9,7,5,1], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
      50.times { expect((0..3).include? player.choose_peg(6)).to be_truthy }
    end
  end
end
