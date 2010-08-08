class AddDateOfAppointmentToAppointment < ActiveRecord::Migration
  def self.up
    add_column :appointments, :date_of_appointment, :date
  end

  def self.down
    remove_column :appointments, :date_of_appointment
  end
end
