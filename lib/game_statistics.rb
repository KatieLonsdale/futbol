require_relative 'stats'

class GameStatistics < Stats
  def initialize(locations)
    super
  end

  def percentage_home_wins
    home_wins = 0
    @games.each{|game| home_wins += 1 if game.home_goals > game.away_goals}
    percentage = (home_wins.to_f / @games.count.to_f)
    percentage.round(2)
  end

  def percentage_visitor_wins
    visitor_wins = 0
    @games.each {|game| visitor_wins += 1 if game.home_goals < game.away_goals}
    percentage = (visitor_wins.to_f / @games.count.to_f)
    percentage.round(2)
  end

  def percentage_ties
    ties = 0
    @games.each {|game| ties += 1 if game.home_goals == game.away_goals}
    percentage = (ties.to_f / @games.count.to_f)
    percentage.round(2)
  end

  def highest_total_score
    sorted_scores.last
  end

  def lowest_total_score
    sorted_scores.first
  end

  def average_goals_per_game
    average_score = (sorted_scores.sum).fdiv(sorted_scores.length)
    average_score.round(2)
  end

  def count_of_games_by_season
    game_by_season = Hash.new(0)
    @games.each{|game| game_by_season[game.season] += 1}
    game_by_season
  end

  def average_goals_by_season
    games_by_season = @games.group_by{|game|game.season}
    goals_by_season = games_by_season.transform_values do |games|
      total_games = games.map{|game| game.home_goals + game.away_goals}.sum
      average_goals = total_games.fdiv(games.length)
      average_goals.round(2)
    end
  end

# Helper Methods

  def sorted_scores
    scores = []
    @games.each {|game| sum_of_goals = (game.home_goals + game.away_goals)
      scores << sum_of_goals}
    scores.sort!
  end
end