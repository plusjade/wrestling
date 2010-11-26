class CreateEventsTeams < ActiveRecord::Migration
  def self.up
    create_table :events_teams, :id => false do |t|
      t.references :team
      t.references :event
      
      t.timestamps
    end
    add_index :events_teams, [:team_id, :event_id]

    add_index :events_teams, :event_id
  end

  def self.down
    remove_index :events_teams, [:team_id, :event_id]
    remove_index :events_teams, :event_id
    drop_table :events_teams
  end
end
