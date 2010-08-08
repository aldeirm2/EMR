class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.datetime :time_slot
      t.string :priority
      t.datetime :arrive_date_time
      t.text :note
      t.string :status
      t.text :symptoms
      t.string :doctor
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
