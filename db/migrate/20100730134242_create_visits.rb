class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.text :symptoms
      t.text :provisional_diagnostics
      t.text :lab_test
      t.text :final_diagnostics
      t.text :method_of_treatment
      t.text :medication_perscribed
      t.text :comments
      t.datetime :visit_time
      t.boolean :follow_up
      t.time :end_time
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end
