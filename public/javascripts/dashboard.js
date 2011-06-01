$( document ).ready(function() {
	$( "#top_controls .add_page" ).live("click", function() {
		$( "#add_page" ).slideToggle( "fast" );
		$( "#url" ).focus();
	});
	
	$( "#nav .main_actions" ).live("click", function() {
		$( "#main_actions" ).slideToggle( "fast" );
		$( "#login_form .field:first" ).focus();
	});
});