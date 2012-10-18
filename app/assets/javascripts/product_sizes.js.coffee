# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#product_id").change(->
		$("#product_type_id > option").removeProp('selected')
		$("#product_color_id > option").removeProp('selected')
		$(this).closest("form").submit())

	$("#product_type_id").change(->
		$("#product_color_id > option").removeProp('selected')
		$(this).closest("form").submit())

	$("#product_color_id").change(->
		$(this).closest("form").submit())