class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.xml
  
  before_filter :require_user
  load_and_authorize_resource
  
  def index
    @appointments = person.appointments
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.xml
  def show
    @appointment = person.appointments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.xml
  def new
    @appointment = person.appointments.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = person.appointments.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.xml
  def create
    @appointment = person.appointments.new(params[:appointment])
      respond_to do |format|
         if @appointment.save
            format.html { redirect_to([person, @appointment], :notice => 'Appointment was successfully created.') }
            format.xml  { render :xml => @appointment, :status => :created, :location => @appointment }
         else
            format.html { render :action => "new" }
            format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
         end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.xml
  def update
    @appointment = person.appointments.find(params[:id])
      respond_to do |format|
          if @appointment.update_attributes(params[:appointment])
            format.html { redirect_to([person, @appointment], :notice => 'Appointment was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
          end
      end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.xml
  def destroy
    @appointment = person.appointments.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to(patient_appointments_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_patient
    @patient = Patient.find(params[:patient_id])
  end
  
  def get_doctor
    @doctor = Doctor.find(params[:doctor_id]) 
  end
  
  def person
    @person ||=
      if params[:doctor_id]
        Doctor.find(params[:doctor_id])
      elsif params[:patient_id]
        Patient.find(params[:patient_id])
      end
  end
  
end
