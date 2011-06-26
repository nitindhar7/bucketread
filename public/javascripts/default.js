$( document ).ready(function() {
	hideMessage();
});

function hideMessage() {
	setTimeout(function() {
		$( "#messages" ).fadeOut( 'slow' );
	}, 3500);
}