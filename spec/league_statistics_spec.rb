require './spec/spec_helper'

RSpec.describe LeagueStatistics do
  before(:each) do
    games = './data/mock_games.csv'
    teams = './data/teams.csv'
    game_teams = './data/mock_game_teams.csv'
    @locations = {
      games: games,
      teams: teams,
      game_teams: game_teams
    }
    @league_stats = LeagueStatistics.new(@locations)
  end
  describe '#initialize' do
    it 'exists' do 
      expect(@league_stats).to be_a LeagueStatistics
      expect(@league_stats).to be_a Stats
    end

    it 'has teams' do
      expect(@league_stats.teams).to be_a Array 
      expect(@league_stats.teams.sample).to be_a Team
    end

    it 'has games' do
      expect(@league_stats.games).to be_a Array
      expect(@league_stats.games.sample).to be_a Game
    end

    it 'has game_teams' do
      expect(@league_stats.game_teams).to be_a Array
      expect(@league_stats.game_teams.sample).to be_a GameTeams
    end

    it 'can count teams' do
      expect(@league_stats.count_of_teams).to eq(32)
    end

    xit 'can determine best offense' do
      expect(@league_stats.best_offense).to eq("Reign FC")
    end

    xit 'can determine the worst offense' do
      expect(@league_stats.worst_offense).to eq("Utah Royals FC")
    end

    xit 'can determine highest scoring visitor' do
      expect(@league_stats.highest_scoring_visitor).to eq("FC Dallas")
    end

    xit 'can determine highest scoring home team' do
      expect(@league_stats.highest_scoring_home_team).to eq("Reign FC")
    end

    xit 'can determine lowest scoring visitor' do
      expect(@league_stats.lowest_scoring_visitor).to eq("San Jose Earthquakes")
    end

    xit 'can determine lowest scoring home team' do
      expect(@league_stats.lowest_scoring_home_team).to eq("Utah Royals FC")
    end
  end
end