$( document ).ready(function() {
	messagesSetup();
	navSetup();
});

function messagesSetup()
{
	hideMessage();
}

function hideMessage() {
	setTimeout(function() {
		$( "#messages" ).fadeOut( 'slow' );
	}, 3500);
}

function navSetup()
{
	$( ".tab:first" ).addClass( "first_tab" );
	$( ".tab:last" ).addClass( "last_tab" );
}
