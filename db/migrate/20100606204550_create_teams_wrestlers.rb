class CreateTeamsWrestlers < ActiveRecord::Migration
  def self.up
    create_table :teams_wrestlers, :id => false do |t|
      t.references :wrestler
      t.references :team
      
      t.timestamps
    end
    add_index :teams_wrestlers, [:wrestler_id, :team_id]

    add_index :teams_wrestlers, :team_id
  end

  def self.down
    remove_index :teams_wrestlers, [:wrestler_id, :team_id]
    remove_index :teams_wrestlers, :team_id
    drop_table :teams_wrestlers
  end
end
