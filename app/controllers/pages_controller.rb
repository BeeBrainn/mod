class PagesController < ApplicationController
  skip_before_filter :authorize, only:[:home, :contact]
  skip_before_filter :admin_check, only:[:home, :contact]

  def home
  end

  def contact
  end

  def adminpage
    @user_group = UserGroup.all
  end
end