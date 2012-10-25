class UsersController < ApplicationController
  before_filter :admin_check
  skip_before_filter :authorize, only:[:new, :create]
  skip_before_filter :admin_check, only:[:new, :create, :show, :edit, :update]
  # GET /users
  # GET /users.json
  def index
    if params[:temp_id] == "1"
      @users = User.where("reg_confirm_admin = ?", true)
      #@current_item = 'Зарегестрированные пользователи'
    else
      if params[:temp_id] == "2"
        @users = User.where("reg_confirm_admin = ?", false)
        #@current_item = 'Ожидают регистрации'
      end
    end    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user_groups = UserGroup.all
    @current_user_group = UserGroup.find_by_id(@user.user_group_id) 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.last_in = DateTime.now
    respond_to do |format|
      if @user.save
        unless Unp.find_by_unp(@user.unp)
          @unp = Unp.new
          @unp.unp = @user.unp
          @unp.save
        end
        format.html { redirect_to login_path, alert: 'Свяжитесь с администратором для подтверждения регистрации.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user_groups = UserGroup.all
    @current_user_group = UserGroup.find_by_id(@user.user_group_id) 

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
