#rails runner ~/Projects/modern/putdb.rb

temp_product = Product.new
temp_product.name = "Футболки"
temp_product.save
temp_product = Product.new
temp_product.name = "Рубашки поло"
temp_product.save
temp_product = Product.new
temp_product.name = "Бейсболки"
temp_product.save
temp_product = Product.new
temp_product.name = "Брюки"
temp_product.save
temp_product = Product.new
temp_product.name = "Бюджетные футболки"
temp_product.save

@products = Product.all
@products.each do |product|
	temp_product_type = ProductType.new
	temp_product_type.product_id = product.id
	temp_product_type.name = "Короткий рукав"
	temp_product_type.save
end
@product_types = ProductType.all
@product_types.each do |product_type|
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный"
	temp_product_color.save	
end
@product_colors =  ProductColor.all
@product_colors.each do |product_color|
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "XS"
	temp_product_size.number = 0
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "S"
	temp_product_size.number = 1
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "M"
	temp_product_size.number = 2
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "L"
	temp_product_size.number = 3
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "XL"
	temp_product_size.number = 4
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "2XL"
	temp_product_size.number = 5
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
	temp_product_size = ProductSize.new
	temp_product_size.product_color_id = product_color.id
	temp_product_size.name = "3XL"
	temp_product_size.number = 6
	temp_product_size.price = 0
	temp_product_size.count = 0
	temp_product_size.reserv = 0
	temp_product_size.save
end