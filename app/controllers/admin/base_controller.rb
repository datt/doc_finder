module Admin
  class BaseController < ActionController::Base
  	layout 'layouts/admin'
  	before_filter :authorize_admin
  	protected
        def action
          params[:action].to_sym
        end

        def authorize_admin
          if respond_to?(:model_class, true) && model_class
            record = model_class
          else
            record = controller_name.to_sym
          end
          authorize! :admin, record
          authorize! action, record
        end
  end
end