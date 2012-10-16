class SessionsController < ApplicationController
  
  skip_before_filter :authorize, :curr

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user and user.authenticate(params[:password])
      if UserGroup.find_by_id(user.user_group_id).admin_flag
        session[:user_id] = user.id
        redirect_to user, alert: "Ух-ты... Админ!!!"
      else
    		if user.reg_confirm_admin
          session[:user_id] = user.id
          if Organization.find_by_user_id(user.id)
    		    redirect_to "/", alert: "Добро пожаловать, #{user.name}"
          else
            redirect_to new_organization_path, alert: "Зарегестрируйте свою организацию"
          end
        else
          redirect_to "/login", alert: "Регистрация не подтверждена Администратором"	
        end
      end  
    else
      redirect_to '/login', alert: "Неверный e-mail или пароль"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/"
  end
end
