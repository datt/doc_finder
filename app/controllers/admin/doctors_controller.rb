module Admin
  class DoctorsController < Admin::BaseController
    load_and_authorize_resource
    def index
    	@doctors = Doctor.order.page(params[:page]).per(2)
    end

    def create
      @doctor = Doctor.new params[:doctor]
      if @doctor.save
        redirect_to admin_doctors_path
      else
        render :new
      end
    end

    def update
      @doctor = Doctor.find(params[:doctor][:permalink])
      if @doctor.update_attributes(params[:doctor])
        redirect_to admin_doctors_path
      else
        render :edit
      end
    end

    def destroy
      @doctor.destroy
      redirect_to admin_doctors_path
    end
    def clinics
    	@doctor = Doctor.find(params[:id])
    	@clinics = @doctor.clinics
    end
  end
end
