class AppointmentMailer < ActionMailer::Base
  
  def appointment_reminder(appointment)
    recipients  appointment.patient.email
    from        "ABCD.Clinic@gmail.com"
    subject     "Appointment Reminder"
    body        :appointment => appointment
  end
end
