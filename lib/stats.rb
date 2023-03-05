require 'csv'

class Stats
  attr_reader :teams, 
              :games, 
              :game_teams
  
  def initialize(locations)
    @teams = CSV.read(locations[:teams], headers: true, 
      header_converters: :symbol).map { |row| Team.new(row) }
    @games = CSV.read(locations[:games], headers: true, 
      header_converters: :symbol).map { |row| Game.new(row) }
    @game_teams = CSV.read(locations[:game_teams], headers: true, 
      header_converters: :symbol).map { |row| GameTeams.new(row) }
  end
end
