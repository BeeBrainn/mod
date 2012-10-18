class ProductSizesController < ApplicationController
  skip_before_filter :authorize, :admin_check
  # GET /product_sizes
  # GET /product_sizes.json
  def index
    @products = Product.all
    @product_types = ProductType.where("id = 0")
    @product_colors = ProductColor.where("id = 0")
    @product_sizes = ProductSize.where("id = 0")
    @current_product = Product.first
    @current_product_type = ProductType.first
    @current_product_color = ProductColor.first
    @current_product.name = ''
    @current_product_type.name = ''
    @current_product_color.name = ''
    @current_product.id = 0
    @current_product_type.id = 0
    @current_product_color.id = 0

    if params[:product_id] && params[:product_id] != ''
      @product_types = ProductType.where("product_id = ?", params[:product_id])
      @current_product = Product.find_by_id(params[:product_id])
    end
    if params[:product_type_id] && params[:product_type_id] != ''
      @product_colors = ProductColor.where("product_type_id = ?", params[:product_type_id])
      @current_product_type = ProductType.find_by_id(params[:product_type_id])
      @current_product = Product.find_by_id(params[:product_id])
    end
    if params[:product_color_id] && params[:product_color_id] != ''
      @product_sizes = ProductSize.where("product_color_id = ?", params[:product_color_id])
      @current_product_color = ProductColor.find_by_id(params[:product_color_id])
      @current_product_type = ProductType.find_by_id(params[:product_type_id])
      @current_product = Product.find_by_id(params[:product_id])
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
