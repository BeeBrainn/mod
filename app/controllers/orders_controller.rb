class OrdersController < ApplicationController
  skip_before_filter :authorize, only:[:new, :create, :show]
  # GET /orders
  # GET /orders.json
  def index
    if @current_group.admin_flag
      if params[:temp_order_id] == "1"
        @orders = Order.where("reserv_flag = ?", false)
      else
        if params[:temp_order_id] == "2"
          @orders = Order.where("reserv_flag = ?", true)
        else
          @orders = Order.where("reserv_flag = ?", false)
        end
      end
    else
      @orders = Order.find_all_by_user_id(@current_user.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @line_items = LineItem.find_all_by_order_id(@order.id)
    
    @products_in_order = Array.new #include all products that consist in order
    @types_in_order = Array.new
    @colors_in_order = Array.new

    @line_items.each do |line_item| 
      unless @products_in_order.include?(Product.find_by_id(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).product_id).id)
        @products_in_order << Product.find_by_id(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).product_id).id
      end

      unless @types_in_order.include?(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).id)
        @types_in_order << ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).id
      end

      unless @colors_in_order.include?(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).id)
         @colors_in_order << ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).id 
      end  
    end

    #product = Product.find_by_id(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).id).id).id)
    #type = ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).id).id)

    


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, notice: "Ваша корзина пуста"
      return
    end

    @order = Order.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    if @current_user == nil
      @order = Order.new(params[:order])
    else 
      @order = Order.new
      @order.user_id = @current_user.id
      @order.name = @current_user.company_name
      @order.email = @current_user.email
    end
    @order.add_line_items_from_cart(current_cart)


    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @line_items = LineItem.find_all_by_order_id(@order.id)

    @products_in_order = Array.new #include all products that consist in order
    @types_in_order = Array.new
    @colors_in_order = Array.new
    
    @line_items.each do |line_item| 
      unless @products_in_order.include?(Product.find_by_id(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).product_id).id)
        @products_in_order << Product.find_by_id(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).product_id).id
      end

      unless @types_in_order.include?(ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).id)
        @types_in_order << ProductType.find_by_id(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).product_type_id).id
      end

      unless @colors_in_order.include?(ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).id)
         @colors_in_order << ProductColor.find_by_id(ProductSize.find_by_id(line_item.product_size_id).product_color_id).id 
      end  
    end
    #вывод истории заказов в EXEL документ
    workbook = WriteExcel.new('ruby.xls')
    worksheet  = workbook.add_worksheet
    worksheet.write(2, 1, 'Продукт')
    worksheet.write(2, 2, 'Тип')
    worksheet.write(2, 3, 'Цвет')
    worksheet.set_column(1, )
    worksheet.write(1, 4, 'Размер')
      @products_in_order.each do |product_in_order|
          @types_in_order.each do |type_in_order|
            if ProductType.find_by_id(type_in_order).product_id == product_in_order
                @colors_in_order.each do |color_in_order|
                  if ProductColor.find_by_id(color_in_order).product_type_id == type_in_order
                    @line_items.each do |line_item|
                      if ProductSize.find_by_id(line_item.product_size_id).product_color_id == color_in_order
                        if ProductSize.find_by_id(line_item.product_size_id).product_color_id == color_in_order
                          worksheet.write(3, 1, Product.find_by_id(product_in_order).name) 
                          worksheet.write(3, 2, ProductType.find_by_id(type_in_order).name) 
                          worksheet.write(3, 3, ProductColor.find_by_id(color_in_order).name)
                          worksheet.write(2, 4, ProductSize.find_by_id(line_item.product_size_id).name)
                          worksheet.write(3, 4, line_item.quantity)
                        end
                      end
                    end
                  end
                end
            end
          end   
      end
    workbook.close
#    open('archive', 'a') { |f|
#      f << "\nПродукт\t|\tТип продукта\t|\tЦвет\t|\tРазмер\t|\tКоличество\n"
#      @products_in_order.each do |product_in_order|
#        f << Product.find_by_id(product_in_order).name << "\t" << "|" << "\t"
#        @types_in_order.each do |type_in_order|
#          if ProductType.find_by_id(type_in_order).product_id == product_in_order
#            f << ProductType.find_by_id(type_in_order).name << "\t" << "|" << "\t"
#              @colors_in_order.each do |color_in_order|
#                if ProductColor.find_by_id(color_in_order).product_type_id == type_in_order
#                  f << ProductColor.find_by_id(color_in_order).name << "\t" << "|" << "\t"
#                  @line_items.each do |line_item|
#                    if ProductSize.find_by_id(line_item.product_size_id).product_color_id == color_in_order
#                      f << ProductSize.find_by_id(line_item.product_size_id).name << "\t" << "|" << "\t"
#                      if ProductSize.find_by_id(line_item.product_size_id).product_color_id == color_in_order
#                        f << line_item.quantity << "\t" << "|" << "\t"
#                        end
#                    end
#                  end
#                end
#              end
#          end
#        end
#      end  
#    }

    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
