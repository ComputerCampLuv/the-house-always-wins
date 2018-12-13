class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.integer :home_team_goals
      t.integer :away_team_goals
      t.datetime :match_date

      t.timestamps
    end
  end
end
