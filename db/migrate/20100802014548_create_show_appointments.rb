class CreateShowAppointments < ActiveRecord::Migration
  def self.up
    create_table :show_appointments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :show_appointments
  end
end
