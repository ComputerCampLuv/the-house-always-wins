class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :winner, class_name: 'Team', optional: true
  belongs_to :loser, class_name: 'Team', optional: true
  belongs_to :season

  validates :home_team, :away_team, :home_team_goals, :away_team_goals, :match_date, presence: true
  before_validation :calculate_result

  private
    def calculate_result
      if home_team_goals > away_team_goals
        self.winner = home_team
        self.loser = away_team
        self.draw = false
      elsif home_team_goals < away_team_goals
        self.winner = away_team
        self.loser = home_team
        self.draw = false
      else
        self.draw = true
      end
    end
end
