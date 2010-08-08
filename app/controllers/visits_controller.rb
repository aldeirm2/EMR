class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.xml
  
  before_filter :get_patient, :require_user
  load_and_authorize_resource
  
  def index
    @visits = @patient.visits
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end

  # GET /visits/1
  # GET /visits/1.xml
  def show
    @visit = @patient.visits.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.xml
  def new
    @visit = @patient.visits.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = @patient.visits.find(params[:id])
  end

  # POST /visits
  # POST /visits.xml
  def create
    @visit = @patient.visits.build(params[:appointment])
    respond_to do |format|
      if @visit.save
        format.html { redirect_to([@patient, @visit], :notice => 'Visit was successfully created.') }
        format.xml  { render :xml => @visit, :status => :created, :location => @visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.xml
  def update
    @visit = @patient.visits.find(params[:id])
    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to([@patient, @visit], :notice => 'Visit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.xml
  def destroy
    @visit = @patient.visits.find(params[:id])
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to(patient_visits_path(@patient)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_patient
    @patient = Patient.find(params[:patient_id])
  end
end
