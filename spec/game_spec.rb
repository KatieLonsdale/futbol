require './spec/spec_helper'

RSpec.describe Game do
  before(:each) do
    
    hash = {
      :game_id => 2012030221,
      :season => 20122013,
      :away_team_id => 3,
      :home_team_id => 6,
      :away_goals => 2,
      :home_goals => 3
    }
    @game = Game.new(hash)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@game).to be_a(Game)
    end

    it '#game_id' do
      expect(@game.game_id).to eq(2012030221)
    end

    it '#season' do
      expect(@game.season).to eq(20122013)
    end

    it '#away_team_id' do
      expect(@game.away_team_id).to eq(3)
    end

    it '#home_team_id' do
      expect(@game.home_team_id).to eq(6)
    end

    it '#away_goals' do
      expect(@game.away_goals).to eq(2)
    end

    it '#home_goals' do
      expect(@game.home_goals).to eq(3)
    end
  end
end