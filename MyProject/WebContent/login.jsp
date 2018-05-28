<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Bootstrap Admin Theme</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style type="text/css">
.error-messages {
	color: #D8000C;
	/*  background-color: #FFBABA; */
	position: absolute;
	top: 75%;
	left: 75%;
	margin-top: -100px;
	margin-left: -100px;
	.
	displaynone
	{
	display
	:
	none;
}
</style>
<!-- vp@medspecLLP -->

<script type="text/javascript">



/* $(document).bind('keypress', function(e) {
    if(e.keyCode==13){
         $('#loginbutton').trigger('click');
     }
});
 */

function enterpass(){
	// alert("Please enter the correct password")
	
	var username = document.getElementById("username").value;
	 var password= document.getElementById("password").value; 
	   password = CryptoJS.SHA3(password);  
	   
	 

	/* if (username != null) {
    	if(username == "admin" && password=="admin"){
       /*   alert("Password is correct");  
       $(".error-messages").text("Some error").fadeIn();
           
          
    	}
    	else
    	{
    		/* alert(" hhh wrong password.........Enter the correct password"); 
    		   $(".error-messages").text("Please enter the valid password").fadeIn();
    	}	
    } */
    if($.trim(username).length == 0) {
    	alert("Provide User Name");
    } else if($.trim(password).length == 0) {
    	alert("Provide Password");
    } else {
	/* 	password = CryptoJS.SHA3(password); */
    	var parms = {
    					userName: username,
    					password: password.toString()
    					
    				};
    	
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
					} else {
						window.location.href = "index.jsp";
						//alert("success");
					}
			}
		});
    }
	
}
</script>




<body>

	<div class="error-messages" style="display: none;"></div>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">

						<form method="post" action="validate.jsp">
							<fieldset id="inputs">
								<div class="form-group">
									<input class="form-control" placeholder="Enter User Name" id="username"
										type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Enter Password"
										id="password" type="password">
								</div>
								<div class="checkbox">
	 								<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<a href="#" class="btn btn-lg btn-success btn-block" id="loginbutton"
									onclick="enterpass()">Login</a>
							</fieldset></form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="scripts/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="scripts/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="scripts/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="scripts/sb-admin-2.js"></script>
	<script src="scripts/sha3.js"></script></body>
</html>
