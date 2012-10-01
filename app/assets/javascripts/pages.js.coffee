# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$(".input_edit_product_price").keypress((e)->
			$.post("/", {id: "0", str2: "666"}) if e.which==13)