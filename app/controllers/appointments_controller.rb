class AppointmentsController < ApplicationController
  authorize_resource
  before_filter :load_clinic, :only => :create

  def index
    @appointments = @clinic.appointments.active
    respond_to do |format|
      format.json
    end
  end

  def create
    params[:appointment].merge!(:patient_id => current_user.patient.try(:id))
    @appointment = @clinic.appointments.create(params[:appointment])
    render :json => @appointment.to_json
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @id = @appointment.id
    @appointment.destroy
    respond_to :js
  end
  protected
    def load_clinic
      @clinic = Clinic.find(params[:clinic_id])
    end
end
