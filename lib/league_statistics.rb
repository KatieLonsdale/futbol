require_relative 'stats'

class LeagueStatistics < Stats
  def initialize(locations)
    super
  end

  def count_of_teams
    @teams.count
  end
#Name of the team with the highest average number of goals scored per game across all seasons.
  def best_offense
    best_offense = Hash.new(0)
    @game_teams.each do |game_team|
      average_number_of_goals = (game_team.goals).fdiv(count_of_teams)
      best_offense[game_team.team_id] += average_number_of_goals
    end
    best_offense.values
    require 'pry'; binding.pry
  end
# create hash - keys are team id
# values are average goals scored per game
# sort values 
# return highest value
# convert highest value's key to actual team name.
 # return team name

  # def worst_offense
  # end

  # def highest_scoring_visitor
  #   team = @teams.find do |team|
  #     team.team_id == 
  #   end
  # end

  # def highest_scoring_home_team
  # end

  # def lowest_scoring_visitor
  # end

  # def lowest_scoring_home_team
  # end
end