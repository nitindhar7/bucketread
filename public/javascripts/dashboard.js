$( document ).ready(function() {
	
	$( "#placeholder .message span" ).live("click", function() {
		displayAddPageForm();
	});
	
	$( "#top_control_add_page" ).live("click", function() {
		displayAddPageForm();
	});
	
	$( "#top_control_filter" ).live("change", function() {
		var status_val = $( "#top_control_filter option:selected" ).val();
		
		$.ajax({
			url: "/dashboard/pages",
			dataType: "script",
			data: "status=" + status_val,
			success: function( data ){
				$( "#window" ).html( data );
			}
		});
	});
	
	$( "#twitter_roll" ).twitterSearch({
	    term:   'BucketRead',
		title: 'Chatter about BucketRead!',
	    bird:    false,
		avatar:  false,
	    colorExterior: '#DDD',
	    colorInterior: '#F5F5F5',
	    pause:   true,
		time: false,
	    timeout: 2000
	});
});

function displayAddPageForm()
{
	$( "#add_page" ).slideToggle( "fast" );
	$( "#url" ).focus();
}
