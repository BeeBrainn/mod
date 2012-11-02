# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#temp_order_id").change(()->
    $("table").find("form").submit()
  )

$ ->
	$("input")
      .change(()-> 
        filter = $(this).val();
        if(filter)
          $("tr.order_name").children("td:first:not(:Contains(" + filter + "))").parent().slideUp();
          $("tr.order_name").children("td:first:Contains(" + filter + ")").parent().slideDown();
        else
          $("tr.order_name").slideDown();
        return false;
      )
    .keyup(()->
        $(this).change();
    );

