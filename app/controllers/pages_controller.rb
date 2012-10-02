class PagesController < ApplicationController
  skip_before_filter :authorize, only:[:home, :contact]
  skip_before_filter :admin_check, only:[:home, :contact]

  def home
    @products = Product.all
    @hi = "usual"
  end

  def update
    @product_size = ProductSize.find(params[:id])
    @hi = "i'm here   i'm here   i'm here   i'm here   i'm here   i'm here   i'm here   i'm here   "
    respond_to do |format|
    	if @product_size.update_attributes(params[:id])
	    	format.html
	    	format.js
	    else
	    	format.html { redirect_to "/" }
	    end

    end
  end

  def contact
  end

  def adminpage
    @user_group = UserGroup.all
  end
end