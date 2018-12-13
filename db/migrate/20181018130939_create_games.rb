class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :home_team, foreign_key: true
      t.references :away_team, foreign_key: true
      t.integer :home_team_goals
      t.integer :away_team_goals
      t.datetime :match_date

      t.timestamps
    end
  end
end
