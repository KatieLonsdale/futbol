require_relative 'stats'

class SeasonStatistics < Stats
  def initialize(locations)
    super
  end

  def most_accurate_team(season)
    games_in_season = filter_game_teams_by_season(season)
    games_by_team = games_in_season.group_by {|game_team| game_team.team_id}
    games_by_team = goals_and_shots_by_team(games_by_team)
    games_by_team = games_by_team.transform_values! do |array| 
      accuracy(array[0], array[1])
    end
    team = games_by_team.max_by{|team, accuracy| accuracy}
    team_by_id(team.first)
  end

  def least_accurate_team(season)
    games_in_season = filter_game_teams_by_season(season)
    games_by_team = games_in_season.group_by {|game_team| game_team.team_id}
    games_by_team = goals_and_shots_by_team(games_by_team)
    games_by_team = games_by_team.transform_values! do |array| 
      accuracy(array[0], array[1])
    end
    team = games_by_team.min_by{|team, accuracy| accuracy}
    team_by_id(team.first)
  end

  def filter_game_teams_by_season(season)
    year = season[0,4]
    @game_teams.select{|game| game.game_id.start_with?(year)}
  end

  def goals_and_shots_by_team(hash)
    hash.transform_values do |games|
      [goals = 0, shots = 0]
      games.each do |game|
        shots += game.shots.to_i
        goals += game.goals.to_i
      end
      [goals, shots]
    end
  end

  def accuracy(goals, shots)
    goals.fdiv(shots).round(2)
  end

  def team_by_id(id)
    team = @teams.find{|team| team.team_id == id.to_s}
    team.team_name
  end
end