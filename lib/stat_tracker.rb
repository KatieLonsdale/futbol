require 'csv'

class StatTracker 
  attr_reader :game, :league, :season

  def initialize(locations)
    @game = GameStatistics.new(locations)
    @league = LeagueStatistics.new(locations)
    @season = SeasonStatistics.new(locations)
  end
  
  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  # Game Stats

  def percentage_home_wins
    @game.percentage_home_wins
  end

  def percentage_visitor_wins
    @game.percentage_visitor_wins
  end

  def percentage_ties
    @game.percentage_ties
  end

  # League Stats
  
  def count_of_teams
    @league.count_of_teams
  end

  def best_offense
    @league.best_offense
  end

  # Season Stats
  def most_accurate_team(season)
    @season.most_accurate_team(season)
  end

  def least_accurate_team(season)
    @season.least_accurate_team(season)
  end

  def most_tackles(season)
    @season.most_tackles(season)
  end

  def fewest_tackles(season)
    @season.fewest_tackles(season)
  end
end

