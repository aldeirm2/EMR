class Patient < ActiveRecord::Base
  
  #patient can have many apointments
  has_many :appointments, :dependent => :destroy
  has_many :visits, :dependent => :destroy
  
  attr_accessible :photo
  has_attached_file :photo, :styles => { :small => "200x200>" }
  
  # validate  that fields are not blank
  validates_presence_of(:f_name, :l_name, :tel_number, :address)
  
  # validate that fields are numeric
  validates_numericality_of(:height, :weight, :bmi, :tel_number)
  
  #v alidate uniqueness of fields and users
  validates_uniqueness_of(:email, :universal_ID)
  validates_uniqueness_of(:l_name, :case_sensitve => false, :scope => [:date_of_birth, :f_name, :tel_number], :message => "User already existsts")
  
  #validate Email is right format
  validates_format_of(:email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Dosen't look like a real email address, please try again")
  
  #validate the date of birth
  validates_inclusion_of(:date_of_birth, :in => Date.civil(1900, 1, 1) .. Date.today, :message => "Must be between the year 1900 and today")
  
  #after a person writes makes a new patient deal with adding the photo

  def self.search(search)
    if search
      find(:all, :conditions => ['l_name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  def name
    f_name + " " + l_name
  end
  
end
