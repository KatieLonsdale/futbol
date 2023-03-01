require 'rspec'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    
    hash = {
      :game_id => 2012030221,
      :season => 20122013,
      :away_team_id => 3,
      :home_team_id => 6,
      :away_goals => 2,
      :home_goals => 3
    }
    @game = Game.new(hash)
  end

  it 'exists' do
    expect(@game).to be_a(Game)
  end

  it 'has attributes' do
    expect(@game.game_id).to eq(2012030221)
    expect(@game.season).to eq(20122013)
    expect(@game.away_team_id).to eq(3)
    expect(@game.home_team_id).to eq(6)
    expect(@game.away_goals).to eq(2)
    expect(@game.home_goals).to eq(3)
  end
end