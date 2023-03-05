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
    sorted = best_offense.max_by{|team, avg_goals| avg_goals}
    team_id_string = sorted[0]
    team_id_converter(team_id_string)
  end

  def worst_offense
    worst_offense = Hash.new(0)
    @game_teams.each do |game_team|
      worst_offense[game_team.team_id] = average_number_of_goals(game_team)
    end
    sorted = worst_offense.min_by{|team, avg_goals| avg_goals}
    team_id_string = sorted[0]
    team_id_converter(team_id_string)
  end

  def highest_scoring_visitor
    grouped_teams = @game_teams.group_by { |game| game.team_id}
    sorted_teams = filter_away_games(grouped_teams)
    avg_game = avg_score_away_games(sorted_teams)
    highest_scoring_visitor_array = avg_game.max_by { |team, avg_score| avg_score}
    id_string = highest_scoring_visitor_array[0]
    team_id_converter(id_string)
  end

  def lowest_scoring_visitor
    grouped_teams = @game_teams.group_by { |game| game.team_id}
    sorted_teams = filter_away_games(grouped_teams)
    avg_game = avg_score_away_games(sorted_teams)
    lowest_scoring_visitor_array = avg_game.min_by { |team, avg_score| avg_score}
    id_string = lowest_scoring_visitor_array[0]
    team_id_converter(id_string)
  end

  def highest_scoring_home_team
    grouped_teams = @game_teams.group_by { |game| game.team_id}
    sorted_teams = filter_home_games(grouped_teams)
    avg_game = avg_score_away_games(sorted_teams)
    highest_scoring_home_array = avg_game.max_by { |team, avg_score| avg_score}
    id_string = highest_scoring_home_array[0]
    team_id_converter(id_string)
  end

  def lowest_scoring_home_team
    grouped_teams = @game_teams.group_by { |game| game.team_id}
    sorted_teams = filter_home_games(grouped_teams)
    avg_game = avg_score_away_games(sorted_teams)
    lowest_scoring_home_array = avg_game.min_by { |team, avg_score| avg_score}
    id_string = lowest_scoring_home_array[0]
    team_id_converter(id_string)
  end

  #Helper Methods

  def average_number_of_goals(game_team)
    total_goals = (total_goals_by_team(game_team.team_id))
    total_goals.fdiv(total_games_by_team(game_team.team_id))
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
    @game_teams.each{|game_team| total_games += 1 if game_team.team_id == team_id}
    total_games
  end

  def team_id_converter(team_id)
    best_team = " "
    @teams.each{|team| best_team = team.team_name if team.team_id == team_id}
    best_team
  end

  def avg_score_away_games(sorted_teams)
    sorted_teams.transform_values do |games|
      goals = games.sum{|game| game.goals}
      goals.fdiv(games.length)
    end
  end

  def filter_away_games(sorted_teams)
    sorted_teams.transform_values do |games|
      games.select{|game| game.hoa == "away"}
    end
  end

  def filter_home_games(sorted_teams)
    sorted_teams.transform_values do |games|
      games.select{|game| game.hoa == "home"}
    end
  end
end