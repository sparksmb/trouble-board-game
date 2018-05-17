require 'spec_helper'
include Player

RSpec.describe TroubleGame do
  describe "setup" do
    let(:players) {[
      RandomPlayer.new("Bill"),
      RandomPlayer.new("Ted"),
      RandomPlayer.new("Jed"),
      RandomPlayer.new("Harry")
    ]}

    let(:game) { TroubleGame.new(players) }

    it "should initialize" do
      game.setup
    end

    describe "game setup" do
      before(:each) { game.setup }

      it "should assign a color to each player" do
        expect(game.players.map(&:color)).to eq [RED,BLUE,GREEN,YELLOW]
      end

      it "should take a turn" do
        game.current_player_takes_turn(6)
        game.current_player_takes_turn(3)
        game.current_player_takes_turn(6)
      end
    end
  end
end
