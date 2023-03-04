require_relative 'stats'

class SeasonStatistics < Stats
  def initialize(locations)
    super
  end

  # def most_accurate_team
  #   # group by team id values shots goals
  #   # shots for all games = game.shots
  #   # goals for all games = game.goals
  #   # get ratio of shots to goals (accuracy helper method)
  #   # sort by accuracy
  #   # return most accurate

  #   games_by_team = @game_teams.group_by {|game_team| game_team.team_id}
  #   games_by_team = goals_and_shots_by_team(games_by_team)
  #   games_by_team = games_by_team.transform_values! do |array| 
  #     accuracy(array[0], array[1])
  #   end
  #   games_by_team.max_by{|team, accuracy| accuracy}
  #   require 'pry'; binding.pry
  # end

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
end