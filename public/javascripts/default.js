$( document ).ready(function() {
	messagesSetup();
	navSetup();
});

function messagesSetup()
{
	hideMessage();
	clickHideMessage();
}

function hideMessage() {
	setTimeout(function() {
		$( "#messages" ).fadeOut( 'slow' );
	}, 3500);
}

function clickHideMessage()
{
	$( "#messages" ).live( 'click', function() { $( this ).fadeOut( 'slow' ); } )
}

function navSetup()
{
	$( "#nav .tab:first" ).addClass( "first_tab" );
	$( "#nav .tab:last" ).addClass( "last_tab" );
}
