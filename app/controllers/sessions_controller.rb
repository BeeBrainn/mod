class SessionsController < ApplicationController
  
  skip_before_filter :authorize, :curr

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/", alert: "Добро пожаловать, #{user.name}"
  	else
  		redirect_to '/login', alert: "Неверный e-mail или пароль"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/"
  end
end
