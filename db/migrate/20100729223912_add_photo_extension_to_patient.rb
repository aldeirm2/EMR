class AddPhotoExtensionToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :extension, :string
  end

  def self.down
    remove_column :patients, :extension
  end
end
