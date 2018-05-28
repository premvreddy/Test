$(document).ready(function(){
	$('#username').focus();
	$('body').keyup(function(e){
        if (e.keyCode == 13) {
        	$('#login').trigger('click');
        }
        if($.trim($('#username').val()).length > 0) {
        	$('#username').popover('hide');
        }
        if($.trim($('#password').val()).length > 0) {
        	$('#password').popover('hide');
        }
    });	
	$('#login').click(function(){
		var userId = $('#username').val();
		var password = $('#password').val();
		if(userId == "") {
			$('#username').popover({
						placement:'top',
						content:'Please Provide User ID',
						delay: {show:500}
						});
			$('#username').popover('show');
		} else if (password == "") {
			$('#password').popover({
						placement:'top',
						content:'Please Provide Password',
						delay: {show:500}
						});
			$('#password').popover('show');
		} else {
			var password = CryptoJS.SHA3(password);
 			var parms = {userID: userId,
 						 password: password.toString(),
 						 time: new Date()};
 			$("#loading").show();
			$.ajax({
				type: "POST",
				url: "login.action",
				dataType:"json",
				data: parms,
				success: function(data) {
						//data = eval('('+data+')');
						var errorString = data.errorString;
						var resultString = data.resultString;
						if(resultString == "error") {
							$("#loading").hide();
							alert(errorString);
							return;
						}
				}
 			});
 		}
	});
	/*$('#userID').click(function(){
		$('#userID').popover('hide');
	});
	$('#password').click(function(){
		$('#password').popover('hide');
	});*/
});