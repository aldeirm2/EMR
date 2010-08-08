class Appointment < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :doctor
  validates_existence_of :patient
  validate :conflicting_appts
  
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
  
  private
  def conflicting_appts
    @appointments = Appointment.all(:conditions => { :date_of_appointment => date_of_appointment, :doctor_id => doctor_id})
    errors.add_to_base("Appointment Conflict") if @appointments.any? {|appt| appt.appt_range.overlaps? appt_range}
  end
  
end
