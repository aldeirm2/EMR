class Visit < ActiveRecord::Base
  
  belongs_to :patient
  validates_existence_of :patient
  
end
