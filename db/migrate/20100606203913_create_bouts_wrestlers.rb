class CreateBoutsWrestlers < ActiveRecord::Migration
  def self.up
    create_table :bouts_wrestlers, :id => false do |t|
      t.references :wrestler
      t.references :bout
      
      t.timestamps
    end
    add_index :bouts_wrestlers, [:wrestler_id, :bout_id]

    add_index :bouts_wrestlers, :bout_id
  end

  def self.down
    remove_index :bouts_wrestlers, [:wrestler_id, :bout_id]
    remove_index :bouts_wrestlers, :bout_id
    drop_table :bouts_wrestlers
  end
end
