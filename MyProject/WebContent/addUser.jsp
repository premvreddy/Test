<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
    .modal fade{ 
    	margin: 20px;
    }
   
   @media screen and (min-width: 992px) {
        .modal-dialog {
          width: 980px; /* New width for large modal */
        }
        }
        
        .table-responsive{
        overflow:auto;
        
        }
       .abc{
       display:none;
       }
  
    fieldset.scheduler-border {
    border: 2px groove #ddd !important;
    padding: 0 0.5em 0.5em 0.5em !important;
    margin: 0 0 1.2em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}
    legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}


</style>


</head>
<body>

									
	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Employee Profile</h4>
				</div>
									
						
					<div class="modal-body">
						
						<div class="row">
						
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Bank Name</label> <select id="bankname"
									class="form-control">
									<option value="Padmashree Credit Co-operative Society Limited">Padmashree Credit Co-operative Society Limited</option>
									</select>
									</div>
							 </div>
							<div class="col-sm-3">	
								<div class="form-group">
									<label>Branch Name</label> <select id="branchname"
									class="form-control">
									<option value="vyalikaval">vyalikaval</option>
									</select>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group">
							
						</div>
						</div>
								<div class="col-sm-2">
									<div class="form-group">
									<form id="frmUpload" name="frmUpload"   action="FileUploadAction"
											method="post" enctype="multipart/form-data">															
						                     
									      	<div style="float: right; width: 30%;">
												 	<input type='file' name="photo" onchange="readURL(this);" /> 
													<img id="blah" src="#" alt="preview" width="150" height="150" />
											</div>	
									</form>    
						     </div>
						</div>    
						
					</div>
					<div class="row">
					
					<fieldset class="scheduler-border">
							<legend class="scheduler-border">User Details</legend>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>UserName</label> <input type="text" id="userName"
									autocomplete="off" class="form-control" />
							</div>
						</div>
					
						<div class="col-sm-3">
							<div class="form-group">
								<label>Password</label> <input type="password" id="password"
									class="form-control" />
							</div>
						</div>
									
						<div class="col-sm-3">
							<div class="form-group">
								<label>User Type</label> <select id="userType"
									class="form-control">
									<option value="Admin">Admin</option>
									<option value="User">User</option>
								</select>
							</div>
						</div>
						
						</fieldset>
						
					</div>
					
					<div class="row">
					<fieldset class="scheduler-border">
							<legend class="scheduler-border">Office Use</legend>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Employee Name</label> <input type="text" id="employeeName"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Employee ID</label> <input type="text" id="employeeId" readonly="readonly"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Designation</label> <select id="designation"
									class="form-control">
									<option value="Manager"></option>
									<option value="Clerk"></option>
								</select>
							</div>
						</div>
						
					
					<div class="col-sm-3">
					<div class="form-group">
					
						<div class='input-group date' data-provide="datepicker"
										data-date-autoclose="true" 
										data-date-format="dd.mm.yyyy">
										<label>Date of Birth</label><br/>
										<input type="text" id="dateofbirth" class="form-control date"
											value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span class="icon icon-calendar"></span> </span>
						</div>
					</div>
					</div>
											
					<!-- </div>
					<div class="row"> -->
					
					<div class="col-sm-3">
						<div class='input-group date' data-provide="datepicker"
										data-date-autoclose="true" 
										data-date-format="dd.mm.yyyy">
										<label>Date of joining</label><br/>
										<input type="text" id="dateofjoining" class="form-control date"
											value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span class="icon icon-calendar"></span> </span>
						</div>
					</div>
					<div class="col-sm-3">
							<div class="form-group">
								<label>Gender</label> <select id="gender"
									class="form-control">
									<option value="Male">Male</option>
										<option value="Female">Female</option>
								</select>
							</div>
						</div>
						
						
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Hobbies</label> <input type="text" id="hobbies"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Req To</label> <input type="text" id="reqto"
									class="form-control" />
							</div>
					</div>
					</fieldset>
					</div>
					
					<div class="row">
					<fieldset class="scheduler-border">
							<legend class="scheduler-border">Personal Info</legend>
							<div class="col-sm-3">
							<div class="form-group">
								<label>Fathers Name</label> <input type="text" id="fathername"
									class="form-control" />
							</div>
						</div>
					
						<div class="col-sm-3">
							<div class="form-group">
								<label>Age</label> <input type="text" id="age"
									class="form-control" />
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Residence Address</label> <textarea class="form-control" id="raddress"></textarea>
							</div>
						</div>
					
						<div class="col-sm-3">
							<div class="form-group">
								<label>Current Address</label><textarea class="form-control" id="caddress"></textarea> 
							</div>
						</div>
						
						<div class="col-sm-2">
							<div class="form-group">
								<label>Blood Group</label> <input type="text" id="bloodgroup"
									class="form-control" />
							</div>
						</div>
					
						<div class="col-sm-2">
							<div class="form-group">
								<label>Mobile</label> <input type="text" id="mobilenumber"
									class="form-control" />
							</div>
						</div>
						
						<div class="col-sm-2">
							<div class="form-group">
								<label>Res No</label> <input type="text" id="resno"
									class="form-control" />
							</div>
						</div>
					
						<div class="col-sm-3">
							<div class="form-group">
								<label>Alternate Person Name</label> <input type="text" id="apname"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Alternate Person Number</label> <input type="text" id="apnumber"
									class="form-control" />
							</div>
						</div>
							</fieldset>
					</div>
					<div class="row">
					
					
					<fieldset class="scheduler-border">
							<legend class="scheduler-border">Other Details</legend>
						
						<div class="col-sm-12">
							<div class="form-group">
								<label>Other details</label> <textarea class="form-control" style="min-width: 100%" id="otherdetails"></textarea>
							</div>
						</div>
						</fieldset>
					</div>
					
					
		</div>
				<div class="modal-footer">
					
					<button type="button" id="addNewUser" data-type='New'
						class="btn btn-primary">AddUser</button>
					<button type="button" id="update" data-type='New'
						class="btn btn-primary">update</button>
					<button type="button" id="deleteRow" data-type='New'
						class="btn btn-primary">delete</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<fieldset>
		<legend>
			User Details 
		</legend>
	</fieldset>
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						 <th>User Id</th>
						<th>User Name</th>
						<th>User Type</th>
						<th>Employee Name</th>
						<th>Designation</th>
						<th>Mobile Number</th>
						<th class="abc">Age</th>
						<th class="abc">Bank Name</th>
						<th class="abc">Branch Name</th>
						<th class="abc">EmployeeId</th>
						<th class="abc">Date of Birth</th>
						<th class="abc">Date of Joining</th>
						<th class="abc">Gender</th>
						<th class="abc">Hobbies</th>
						<th class="abc">Req To</th>
						<th class="abc">Father Name</th>
						<th class="abc">R Address</th>
						<th class="abc">C Address</th>
						<th class="abc">Blood Group</th>
						<th class="abc">Res No</th>
						<th class="abc">AP Name</th>
						<th class="abc">AP Number</th>
						<th class="abc">Other Details</th>
						 
						
					</tr>
				</thead>
				<tbody>
					<s:iterator id="contrabean" value="#session.userlist" status="i">
						<tr>
							 <td>${contrabean.userId}<input type="hidden"
								value="${contrabean.userId}" /></td>
								
							<td class="dw-links"><a
								href="#">${contrabean.userName}</a><input type="hidden"
								value="${contrabean.userName}" /></td> 
						
								<td>${contrabean.userType}<input type="hidden"
								value="${contrabean.userType}" /></td>
								
								<td>${contrabean.employeeName}<input type="hidden"
								value="${contrabean.employeeName}" /></td>
								
								<td>${contrabean.designation}<input type="hidden"
								value="${contrabean.designation}" /></td>
								
								<td>${contrabean.mobilenumber}<input type="hidden" 
								value="${contrabean.mobilenumber}" /></td>
								
								<td class="abc">${contrabean.age}<input type="hidden" 
								value="${contrabean.age}" /></td>
								
								<td class="abc">${contrabean.bankname}<input type="hidden"
								value="${contrabean.bankname}" /></td>
								
								<td class="abc">${contrabean.branchname}<input type="hidden"
								value="${contrabean.branchname}" /></td>
								
								<td class="abc">${contrabean.employeeId}<input type="hidden"
								value="${contrabean.employeeId}" /></td>
								
								<td class="abc">${contrabean.dateofbirth}<input type="hidden"
								value="${contrabean.dateofbirth}" /></td>
								
								<td class="abc">${contrabean.dateofjoining}<input type="hidden"
								value="${contrabean.dateofjoining}" /></td>
								
								<td class="abc">${contrabean.gender}<input type="hidden"
								value="${contrabean.gender}" /></td>
								
								<td class="abc">${contrabean.hobbies}<input type="hidden"
								value="${contrabean.hobbies}" /></td>
								
								<td class="abc">${contrabean.reqto}<input type="hidden"
								value="${contrabean.reqto}" /></td>
								
								<td  class="abc">${contrabean.fathername}<input type="hidden"
								value="${contrabean.fathername}" /></td>
								
								<td class="abc">${contrabean.raddress}<input type="hidden"
								value="${contrabean.raddress}" /></td>
								
								<td class="abc">${contrabean.caddress}<input type="hidden"
								value="${contrabean.caddress}" /></td>
								
								<td class="abc">${contrabean.bloodgroup}<input type="hidden"
								value="${contrabean.bloodgroup}" /></td>
								
								<td class="abc">${contrabean.resno}<input type="hidden"
								value="${contrabean.resno}" /></td>
								
								<td class="abc">${contrabean.apname}<input type="hidden"
								value="${contrabean.apname}" /></td>
								
								<td class="abc">${contrabean.apnumber}<input type="hidden"
								value="${contrabean.apnumber}" /></td>
								
								<td class="abc">${contrabean.otherdetails}<input type="hidden"
								value="${contrabean.otherdetails}" /></td>
								
						
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
	
		<input type="button" class="dw-links" id="new" value="NEW" />
	<script type="text/javascript">	
	 
	$("body").on('focusout',"#employeeName",function(){
		var size=${contrabean.userId} + 1 ;
		size= "EMP-"+size;
		$("#employeeId").val(size);
			
		});
		 
	$(document).ready(function(){
		
		
		
		$(".dw-links").click(function(){
		//var page = $(this).attr('data-page');
		
		 	var rowinfo = $(this).closest('tr').find('td').map(function () {
	        	return $(this).text();
	     	}).get(); 
			$("#deleteRow").attr('data-id',rowinfo[0]);	
		 	$("#update").attr('data-id',rowinfo[0]);	
			$("#basicModal").modal('show');
			$("#userName").val(rowinfo[1]);
			$("#userType").val(rowinfo[2]);
		    $("#employeeName").val(rowinfo[3]);
			$("#designation").val(rowinfo[4]);
			$("#mobilenumber").val(rowinfo[5]);
			$("#age").val(rowinfo[6]);
			$("#bankname").val(rowinfo[7]);
			$("#branchname").val(rowinfo[8]);
			$("#employeeId").val(rowinfo[9]);
			$("#dateofbirth").val(rowinfo[10]);
			$("#dateofjoining").val(rowinfo[11]);
			$("#gender").val(rowinfo[12]);
			$("#hobbies").val(rowinfo[13]);
			$("#reqto").val(rowinfo[14]);
			$("#fathername").val(rowinfo[15]);
			$("#raddress").val(rowinfo[16]);
			$("#caddress").val(rowinfo[17]);
			$("#bloodgroup").val(rowinfo[18]);
			$("#resno").val(rowinfo[19]);
			$("#apname").val(rowinfo[20]);
			$("#apnumber").val(rowinfo[21]);
			$("#otherdetails").val(rowinfo[22]);
			
		});
		$("#update").click(function(){
			alert('User Name cannot be changed');
			
			var password = $("#password").val();
			password = CryptoJS.SHA3(password); 
			
			var rowId1 = {userId: $(this).attr('data-id'), 
					userName: $("#userName").val(),
					password:password.toString(),
					userType: $("#userType").val(),
					employeeName : $("#employeeName").val(),
					designation : $("#designation").val(),
					mobilenumber : $("#mobilenumber").val(),
					age : $("#age").val(),
					bankname : $("#bankname").val(),
					branchname : $("#branchname").val(),
					employeeId : $("#employeeId").val(),
					dateofbirth : $("#dateofbirth").val(),
					dateofjoining : $("#dateofjoining").val(),
					gender : $("#gender").val(),
					hobbies : $("#hobbies").val(),
					reqto : $("#reqto").val(),
					fathername : $("#fathername").val(),
					raddress : $("#raddress").val(),
					caddress : $("#caddress").val(),
					bloodgroup : $("#bloodgroup").val(),
					resno : $("#resno").val(),
					apname : $("#apname").val(),
					apnumber : $("#apnumber").val(),
					otherdetails : $("#otherdetails").val(),
					}
					
				 $.ajax({
					url: 'updateadduser.action',
					data: rowId1,
					success: function(data) {
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
						$("#userinformation").trigger('click');
					}
				}); 
	});
		
		
		
		
		
		
		$("#deleteRow").click(function(){
			alert('User will be deleted');
			/* var rowId = $(this).attr('data-id');
			alert(rowId); */
			var userId = $(this).attr('data-id');
			var userName = $("#userName").val();
			
			$.ajax({
					url: 'deleteadduser.action',
					data: {userId: userId,
						   userName:userName},
					success: function(data) {
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
						$("#userinformation").trigger('click');
					}
				}); 
			
		});
		
		
		});
	</script>	
	<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	</script>
</body>
</html>