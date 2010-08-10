class Appointment < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :doctor
  validates_existence_of :patient
  validate :conflicting_appts
  
  def appt_range
    s=Time.local(date_of_appointment.year, date_of_appointment.month, date_of_appointment.day, start_time.hour, start_time.min, start_time.sec)
    e=Time.local(date_of_appointment.year, date_of_appointment.month, date_of_appointment.day, end_time.hour, end_time.min, end_time.sec)
   s..e
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
    errors.add_to_base("Appointment Conflict") if @appointments.any? do |appt| 
      logger.info "appt.range == #{appt.appt_range} , my range = #{appt_range}"
      appt.appt_range.overlaps? appt_range
    end
  end
  
end
