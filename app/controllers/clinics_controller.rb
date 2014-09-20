class ClinicsController < ApplicationController
  authorize_resource
  before_filter :load_doctor
  def index
    @clinics = @doctor.clinics
  end

  def show
    @clinic = @doctor.clinics.find(params[:id])
    @availabilities = @clinic.availabilities.map{|availability| {day: availability.day, from: availability.from, to: availability.to}}
    @appointments = @clinic.appointments.map{|appointment| {title: appointment.name, start: appointment.start_at, end: appointment.end_at, color: 'yellow', textColor: 'black' }}
  end

  protected
    def load_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end
end
