require './spec/spec_helper'

RSpec.describe StatTracker do
  before(:each) do
    games = './data/mock_games.csv'
    teams = './data/teams.csv'
    game_teams = './data/mock_game_teams.csv'
    @locations = {
      games: games,
      teams: teams,
      game_teams: game_teams
    }
    @stat = Stats.new(@locations)
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@stat).to be_a Stats
    end

    it 'has instance variables that contain arrays of objects' do
      expect(@stat.teams).to be_a Array 
      expect(@stat.teams.sample).to be_a Team
      expect(@stat.games).to be_a Array
      expect(@stat.games.sample).to be_a Game
      expect(@stat.game_teams).to be_a Array
      expect(@stat.game_teams.sample).to be_a GameTeams
    end
  end
end