#rails runner ~/Projects/modern/putdb.rb
#for heroku copy to heroku console

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
temp_product.name = "Толстовки"
temp_product.save
temp_product = Product.new
temp_product.name = "Бюджетные футболки"
temp_product.save

@products = Product.all
@products.each do |product|
	temp_product_type = ProductType.new
	temp_product_type.product_id = product.id
	temp_product_type.name = "Короткий рукав1"
	temp_product_type.save
	temp_product_type = ProductType.new
	temp_product_type.product_id = product.id
	temp_product_type.name = "Короткий рукав2"
	temp_product_type.save
	temp_product_type = ProductType.new
	temp_product_type.product_id = product.id
	temp_product_type.name = "Короткий рукав3"
	temp_product_type.save
	temp_product_type = ProductType.new
	temp_product_type.product_id = product.id
	temp_product_type.name = "Короткий рукав4"
	temp_product_type.save
end
@product_types = ProductType.all
@product_types.each do |product_type|
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный1"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный2"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный3"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный4"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный5"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный6"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный7"
	temp_product_color.save	
	temp_product_color = ProductColor.new
	temp_product_color.product_type_id = product_type.id
	temp_product_color.name = "Красный8"
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
temp_user_group = UserGroup.new
temp_user_group.name = "user"
temp_user_group.admin_flag = false
temp_user_group.view_reserv_flag = true
temp_user_group.view_sklad_flag = true
temp_user_group.save

temp_user_group = UserGroup.new
temp_user_group.name = "admin"
temp_user_group.admin_flag = true
temp_user_group.view_reserv_flag = true
temp_user_group.view_sklad_flag = true
temp_user_group.save

temp_user = User.new
temp_user.name = "user"
temp_user.email = "user@user"
temp_user.password = "user"
temp_user.password_confirmation = "user"
temp_user.reg_confirm_admin = true
temp_user.last_in = DateTime.now
temp_user.save

temp_user = User.new
temp_user.name = "admin"
temp_user.email = "admin@admin"
temp_user.password = "admin"
temp_user.password_confirmation = "admin"
temp_user.reg_confirm_admin = true
temp_user.user_group_id = 2
temp_user.last_in = DateTime.now
temp_user.save