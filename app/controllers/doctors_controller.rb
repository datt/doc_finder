class DoctorsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show, :search]
  def index
    @areas = Area.where(city: "pune").to_a
  end

  def show
    @doctor = Doctor.find(params[:id])
    redirect_to :back if @doctor.nil?
  end

  def search
    @doctors = Doctor.search(params[:query]).page(params[:page]).per(10)
    doctors = @doctors.map do |doctor|
      {
        :id => doctor.id,
        :name => doctor.name,
        :date_of_birth => doctor.date_of_birth,
        :email => doctor.email,
        :degree => doctor.degree,
        :expertise => doctor.expertise,
        :experience => doctor.experience,
        :visiting_fees => doctor.visiting_fee,
        :image => "#{SITE_HOST}#{doctor.image.url}",
        :clinics => doctor.clinics.map do |clinic|
          {
            :id => clinic.id,
            :name => clinic.name,
            :lat => clinic.lat,
            :lng => clinic.long
          }
        end
      }
    end
    render :json => doctors.to_json
  end
end
