class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.column :team_name, :string
      t.column :country, :string
      t.column :state, :string
      t.column :organization, :string
      
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
