class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authorize
	before_filter :curr
	protected
		def authorize
			unless User.find_by_id(session[:user_id])
				redirect_to login_path, alert: "Для просмотра страницы необходимо авторизоваться"
			end
		end

		def curr
			if User.find_by_id(session[:user_id])
				@current_user = User.find_by_id(session[:user_id])
				@current_group = UserGroup.find_by_id(@current_user.user_group_id)
			else
				@current_user = nil
				@current_group = nil
			end
			@cart = current_cart
		end

		def admin_check
			unless @current_group.admin_flag
				redirect_to root_path
			end
		end

		def verch_check
			unless @current_user.email == "verch.systems@gmail.com"
				redirect_to root_path
			end
		end

	private
		def current_cart
			Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
		end
end
