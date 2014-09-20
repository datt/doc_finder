module Admin
	class Admin::ClinicsController < Admin::BaseController
		load_and_authorize_resource

		def new
			doctor = Doctor.find(params[:doc_id])
			@clinic = doctor.clinics.build
		end

		def create
      @clinic = Clinic.new params[:clinic]
      if @clinic.save
				redirect_to clinics_admin_doctor_path(@clinic.doctor.permalink)
      else
        render :new
      end
    end

    def update
    	@clinic = Clinic.find(params[:id])
    	if @clinic.update_attributes(params[:clinic])
        redirect_to clinics_admin_doctor_path(@clinic.doctor.permalink)
      else
        render :edit
      end
    end

    def destroy
      clinic = Clinic.find(params[:id])
      doctor = clinic.doctor
      clinic = clinic.destroy
      redirect_to clinics_admin_doctor_path(doctor.permalink)
    end

	end
end
