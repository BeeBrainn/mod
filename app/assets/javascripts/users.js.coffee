# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('button').click(()->
		$('#com_info').slideToggle(500)
		$('#com_crete').slideToggle(500))
$ ->
	start_pos = 8
	$("div.field").slice(start_pos, 17).addClass("hide")
	$(".my_button").click(()->
		$("div.field:eq(start_pos)").slideDown(500)
		start_pos += 1)