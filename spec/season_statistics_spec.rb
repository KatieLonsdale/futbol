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
    it 'returns the team with the best ratio of shots to goals' do
      expect(@season_stats.most_accurate_team).to eq('Utah Royals FC')
    end
  end

  describe '#least_accurate_team' do
    it 'returns the team with the worst ratio of shots to goals' do
      expect(@season_stats.least_accurate_team).to eq('Columbus Crew SC')
      # getting a tie...not sure how to best adjust method
    end
  end

  describe '#goals_and_shots_by_team' do
    it 'returns a new hash with values as array of goals and shots' do
      mock_game_1 = double()
      mock_game_2 = double()
      given_hash = {team: [mock_game_1], team2: [mock_game_2]}
      expected_hash = {team: [2, 5], team2: [4, 7]}

      allow(mock_game_1).to receive(:goals).and_return('2')
      allow(mock_game_1).to receive(:shots).and_return('5')
      allow(mock_game_2).to receive(:goals).and_return('4')
      allow(mock_game_2).to receive(:shots).and_return('7')

      expect(@season_stats.goals_and_shots_by_team(given_hash)).to eq(expected_hash)
    end
  end

  describe '#accuracy' do
    it 'returns goals divided by number of shots' do
      expect(@season_stats.accuracy(5,10)).to eq 0.50
      expect(@season_stats.accuracy(3, 9)).to eq 0.33
    end
  end

  describe '#team_by_id' do
    it 'returns team based on given team id' do
      expect(@season_stats.team_by_id(1)).to eq('Atlanta United')
      expect(@season_stats.team_by_id(13)).to eq('Houston Dash')
    end
  end
end