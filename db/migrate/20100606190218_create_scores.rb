class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.integer :scored_on_id, :score_value, :score_order
      t.string :score_type, :match_time
      
      t.boolean :first_score, :first_takedown
      
      t.references :bout
      t.references :wrestler
      
      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
