  	google.load("jquery", "1.3.2");
	google.setOnLoadCallback(function() {
  	$('#search_text_box').focus(function() {
    	$(this).val("");
  	});
  	
  	$('#search_text_box').blur(function() {
  		if($(this).val()=="") {
	    	$(this).val("Αναζήτηση...");
    	}
  	});
  	
  });
