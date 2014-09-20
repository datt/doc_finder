class DoctorsController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @areas = Area.where(city: "pune").to_a
  end

  def show
    @doctor = Doctor.find(params[:id])
    redirect_to :back if @doctor.nil?
  end

  def search
    @doctors = Doctor.search(params[:query])
    render :json => @doctors.to_json
  end
end
