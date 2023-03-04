require './spec/spec_helper'

RSpec.describe SeasonStatistics do
  before(:each) do
    games = './data/mock_games.csv'
    teams = './data/teams.csv'
    game_teams = './data/mock_game_teams.csv'
    @locations = {
      games: games,
      teams: teams,
      game_teams: game_teams
    }
    @season_stats = SeasonStatistics.new(@locations)
  end
  describe '#initialize' do
    it 'exists' do 
      expect(@season_stats).to be_a SeasonStatistics
      expect(@season_stats).to be_a Stats
    end

    it 'has teams' do
      expect(@season_stats.teams).to be_a Array 
      expect(@season_stats.teams.sample).to be_a Team
    end

    it 'has games' do
      expect(@season_stats.games).to be_a Array
      expect(@season_stats.games.sample).to be_a Game
    end

    it 'has game_teams' do
      expect(@season_stats.game_teams).to be_a Array
      expect(@season_stats.game_teams.sample).to be_a GameTeams
    end
  end

  describe '#most_accurate_team' do
    xit 'returns the team with the best ratio of shots to goals' do
      expect(@season_stats.most_accurate_team).to eq('Utah Royals FC')
    end
  end

  describe '#accuracy' do
    it 'returns goals divided by number of shots' do
      expect(@season_stats.accuracy(5,10)).to eq 0.50
      expect(@season_stats.accuracy(3, 9)).to eq 0.33
    end
  end
end