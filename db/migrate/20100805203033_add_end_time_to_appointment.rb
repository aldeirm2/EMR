class AddEndTimeToAppointment < ActiveRecord::Migration
  def self.up
    add_column :appointments, :end_time, :time
  end

  def self.down
    remove_column :appointments, :end_time
  end
end
