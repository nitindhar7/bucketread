$( document ).ready(function() {
	$( "#top_controls .add_page" ).live("click", function() {
		$( "#add_page" ).slideToggle( "fast" );
		$( "#url" ).focus();
	});
	
	$( "#nav .main_actions" ).live("click", function() {
		var $main_actions = $( "#main_actions" );
		var display = $main_actions.css( 'display' );
		
		if (display == 'block') 
			$main_actions.hide();
		else {
			$main_actions.show();
			$("#login_form .field:first").focus();
		}
	});
	
	$( "#account_tab" ).live("click", function() {
		var $account = $( "#account" );
		var display = $account.css( 'display' );
		
		if( display == 'block' )
			$account.hide();
		else
			$account.show();
	});
});