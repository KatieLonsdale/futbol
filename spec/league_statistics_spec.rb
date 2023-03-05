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

  it 'can count teams' do
    expect(@league_stats.count_of_teams).to eq(32)
  end

  it 'can determine best offense' do
    expect(@league_stats.best_offense).to eq("Reign FC")
  end

  it 'can determine the worst offense' do
    expect(@league_stats.worst_offense).to eq("Utah Royals FC")
  end


  it 'can determine highest scoring visitor' do
    expect(@league_stats.highest_scoring_visitor).to eq("Reign FC")
  end

  it 'can determine highest scoring home team' do
    expect(@league_stats.highest_scoring_home_team).to eq("FC Dallas")
  end

  it 'can determine lowest scoring visitor' do
    expect(@league_stats.lowest_scoring_visitor).to eq("Chicago Red Stars")
  end

  it 'can determine lowest scoring home team' do
    expect(@league_stats.lowest_scoring_home_team).to eq("Portland Timbers")
  end

  describe 'helper methods' do
    describe '#average_number_of_goals' do
      it 'returns the average number of goals per season' do
        mock_game_1 = double()
        allow(mock_game_1).to receive(:team_id).and_return('2')
      
        expect(@league_stats.average_number_of_goals(mock_game_1)).to eq(2.2941176470588234)
      end

      it 'total_goals' do
        expect(@league_stats.total_goals_by_team("3")).to eq(39)
      end

      it 'total_game_by_team' do
        expect(@league_stats.total_games_by_team("3")).to eq(18)
      end

      it 'team_id_converter' do
        expect(@league_stats.team_id_converter("3")).to eq("Houston Dynamo")
      end

      it 'avg_score_away_games' do
        mock_game_1 = double()
        mock_game_2 = double()
        sorted_hash_example = { "3" => [mock_game_1], "6" => [mock_game_2] }
        allow(mock_game_1).to receive(:goals).and_return(2)
        allow(mock_game_2).to receive(:goals).and_return(4)

        expect(@league_stats.avg_score_away_games(sorted_hash_example).values.sample).to be_a(Float)
        expect(@league_stats.avg_score_away_games(sorted_hash_example)).to eq( { "3" => 2.0, "6" => 4.0 } )
      end
    end
  end
end