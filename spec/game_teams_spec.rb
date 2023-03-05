require './spec/spec_helper'

RSpec.describe GameTeams do
  before(:each) do
    game_teams_info = {
      game_id: 2012030221,
      team_id: 3,
      hoa: "away",
      result: "LOSS",
      head_coach: "John Tortorella",
      goals: 2,
      shots: 8,
      tackles: 44
    }
    @game_teams = GameTeams.new(game_teams_info)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@game_teams).to be_a(GameTeams)
    end

    it '#game_id' do
      expect(@game_teams.game_id).to eq(2012030221)
    end

    it '#team_id' do
      expect(@game_teams.team_id).to eq(3)
    end

    it '#hoa' do
      expect(@game_teams.hoa).to eq("away")
    end

    it '#result' do
      expect(@game_teams.result).to eq("LOSS")
    end

    it '#head_coach' do
      expect(@game_teams.head_coach).to eq("John Tortorella")
    end

    it '#goals' do
      expect(@game_teams.goals).to eq(2)
    end

    it '#shots' do
      expect(@game_teams.shots).to eq(8)
    end

    it '#tackles' do
      expect(@game_teams.tackles).to eq(44)
    end
  end
end