# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("input").keypress((e)->
		console.log("Enter pressed") if e.which==13)

#		this.parent.submit 		
# $.put("/products", {id: $(".input_edit_product_price").name , price: $(".input_edit_product_price").value})
# console.log("Enter pressed")