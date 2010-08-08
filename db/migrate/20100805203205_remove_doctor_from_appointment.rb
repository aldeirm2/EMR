class RemoveDoctorFromAppointment < ActiveRecord::Migration
  def self.up
    remove_column :appointments, :doctor
  end

  def self.down
    add_column :appointments, :doctor, :string
  end
end
