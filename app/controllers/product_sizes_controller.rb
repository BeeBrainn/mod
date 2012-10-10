class ProductSizesController < ApplicationController
  skip_before_filter :authorize, :admin_check
  # GET /product_sizes
  # GET /product_sizes.json
  def index
    @product = Product.new
    @product_type = ProductType.new
    @product_color = ProductColor.new

    @product_sizes = ProductSize.all
    if params[:product_color]
      @search_products = Product.all
      @search_product_types = ProductType.all
      @search_product_colors = ProductColor.all
      @search_product_sizes = ProductSize.where("product_color_id = #{params[:product_color][:id]}")
    else
      if params[:product_type]
        @search_products = Product.all
        @search_product_types = ProductType.all
        @search_product_colors = ProductColor.where("product_type_id = #{params[:product_type][:id]}")
        temp_product_color_id = ProductColor.find_by_product_type_id(params[:product_type][:id]).id
        @search_product_sizes = ProductSize.where("product_color_id = #{temp_product_color_id}")
      else
        if params[:product]
          @search_products = Product.all
          @search_product_types = ProductType.where("product_id = #{params[:product][:id]}")
          @search_product_colors = ProductColor.where("product_type_id = 1")
          @search_product_sizes = ProductSize.where("product_color_id = 1")

          @current_product = params[:product][:name]
          @current_product_type = ''
          @current_product_color = ''
        else
          @search_products = Product.all
          @search_product_types = ProductType.where("id = 0")
          @search_product_colors = ProductColor.where("id = 0")
          @search_product_sizes = ProductSize.where("id = 0")

          @current_product = ''
          @current_product_type = ''
          @current_product_color = ''
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_sizes }
    end
  end

  # GET /product_sizes/1
  # GET /product_sizes/1.json
  def show
    @product_size = ProductSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_size }
    end
  end

  # GET /product_sizes/new
  # GET /product_sizes/new.json
  def new
    @product_size = ProductSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_size }
    end
  end

  # GET /product_sizes/1/edit
  def edit
    @product_size = ProductSize.find(params[:id])
  end

  # POST /product_sizes
  # POST /product_sizes.json
  def create
    @product_size = ProductSize.new(params[:product_size])

    respond_to do |format|
      if @product_size.save
        format.html { redirect_to @product_size.product_color, notice: 'Product size was successfully created.' }
        format.json { render json: @product_size, status: :created, location: @product_size }
      else
        format.html { render action: "new" }
        format.json { render json: @product_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_sizes/1
  # PUT /product_sizes/1.json
  def update
    @products = Product.all
    @product_size = ProductSize.find(params[:id])
    if params[:product_size][:count]
      @new_count = @product_size.count + params[:product_size][:count].to_i
      params.update(:product_size=>{:count => @new_count})
    end
    respond_to do |format|
      if @product_size.update_attributes(params[:product_size])
        format.html { redirect_to @product_size, notice: 'Product size was successfully updated.' }
        format.js { @current_product_size_id = @product_size.id}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sizes/1
  # DELETE /product_sizes/1.json
  def destroy
    @product_size = ProductSize.find(params[:id])
    @product_size.destroy

    respond_to do |format|
      format.html { redirect_to product_sizes_path }
      format.json { head :no_content }
    end
  end
end
