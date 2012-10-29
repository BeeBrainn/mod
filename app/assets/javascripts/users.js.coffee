# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> #add phone number by press button
	$("#phones").children(".field").each(()->
			$(this).addClass("hide") if $(this).find("input").val() == "")
	$("#phones").children(".field:eq(0)").removeClass("hide")
	$(".my_button").click(()->
		$("#phones").children(".field.hide:first").slideDown(350).removeClass("hide"))

$ -> #reload page when change option for sort
	$("#temp_id").change(->
		$(this).closest("form").submit())

$ ->
	$("input")
      .change(()-> 
        filter = $(this).val();
        if(filter)
          $("tr.company_name").children("td:first:not(:Contains(" + filter + "))").parent().slideUp();
          $("tr.company_name").children("td:first:Contains(" + filter + ")").parent().slideDown();
        else
          $("tr.company_name").slideDown();
        return false;
      )
    .keyup(()->
        $(this).change();
    );