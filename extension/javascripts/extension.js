$( document ).ready(function() {
	$( "#login .body .field:first" ).focus();
	
	$( "#login .body .button" ).live( 'click', login );
	$( "#login .body .field" ).live('keyup', function( event ) {
		if( event.keyCode == 13 )
			login();
	});
	
});

function login()
{
	var user_email = $("#login .body .field:first").val();
	var user_password = $("#login .body .field:last").val();
	
	$.ajax({
		type: 'GET',
		url: 'http://localhost:3000/authorize.json',
		data: {
			email: user_email,
			password: user_password
		},
		success: function(data){
			var html = '<div id="pages">'
			
			$.each(data, function(key, val){
				if( val.page.status == 0 )
					html += '<div class="page">';
				else
					html += '<div class="page finished">';
				html += '<a class="url" href="' + val.page.url + '">' + val.page.url + '</a>';
				if( val.page.status == 0 )
					html += '<div class="status">Unlocked</div>';
				else
					html += '<div class="status">Locked</div>';
				html += '<div class="date">' + val.page.created_at + '</div>';
				if( val.page.status == 0 )
					html += '<a class="finish" href="http://localhost:3000/pages/' + val.page.id + '/finish">Finish Reading</a>';
				else
					html += '<a class="finish" href="http://localhost:3000/pages/' + val.page.id + '/finish">Read Again</a>';
				html += '</div>';
			});
			
			html += '</div>';
			
			$("#content").html(html);
		},
		dataType: 'json',
		contentType: 'application/json'
	});
}
