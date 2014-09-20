class AppointmentsController < ApplicationController
  load_and_authorize_resource :clinic
  load_and_authorize_resource :appointments, :through => :clinic

  def index
    @appointments.active
    respond_to do |format|
      format.json
    end
  end
end
