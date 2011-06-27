$( document ).ready(function() {
	
	$( "#placeholder .message span" ).live("click", function() {
		displayAddPageForm();
	});
	
	$( "#top_control_add_page" ).live("click", function() {
		displayAddPageForm();
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
	
	$( "#top_control_filter_locked_links" ).live("click", function() {
		$.ajax({
			url: "/dashboard/pages",
			dataType: "script",
			data: "status=0",
			success: function( data ){
				$( "#window" ).html( data );
			}
		});
	});
	
	$( "#top_control_filter_unlocked_links" ).live("click", function() {
		$.ajax({
			url: "/dashboard/pages",
			dataType: "script",
			data: "status=1",
			success: function( data ){
				$( "#window" ).html( data );
			}
		});
	});
});

function displayAddPageForm()
{
	$( "#add_page" ).slideToggle( "fast" );
	$( "#url" ).focus();
}
