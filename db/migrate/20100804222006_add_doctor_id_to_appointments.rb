class AddDoctorIdToAppointments < ActiveRecord::Migration
  def self.up
    add_column :appointments, :doctor_id, :integer
  end

  def self.down
    remove_column :appointments, :doctor_id
  end
end
