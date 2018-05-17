require 'spec_helper'
include Player

RSpec.describe TroubleGame do
  describe "setup" do
    let(:players) {[
      RandomPlayer,
      RandomPlayer,
      RandomPlayer,
      RandomPlayer
    ]}

    let(:game) { TroubleGame.new(players) }

    describe "game setup" do
      before(:each) { game.setup }

      it "should assign a color to each player" do
        expect(game.players.map(&:color)).to eq [RED,BLUE,GREEN,YELLOW]
      end
    end
  end
end
