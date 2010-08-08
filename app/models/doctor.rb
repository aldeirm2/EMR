class Doctor < ActiveRecord::Base
  
  has_many :appointments
  
end
