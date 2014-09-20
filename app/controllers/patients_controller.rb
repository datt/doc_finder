class PatientsController < ApplicationController
  authorize_resource

  def show
    @patient = current_user.patient
  end
end
