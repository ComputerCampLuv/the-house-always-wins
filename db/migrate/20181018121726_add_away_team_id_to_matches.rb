class AddAwayTeamIdToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :away_team_id, :integer
    add_index :matches, :away_team_id
  end
end
