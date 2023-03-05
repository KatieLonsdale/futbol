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

  def worst_offense
    @league.worst_offense
  end

  def highest_scoring_visitor
    @league.highest_scoring_visitor
  end

  def lowest_scoring_visitor
    @league.lowest_scoring_visitor
  end

  def highest_scoring_home_team
    @league.highest_scoring_home_team
  end

  def lowest_scoring_home_team
    @league.lowest_scoring_home_team
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

