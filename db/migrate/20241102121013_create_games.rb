class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.integer :score
      t.integer :best_score

      t.timestamps
    end
  end
end
