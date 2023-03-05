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
  end

  describe '#count_of_teams' do
    it 'can count teams' do
      expect(@league_stats.count_of_teams).to eq(32)
    end
  end

  describe '#best_offense' do
    it 'can determine best offense' do
      expect(@league_stats.best_offense).to eq("Reign FC")
    end
  end

  describe '#worst_offense' do
    it 'can determine the worst offense' do
      expect(@league_stats.worst_offense).to eq("Utah Royals FC")
    end
  end

  describe '#highest_scoring_visitor' do
    it 'can determine highest scoring visitor' do
      expect(@league_stats.highest_scoring_visitor).to eq("Reign FC")
    end
  end

  describe '#highest_scoring_home_team' do
    it 'can determine highest scoring home team' do
      expect(@league_stats.highest_scoring_home_team).to eq("FC Dallas")
    end
  end

  describe '#lowest_scoring_visitor' do
    it 'can determine lowest scoring visitor' do
      expect(@league_stats.lowest_scoring_visitor).to eq("Chicago Red Stars")
    end
  end

  describe 'lowest_scoring_home_team' do
    it 'can determine lowest scoring home team' do
      expect(@league_stats.lowest_scoring_home_team).to eq("Portland Timbers")
    end
  end

  # Helper Methods 

  describe '#average_number_of_goals' do
    it 'returns the average number of goals per season' do
      mock_game_1 = double()
      allow(mock_game_1).to receive(:team_id).and_return('2')
    
      expect(@league_stats.average_number_of_goals(mock_game_1)).to eq(2.2941176470588234)
    end

  describe '#total_goals' do
    it 'returns total goals' do
      expect(@league_stats.total_goals_by_team("3")).to eq(39)
    end
  end

  describe '#total_games_by_team' do
    it 'returns total number of games for given team' do
      expect(@league_stats.total_games_by_team("3")).to eq(18)
    end
  end

  describe '#team_id_converter' do
    it 'returns team name based on given id' do
      expect(@league_stats.team_id_converter("3")).to eq("Houston Dynamo")
    end
  end

  describe '#avg_score_away_games'
    it 'returns average away game scores sorted by team' do
      mock_game_1 = double()
      mock_game_2 = double()
      sorted_hash_example = { "3" => [mock_game_1], "6" => [mock_game_2] }
      allow(mock_game_1).to receive(:goals).and_return(2)
      allow(mock_game_2).to receive(:goals).and_return(4)

      expect(@league_stats.avg_score_away_games(sorted_hash_example).values.sample).to be_a(Float)
      expect(@league_stats.avg_score_away_games(sorted_hash_example)).to eq( { "3" => 2.0, "6" => 4.0 } )
    end
  end

  describe '#filter_away_games and filter_home_games' do
    before(:each) do
      @mock_game_1 = double()
      @mock_game_2 = double()
      @mock_game_3 = double()
      @mock_game_4 = double()
      @sorted_hash_example = {"3" => [@mock_game_1, @mock_game_3], 
        "6" => [@mock_game_2, @mock_game_4]}
        
      allow(@mock_game_1).to receive(:hoa).and_return('home')
      allow(@mock_game_2).to receive(:hoa).and_return('home')
      allow(@mock_game_3).to receive(:hoa).and_return('away')
      allow(@mock_game_4).to receive(:hoa).and_return('away')
    end
        
    it 'returns just away games grouped by team' do
      expected_hash = {"3" => [@mock_game_3], 
        "6" => [@mock_game_4]}
      expect(@league_stats.filter_away_games(@sorted_hash_example)).
      to eq(expected_hash)
    end

    it 'returns just home games grouped by team' do
      expected_hash = {"3" => [@mock_game_1], 
        "6" => [@mock_game_2]}
      expect(@league_stats.filter_home_games(@sorted_hash_example)).
      to eq(expected_hash)
    end
  end
end