class RemoveDateOfAppointmentFromAppointment < ActiveRecord::Migration
  def self.up
    remove_column :appointments, :date_of_appointment
  end

  def self.down
    add_column :appointments, :date_of_appointment, :time
  end
end
