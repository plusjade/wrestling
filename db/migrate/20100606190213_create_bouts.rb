class CreateBouts < ActiveRecord::Migration
  def self.up
    create_table :bouts do |t|
      t.integer :red_id, :green_id, :red_final, :green_final, :winner_id, :loser_id, :red_team_id, :green_team_id
      t.string :weight_class, :result, :time
      
      t.references :team
      t.references :event
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bouts
  end
end
