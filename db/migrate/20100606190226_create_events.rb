class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title, :host, :country, :state, :address, :zip_code
      t.datetime :date
      
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
