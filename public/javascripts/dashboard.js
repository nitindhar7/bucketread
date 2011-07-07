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
			success: function( data ) {
				$( "#window" ).html( data );
			}
		});
	});
	
	$( "#top_control_mark_read" ).live("click", function() {		
		$( "#window .page .filter:checked" ).each(function() {
			markAsRead( $(this).val() );
		});
	});
	
	$( "#top_control_mark_unread" ).live("click", function() {		
		$( "#window .page .filter:checked" ).each(function() {
			markAsUnread( $(this).val() );
		});
	});
	
	$( "#window .page .status" ).live("click", function() {
		/*
		if ( $(this).hasClass( "unread" ) )
			markAsRead( $(this).parent().find( "filter" ).val() );
		else
			markAsUnread( $(this).parent().find( "filter" ).val() );*/
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

function markAsRead( page_id )
{
	$.ajax({
		url: "/pages/" + page_id + "/read",
		dataType: "script",
		success: function( data ) {
			$( "#page_" + page_id ).replaceWith( data );
		}
	});
}

function markAsUnread( page_id )
{
	$.ajax({
		url: "/pages/" + page_id + "/unread",
		dataType: "script",
		success: function( data ) {
			$( "#page_" + page_id ).replaceWith( data );
		}
	});
}

function displayAddPageForm()
{
	$( "#add_page" ).slideToggle( "fast" );
	$( "#url" ).focus();
}
