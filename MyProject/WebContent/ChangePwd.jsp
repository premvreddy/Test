  	
    	
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.modal fade {
	margin: 20px;
}

@media screen and (min-width: 992px) {
	.modal-dialog {
		width: 980px; /* New width for large modal */
	}
}

.table-responsive {
	overflow: auto;
}

.abc {
	display: none;
}

.form-control1 {
	border: 0;
}

fieldset.scheduler-border {
	border: 2px groove #ddd !important;
	padding: 0 0.5em 0.5em 0.5em !important;
	margin: 0 0 1.2em 0 !important;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
}

legend.scheduler-border {
	width: inherit; /* Or auto */
	padding: 0 10px; /* To give a bit of padding on the left and right */
	border-bottom: none;
}

.form-group .required .control-label:after {
	content: " * ";
	color: red;
	content-size: 10px;
}
</style>
</head>
<body>


<div class="error-messages" style="display: none;"></div>


	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Change Password</h3>
					</div>
					<div class="panel-body">

						<form method="post" action="validate.jsp">
							<fieldset id="inputs">
							
							<!-- <div class="form-group">
							<label for="form-username" style="margin-left: 4%; color: #777">Old
								Password </label> <input type="password" name="oldpassword" id="oldpassword"
								required="true" placeholder="Old Password..."
								class="form-username form-control"
								style="width: 90%; margin-left: 4%" onchange="ValidateOld()">
						</div> -->
						<tr>
							
							<!-- <div class="form-group">
							<div class="col-sm-3"> -->
							<td><label for="form-username" style="margin-left: 40%; color: #777">User ID :</label>
							<input type="text" id="userId" placeholder="User ID..."  autocomplete="off" class="form-username form-control"
								style="width: 20%; margin-left: 40%"  class="form-control"  /> 
							</td>
								
							<!-- </div>
						    </div> -->
						    </tr>
							<br>
						
							<tr>
							<!-- div class="form-group">
							<div class="col-sm-3"> -->
							<td><label for="form-username" style="margin-left: 40%; color: #777">User Name :</label>
							<input type="text" id="userName" placeholder="User Name..."  autocomplete="off" class="form-username form-control"
								style="width: 40%; margin-left: 40%"  class="form-control"  /> 
							</td>
								
							<!-- </div>
						    </div> -->
						    </tr>
							<br>
							
							<tr>
							<td>
							<!-- div class="form-group">
							<div class="col-sm-3"> -->
								<label  for="form-username" style="margin-left: 40%; color: #777">User Type</label>
								 <select id="userType" class="form-username form-control"
								style="width: 40%; margin-left: 40%"  class="form-control"  > 
									
									<option value="Admin">Admin</option>
									<option value="User">User</option>
								</select>
							<!-- </div>
						</div> -->
						</td>
						</tr>
						<br>
								<tr>
								<td>
								<!-- <div class="col-sm-3">
								<div class="form-group"> -->
							
									<label for="form-username" style="margin-left: 40%; color: #777">Old Password :</label> 
									<input type="password" id="oldpassword" placeholder="Old Password..." 
									class="form-username form-control"
								style="width: 40%; margin-left: 40%" onchange="ValidateOld()"
									
										class="form-control"  />
										<input type="checkbox"  onclick="myFunctionOldPwd()">Show Password
										</tr></td>
							
							<!-- </div> -->
							
								<br>
							
							<!-- <div class="form-group">
								<div class="col-sm-3">
								<div class="form-group"> -->
								
								<label for="form-username" style="margin-left: 40%; color: #777">New Password:</label>
									 <input type="password" id="newpassword" placeholder="New Password..." 
										class="form-username form-control"
								style="width: 40%; margin-left: 40%"  class="form-control"  />
									<input type="checkbox" onclick="myFunctionNewPwd()">Show Password </input>
								<!-- </div>
							</div>
							</div> -->
									<br>
								<tr>
								<td>
								<!-- <div class="form-group">
								<div class="col-sm-3">
								<div class="form-group"> -->
									<label for="form-username" style="margin-left: 40%; color: #777">Re-type Password:</label>
									 <input type="password" id="repassword" placeholder="Re Enter Password..." 
									 class="form-username form-control"
								style="width: 40%; margin-left: 40%" onchange="checkEquality()"/>
									<input type="checkbox" onclick="myFunctionRePwd()">Show Password
								</td>	
								</tr>	
								<!-- </div>
							</div>
							</div> -->
							</div>
								<div class="modal-footer">
					
					<button type="button" id="submBtn" data-type='New'
						class="btn btn-primary">submit</button>
						
						<!-- <input type="button" value="Refresh Page" > -->
						
					<button type="button" id="reset" data-type='New' onclick="myReset()"
						class="btn btn-primary" >Reset</button>
					<button type="button" id="cancel" data-type='New' onclick="myReset()"
						class="btn btn-primary">Cancel</button>
				</div>
								
							</fieldset></form>
					
				</div>
			</div>
		</div>
	</div>


		
	
<script type="text/javascript">


 function myReset() {
	document.getElementById("oldpassword").value ="";
	document.getElementById("repassword").value ="";
	document.getElementById("newpassword").value ="";
	document.getElementById("userType").value ="";
	document.getElementById("userId").value ="";
	document.getElementById("userName").value ="";
} 




function myFunctionOldPwd() {
    var x = document.getElementById("oldpassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}


function myFunctionNewPwd() {
    var x = document.getElementById("newpassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function myFunctionRePwd() {
    var x = document.getElementById("repassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function checkEquality() {
	var rep = document.getElementById("oldpassword").value;
	if((rep=="")||(rep==null)){
		alert(" Enter Old Password...!!!");
		return false;
	}
	else
		{
		
		var password = document.getElementById("password").value;
		   var repassword = document.getElementById("repassword").value;
		   if(password == repassword){
			   $("#submBtn").prop("disabled",false);
			   document.getElementById("passwordForm").submit();
		   }
		   else
			   {
			   alert("Password Did'nt Match...!!!");
			   $("#submBtn").prop("disabled",true);
			   $('#repassword').val("");
			   $('#repassword').focus()
			   }
		
		}
	   
	}
	
	
function ValidateOld() {
	
	   var password = document.getElementById("oldpas").value;
	   var repassword = document.getElementById("oldpassword").value;
	   if(password == repassword){
		   $("#submBtn").prop("disabled",false);
	   }
	   else
		   {
		   alert("Password Entered is in-correct ....!!!!");
		   $("#submBtn").prop("disabled",true);
		   $('#oldpassword').val("");
		   $('#oldpassword').focus();		   }
	   
	}



$(document).ready(function(){
	$("#submBtn").click(function(){
	alert("success");
	var oldpassword = $('#oldpassword').val();
	var newpassword = $('#newpassword').val();
	var repassword = $('#repassword').val();
	
			var parms = {
					oldpassword : oldpassword,
					newpassword : newpassword,
					repassword : repassword,
					
	};
			$.ajax({
				type : "POST",
				url : "Cpwd.action",
				dataType : "json",
				data : parms,
					success : function(data) {
						
						var errorString = data.errorString;
						var resultString = data.resultString;
						if (resultString == "error") {
							$("#loading").hide();
							alert(errorString);
							return;
						} else {
							window.location.href = "index.jsp";
						alert("success");
						}
				}
			
});
	});
});
	</script>
</body>
</html>