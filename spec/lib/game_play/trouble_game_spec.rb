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


    describe "game setup" do
      before(:each) { game.setup }

      it "should initialize board" do
        expect(game.board.pegs).to eq [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
      end

      it "should assign a color to each player" do
        expect(game.players.map(&:color)).to eq [RED,BLUE,GREEN,YELLOW]
      end

      it "should take a turn" do
        game.current_player_takes_turn(6)
        game.current_player_takes_turn(3)
        game.current_player_takes_turn(6)
        expect(game.log).to eq [
          "turn|color|peg|roll",
          "1|RED|0|6",
          "2|RED|0|3",
          "3|BLUE|0|6"
        ]
      end
    end
  end
end
