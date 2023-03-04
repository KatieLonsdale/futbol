require_relative 'stats'

class LeagueStatistics < Stats
  def initialize(locations)
    super
  end

  def count_of_teams
    @teams.count
  end

  def best_offense
    best_offense = Hash.new(0)
    @game_teams.each do |game_team|
      best_offense[game_team.team_id] = average_number_of_goals(game_team)
    end
    sorted = best_offense.sort_by { |_,v| -v }
    team_id_string = sorted[0][0]
    team_id_converter(team_id_string)
  end

  def worst_offense
    worst_offense = Hash.new(0)
    @game_teams.each do |game_team|
      worst_offense[game_team.team_id] = average_number_of_goals(game_team)
    end
    sorted = worst_offense.sort_by { |_,v| v }
    team_id_string = sorted[0][0]
    team_id_converter(team_id_string)
  end

  #helper methods
  def average_number_of_goals(game_team)
    (total_goals_by_team(game_team.team_id)).fdiv(total_games_by_team(game_team.team_id))
  end

  def total_goals_by_team(team_id)
    total_goals = 0
    @game_teams.each do |game_team|
      total_goals += game_team.goals if game_team.team_id == team_id
    end
    total_goals
  end
  
  def total_games_by_team(team_id)
    total_games = 0
    @game_teams.each do |game_team|
      total_games += 1 if game_team.team_id == team_id
    end
    total_games
  end

  def team_id_converter(team_id_string)
    best_team = " "
    @teams.each do |team|
      best_team = team.team_name if team.team_id == team_id_string
    end
    best_team
  end

  
  def highest_scoring_visitor
    visitor_games = Hash.new(0)
    @game_teams.each do |game_team|
      visitor_games[game_team.team_id] = avg_score_away_games
      require 'pry'; binding.pry
    end
  end

  def array_of_visiting_games(game_team)
    array_of_visiting_games = []
    array_of_visiting_games << game_team if game_team.hoa == "away"
  end

  
  def avg_score_away_games
    grouped_teams = @games_teams.group_by { |game| game.team_id}
    sorted_team = grouped_teams.transform_values do |array|
    array.select{|game| game.hoa == "away"}
    end
    goals = 0
    sorted_team.values.each do |game|
      goals += game.goals
    end
    goals
    goals.fdiv(sorted_teams.length)
  end
# create a hash
# team ID to be keys
# array of visiting games to be values
# find the average score of values
# sort hash by values
# sort hash by values
# helper meth-team id and highest score away avg
# return string




  # def highest_scoring_home_team
  # end


  # def lowest_scoring_visitor
  # end

  # def lowest_scoring_home_team
  # end
end