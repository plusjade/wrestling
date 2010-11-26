class CreateWrestlers < ActiveRecord::Migration
  def self.up
    create_table :wrestlers do |t|
      t.column :last_name, :string
      t.column :first_name, :string
      t.column :weight_class, :string
      
      t.timestamps
    end
  end

  def self.down
    drop_table :wrestlers
  end
end
