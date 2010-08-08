class RemoveTimeSlotsFromAppointment < ActiveRecord::Migration
  def self.up
    remove_column :appointments, :time_slot
  end

  def self.down
    add_column :appointments, :time_slot, :datetime
  end
end
