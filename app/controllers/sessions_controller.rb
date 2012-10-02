class SessionsController < ApplicationController
  
  skip_before_filter :authorize, :admin_check

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/", alert: "Hello #{user.name}"
  	else
  		redirect_to '/login', alert: "Wrong email or pass"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/"
  end
end
