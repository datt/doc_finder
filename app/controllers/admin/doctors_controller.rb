module Admin
	class DoctorsController < Admin::BaseController
  	load_and_authorize_resource
	end
end
