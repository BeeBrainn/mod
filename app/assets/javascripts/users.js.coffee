# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$("#phones").children(".field").each(()->
			$(this).addClass("hide") if $(this).find("input").val() == "")
	$("#phones").children(".field:eq(0)").removeClass("hide")
	$(".my_button").click(()->
		$("#phones").children(".field.hide:first").slideDown(350).removeClass("hide"))

$ ->
	$("#temp_id").change(->
		$(this).closest("form").submit())