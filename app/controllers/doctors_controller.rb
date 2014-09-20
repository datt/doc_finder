class DoctorsController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @areas = Area.where(city: "pune").to_a
  end
end
