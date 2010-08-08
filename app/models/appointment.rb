class Appointment < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :doctor
  validates_existence_of :patient
  
  def appt_range
    start_time..end_time
  end
  
  def tomorrows_appointments
    @appointments = Appointment.all(:conditions => { :date_of_appointment => (Time.now.tomorrow.beginning_of_day)..Time.now.tomorrow.end_of_day})
    @appointments.each do |appointment|
      if(appointment.patient.email?)
        AppointmentMailer.deliver_appointment_reminder(appointment)
      end  
    end 
  end
  
  protected
  
  def validate
     @appointments = Appointment.all(:conditions => { :date_of_appointment => date_of_appointment, :doctor_id => doctor_id})
     errors.add_to_base("Appointment Conflict") if @appointments.any? {|appt| appt.appt_range.overlaps? appt_range}
     logger.info ' IS the validate getting called on the create?'

  end
  
end
