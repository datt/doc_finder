class DoctorsController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @areas = Area.where(city: "pune").to_a
    @doctors = Doctor.includes(:clinics).where("clinics.city = 'pune'").to_a
    @clinics = Clinic.where(doctor_id: @doctors.map(&:id)).to_a
  end

  def show
    @doctor = Doctor.find(params[:id])
    redirect_to :back if @doctor.nil?
  end

  def search
    Rails.logger.info "doc search params: #{params}"
    render :json, [].as_json
  end
end
