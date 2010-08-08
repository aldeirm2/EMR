class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :f_name
      t.string :m_name
      t.string :l_name
      t.date :date_of_birth
      t.text :medical_history
      t.text :address
      t.string :sex
      t.date :date_of_first_admission
      t.string :universal_ID
      t.text :next_of_kin
      t.string :allergies
      t.text :family_history
      t.string :blood_type
      t.float :weight
      t.float :height
      t.string :bmi
      t.string :occupation
      t.text :current_medication
      t.integer :tel_number
      t.integer :mobile_number
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
