class Team < ApplicationRecord
  has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_team_id'
  has_many :wins, class_name: 'Game', foreign_key: 'winner_id'
  has_many :losses, class_name: 'Game', foreign_key: 'loser_id'
  has_and_belongs_to_many :seasons

  def all_games
    Game.where(home_team: self).or Game.where(away_team: self)
  end
  
  def season_games season
    self.all_games.where(season: season)
  end

  def details season
    played_home = Game.where(home_team: self).where(season: season).count
    home_won = 
    home_lost =
    played_away = Game.where(away_team: self).where(season: season).count
  end

  def home_games_played games # return
    games.where(home_team: self)
  end

  def away_games_played games
    games.where(away_team: self)
  end

  def home_goals_scored games # assumes you pass only home games
    games.sum(:home_team_goals)
  end

  def home_goals_conceded games # assumes you pass only home games
    games.sum(:away_team_goals)
  end

  def away_goals_scored games
    games.where(away_team: self).sum()
  end

  def away_goals_conceded games
  end



  def home_games_won games
  end

  def away_games_won games
  end

  def home_games_lost games
  end

  def away_games_lost games
  end

  def home_games_drawn games
  end

  def away_games_drawn games
  end
end