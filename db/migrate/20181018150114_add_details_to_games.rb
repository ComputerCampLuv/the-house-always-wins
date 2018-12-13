class AddDetailsToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :winner, foreign_key: true
    add_reference :games, :loser, foreign_key: true
    add_column :games, :draw, :boolean
  end
end
