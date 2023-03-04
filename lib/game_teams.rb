class GameTeams
  attr_reader :game_id, 
              :team_id, 
              :hoa, 
              :result, 
              :head_coach, 
              :goals, 
              :shots, 
              :tackles

  def initialize(game_teams_info)
    @game_id = game_teams_info[:game_id]
    @team_id = game_teams_info[:team_id]
    @hoa = game_teams_info[:hoa]
    @result = game_teams_info[:result]
    @head_coach = game_teams_info[:head_coach]
    @goals = game_teams_info[:goals].to_i
    @shots = game_teams_info[:shots].to_i
    @tackles = game_teams_info[:tackles].to_i
  end
end