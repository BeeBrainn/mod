class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authorize
	before_filter :curr
	before_filter :admin_check

	protected
		def authorize
			unless User.find_by_id(session[:user_id])
				redirect_to root_path
			end
		end

		def curr
			if User.find_by_id(session[:user_id])
				@current_user = User.find_by_id(session[:user_id])
			else
				@current_user = nil
			end
		end

		def admin_check
			unless UserGroup.find_by_id(User.find_by_id(session[:user_id]).user_group_id).admin_flag
				redirect_to root_path
			end
		end
end
