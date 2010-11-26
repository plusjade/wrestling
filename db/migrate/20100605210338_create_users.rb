class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :username, :string, :limit => 60
      t.column :password, :string
      t.references :group
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
 
