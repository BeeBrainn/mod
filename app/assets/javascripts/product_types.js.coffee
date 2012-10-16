# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('#link_to_order_menu').click(()->
		$('#order_menu').slideToggle(500)
		$('#link_to_order_menu').slideToggle(500))
$ ->
	$('#link_out_order_menu').click(()->
		$('#order_menu').slideToggle(500)
		$('#link_to_order_menu').slideToggle(500))