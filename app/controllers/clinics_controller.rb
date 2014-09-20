class ClinicsController < ApplicationController
  authorize_resource
  before_filter :load_doctor
  def index
    @clinics = @doctor.clinics
  end

  def show
    @clinic = @doctor.clinics.find(params[:id])
  end

  protected
    def load_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end
end
