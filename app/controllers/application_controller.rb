class ApplicationController < ActionController::Base
  protect_from_forgery
  	def after_sign_in_path_for(resource)
	  '/admin/admin_info'
	end

	def after_update_path_for(resource)
      '/users/sign_in'
    end
end
