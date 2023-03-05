require './spec/spec_helper'

RSpec.describe StatTracker do
  before(:each) do
    games = './data/games.csv'
    teams = './data/teams.csv'
    game_teams = './data/game_teams.csv'
    @locations = {
      games: games,
      teams: teams,
      game_teams: game_teams
    }
    @stat_tracker = StatTracker.new(@locations)
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@stat_tracker).to be_a StatTracker
      expect(@stat_tracker.game).to be_a GameStatistics
      expect(@stat_tracker.league).to be_a LeagueStatistics
      expect(@stat_tracker.season).to be_a SeasonStatistics
    end
  end

  describe '#self.from_csv' do
    it 'returns an instance of StatTracker' do
      expect(StatTracker.from_csv(@locations)).to be_a StatTracker
      expect(@stat_tracker.game).to be_a GameStatistics
      expect(@stat_tracker.league).to be_a LeagueStatistics
      expect(@stat_tracker.season).to be_a SeasonStatistics
    end
  end

  describe '#percentage_home_wins' do
    it 'returns the percentage of home team wins' do
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
      expect(@stat_tracker.percentage_home_wins).to be_a Float
    end
end

  describe '#percentage_visitor_wins' do
    it 'returns the percentage of visitor team wins' do
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
      expect(@stat_tracker.percentage_visitor_wins).to be_a Float
    end
  end

  describe '#percentage_ties' do
    it 'returns percentage of ties' do
      expect(@stat_tracker.percentage_ties).to eq(0.2)
      expect(@stat_tracker.percentage_ties).to be_a Float
    end
  end

  describe '#most_accurate_team' do
    it 'returns the team with the best ratio of shots to goals' do
      expect(@stat_tracker.most_accurate_team('20122013')).to eq('DC United')
      expect(@stat_tracker.most_accurate_team('20142015')).to eq('Toronto FC')
    end
  end

  describe '#least_accurate_team' do
    it 'returns the team with the worst ratio of shots to goals' do
      expect(@stat_tracker.least_accurate_team('20122013')).to eq('New York City FC')
      expect(@stat_tracker.least_accurate_team('20142015')).to eq('Columbus Crew SC')
    end
  end

  describe '#most_tackles' do
    it 'returns the team with the most tackles in given season' do
      expect(@stat_tracker.most_tackles('20122013')).to eq('FC Cincinnati')
      expect(@stat_tracker.most_tackles('20142015')).to eq('Seattle Sounders FC')
    end
  end

  describe '#fewest_tackles' do
    it 'returns the team with the least tackles in given season' do
      expect(@stat_tracker.fewest_tackles('20122013')).to eq('Atlanta United')
      expect(@stat_tracker.fewest_tackles('20142015')).to eq('Orlando City SC')
    end
  end

  describe '#winningest_coach' do
    it 'returns coach with best winning percentage for given season' do
      expect(@stat_tracker.winningest_coach("20122013")).to eq("Dan Lacroix")
    end
  end

  describe '#worst_coach' do
    it 'returns coach with the worst percentage for given season' do
      expect(@stat_tracker.worst_coach("20122013")).to eq("Martin Raymond")
    end
  end
end