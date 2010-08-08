class ShowAppointmentsController < ApplicationController
  
    before_filter :require_user
   # load_and_authorize_resource
    def index
        @appointments = Appointment.find(:all)
    end
    
    def send_email
      appointment = Appointment.new
      appointment.tomorrows_appointments
    end
  
end
