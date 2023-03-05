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
      expect(@season_stats.most_accurate_team('20122013')).to eq('Minnesota United FC')
      expect(@season_stats.most_accurate_team('20132014')).to eq('North Carolina Courage')
    end
  end

  describe '#least_accurate_team' do
    it 'returns the team with the worst ratio of shots to goals' do
      expect(@season_stats.least_accurate_team('20122013')).to eq('FC Cincinnati')
      expect(@season_stats.least_accurate_team('20132014')).to eq('FC Cincinnati')
    end
  end

  describe '#most_tackles' do
    it 'returns the team with the most tackles in given season' do
      expect(@season_stats.most_tackles('20122013')).to eq('Houston Dynamo')
      expect(@season_stats.most_tackles('20132014')).to eq('Vancouver Whitecaps FC')
    end
  end

  describe '#fewest_tackles' do
    it 'returns the team with the least tackles in given season' do
      expect(@season_stats.fewest_tackles('20122013')).to eq('New England Revolution')
      expect(@season_stats.fewest_tackles('20132014')).to eq('Chicago Fire')
    end
  end

  describe '#winningest_coach' do
    it 'returns coach with best winning percentage for given season' do
      expect(@season_stats.winningest_coach("20122013")).to be_a(String)
    end
  end

  describe '#filter_game_teams_by_season' do
    it 'returns list of game teams that took place in given season' do
      filtered_games = @season_stats.filter_game_teams_by_season('20122013')
      expect(filtered_games.all?{|game| game.game_id.start_with?('2012')}).to be true
    end
  end

  describe '#tackles_by_team' do
    it 'returns number of tackles by team' do
      mock_game_1 = double()
      mock_game_2 = double()
      given_hash = {team: [mock_game_1], team2: [mock_game_2]}
      expected_hash = {team: 20, team2: 30}

      allow(mock_game_1).to receive(:tackles).and_return(20)
      allow(mock_game_2).to receive(:tackles).and_return(30)

      expect(@season_stats.tackles_by_team(given_hash)).to eq(expected_hash)
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
      expect(@season_stats.accuracy(5,10)).to eq 0.50000
      expect(@season_stats.accuracy(3, 9)).to eq 0.33333
    end
  end

  describe '#team_by_id' do
    it 'returns team based on given team id' do
      expect(@season_stats.team_by_id(1)).to eq('Atlanta United')
      expect(@season_stats.team_by_id(13)).to eq('Houston Dash')
    end
  end
end