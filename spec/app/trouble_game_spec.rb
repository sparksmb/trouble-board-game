require 'spec_helper'

RSpec.describe TroubleGame do
  describe "setup" do
    let(:game) { TroubleGame.new([]) }

    it "should return 1" do
      expect(game.setup).to eq 1
    end
  end
end
