class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :start_year
      t.integer :end_year
      t.belongs_to :league, foreign_key: true

      t.timestamps
    end
  end
end
