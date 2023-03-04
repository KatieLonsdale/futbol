require_relative 'stats'

class SeasonStatistics < Stats
  def initialize(locations)
    super
  end

  # def most_accurate_team
  #   require 'pry'; binding.pry
  #   # group by team id values shots goals
  #   # shots for all games = game.shots
  #   # goals for all games = game.goals
  #   # get ratio of shots to goals (accuracy helper method)
  #   # sort by accuracy
  #   # return most accurate

  #   games_by_team = @game_teams.group_by {|game_team| game_team.team_id}
  #     end
  # end

  def accuracy(goals, shots)
    goals.fdiv(shots).round(2)
  end
end