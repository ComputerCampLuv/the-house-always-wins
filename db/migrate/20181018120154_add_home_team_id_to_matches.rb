class AddHomeTeamIdToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :home_team_id, :integer
    add_index :matches, :home_team_id
  end
end
