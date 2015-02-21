class ChangeDatetimeToBoolean < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.change :completed, :boolean, default: false
    end
  end
 
  def self.down
    change_table :tasks do |t|
      t.change :completed, :datetime
    end
  end
end
