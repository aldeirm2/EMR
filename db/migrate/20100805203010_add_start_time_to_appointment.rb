class AddStartTimeToAppointment < ActiveRecord::Migration
  def self.up
    add_column :appointments, :start_time, :time
  end

  def self.down
    remove_column :appointments, :start_time
  end
end
