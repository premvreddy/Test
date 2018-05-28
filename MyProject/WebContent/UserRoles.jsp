<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Roles</title>
<!-- <script src="js/jquery-1.10.1.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">



<style type="text/css">
#emplName {
	width: 85%;
	height: 110%;
	border: 1px solid black;
}

#employeeId {
	width: 50%;
	height: 110%;
	border: 1px solid black;
	 /* border: 5px solid red; */
}

.styled-select.slate {
	height: 34px;
	width: 200px;
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

</style>

</head>

<body>

	<form action="" method="post">
		<div class="container">
		<fieldset  class="scheduler-border">
			<div class="row">
			
				<div class="form-group">
					<br>
					<%-- <div class="col-xs-3">
						<div class="styled-select slate">
							<select name="emplName" id="emplName">
								<c:forEach items="${userlist}" var="empVal">
									<option value="${empVal.userName}">${empVal.userName}</option>
								</c:forEach>
							</select>
						</div>
					</div> --%>
					
						<!-- 	****** -->
			
				
	
		
		
						
				<!-- 	****** -->
				
				    <div class="ui-widget">   
					<div class="col-sm-3">
					<div class="styled-select slate">
						
							 <label for="Employee ID">Employee ID:</label>
							<select name="employeeId" id="combobox" >
								<c:forEach items="${userlist}" var="empVal">
									<option value="${empVal.userId}">${empVal.userId}</option>
								</c:forEach>
							</select>
							
						</div>
						</div>
					</div>
					<div class="col-sm-3">
							<div class="form-group">
								<label>Employee Name</label> <input type="text" id="employeeName" readonly="readonly"
									class="form-control" />
							</div>
						</div>

					 <div class="col-xs-2">
						<label for="Designation">Designation</label> 
						<input type="text" class="form-control" id="designation" readonly="readonly"
							>
					</div>

					
				</div>
</fieldset>
			</div>
			
			<br> 

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Module</th>
						<th>All</th>
						<th>Entry</th>
						<th>Edit</th>
						<th>Cancel</th>
					</tr>
				</thead>
				<tbody>
				
 			<div class="container">
  			<th>
 			<div class="dropdown">
 			
  <!-- <li class="active"><a href="#" data-submenu="Home"
					class=" dropdown-toggle" role="button" aria-haspopup="true"
					aria-expanded="false">Home <span class="caret"></span></a></li> -->
  
  
    			  <button class="btn btn-default dropdown-toggle" type="button"   data-toggle="dropdown"><b>Home</b>
   				 <span class="caret"></span></button>  
   				 <!-- <select>
   				 <optgroup label="User Roles">
   				 <option value="RoleManagement"> Role Management</option>
   				  <option value="ChangePassword">Change Password</option>
   				 </optgroup>
   				  <optgroup label="Profile">
   				  <option value="Profile"> Profile</option>
   				  </optgroup>
   				   <optgroup label="Change Password">
   				  <option value="ChangePassword">Change Password</option></optgroup>
   				 <optgroup label="Status">
   				  <option value="Status"> Status </option></optgroup>
   				   <optgroup label="Entries">
   				  <option value="Entries">Entries </option></optgroup>
   				 </select> -->
   				<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tutorials
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a tabindex="-1" href="#">HTML</a></li>
      <li><a tabindex="-1" href="#">CSS</a></li>
      <li class="dropdown-submenu">
        <a class="test" tabindex="-1" href="#">New dropdown <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a tabindex="-1" href="#">2nd level dropdown</a></li>
          <li><a tabindex="-1" href="#">2nd level dropdown</a></li>
          <li class="dropdown-submenu">
            <a class="test" href="#">Another dropdown <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">3rd level dropdown</a></li>
              <li><a href="#">3rd level dropdown</a></li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </div>
    			<ul class="dropdown-menu">
      			 <li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">User Roles</span> <b class="gw-arrow"></b>
						</a> 
						
							<ul class="gw-submenu">

								<c:choose>
									<c:when test="${sessionScope.usertype=='ADMIN'}">
										<li id="roleuserinfo" data-page="UserRoles.jsp"><a
											href="javascript:void(0)">Role Management</a></li>
									</c:when>
								</c:choose>
							
							<li id="pwd" data-page="ChangePwd.jsp"><a
									href="javascript:void(0)">Change Password</a></li>
							</ul>
							</li>
							<!-- </li>  -->
							
      				<li><a href="#">Profile <span class="caret"></span></a></li>
    		 	<li><a href="#">Status <span class="caret"></span></a></li>
    		   <li><a href="#">Entries <span class="caret"></span></a></li>
    		   <!-- <ul>  -->
    		  
     			</ul> 
    
              <td><input id="perm1" class="cb1" type="checkbox" name="homeAllAccess" value="homeAllAccess" /></td>
						<td><input id="perm2" type="checkbox" name="homeEntryAccess" value="homeEntryAccess" /></td>
						<td><input id="perm3" type="checkbox" name="homeEditAccess" value="homeEditAccess" /></td>
						<td><input class="cancelClass" type="checkbox" name="cancel" value="cancel" /></td>
              	</th>
    			 </div>
 				 </div>
				
				</div>
					<br>
				
  			<tr>
  			<th>
 			<div class="dropdown">
  
    			<button class="btn btn-default dropdown-toggle" type="button"   data-toggle="dropdown"><b>Member</b>
   				 <span class="caret"></span></button>
    			<ul class="dropdown-menu">
      			<li><a href="#">Member Creation<span class="caret"></span></a></li>
      			<li><a href="#">Entries<span class="caret"></span></a></li>
    		 	<li><a href="#">Reports<span class="caret"></span></a></li>
    		   <li><a href="#">Pending Authorized<span class="caret"></span></a></li>
    		   <li><a href="#">Fund Transfer<span class="caret"></span></a></li>
    		   <li><a href="#">Status<span class="caret"></span></a></li>
     			</ul>
    
              <td><input id="perm4" class="cb1" type="checkbox" name="memberAllAccess" value="memberAllAccess" /></td>
						<td><input id="perm5" type="checkbox" name="memberEntryAccess" value="memberEntryAccess" /></td>
						<td><input id="perm6" type="checkbox" name="memberEditAccess" value="memberEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
              	</th>
                </div>
 				</div>
 				 
				<br>
				<tr>
  			   <th>
 			    <div class="dropdown">
               <button class="btn btn-default dropdown-toggle" type="button"   data-toggle="dropdown"><b>Deposit</b>
   				 <span class="caret"></span></button>
    			<ul class="dropdown-menu">
      			<li><a href="#">Deposit<span class="caret"></span></a></li>
    		 	</ul>
               <td><input id="perm7" class="cb1" type="checkbox" name="depositAllAccess" value="depositAllAccess" /></td>
						<td><input id="perm8" type="checkbox" name="depositEntryAccess" value="depositEntryAccess" /></td>
						<td><input id="perm9" type="checkbox" name="depositEditAccess" value="depositEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
              	</th>
                 </div>
 				 </div>
 				 
				<br>
				<tr>
  			   <th>
 			    <div class="dropdown">
               <button class="btn btn-default dropdown-toggle" type="button"   data-toggle="dropdown"><b>Loans</b>
   				 <span class="caret"></span></button>
    			<ul class="dropdown-menu">
      			<li><a href="#">Personal Loan<span class="caret"></span></a></li>
      			<li><a href="#">Vehicle Loan<span class="caret"></span></a></li>
    		 	<li><a href="#">Home Loan<span class="caret"></span></a></li>
    		   <li><a href="#">Loan<span class="caret"></span></a></li>
    		   </ul>
               <td><input id="perm10" class="cb1" type="checkbox" name="loansAllAccess" value="loansAllAccess" /></td>
						<td><input id="perm11" type="checkbox" name="loansEntryAccess" value="loansEntryAccess" /></td>
						<td><input id="perm12" type="checkbox" name="loansEditAccess" value="loansEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
              	</th>
                 </div>
 				 </div>
				
				
				<br>
				<tr>
  			   <th>
 			    <div class="dropdown">
               <button class="btn btn-default dropdown-toggle" type="button"   data-toggle="dropdown"><b>Pigmi</b>
   				 <span class="caret"></span></button>
    			<ul class="dropdown-menu">
      			<li><a href="#">Master<span class="caret"></span></a></li>
      			 </ul>
               <td><input id="perm13" class="cb1" type="checkbox" 	name="pigmiAllAccess" value="pigmiAllAccess" /></td>
						<td><input id="perm14" type="checkbox" name="pigmiEntryAccess" value="pigmiEntryAccess" /></td>
						<td><input id="perm15" type="checkbox" name="pigmiEditAccess" value="pigmiEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
              	</th>
                 </div>
 				 </div>
				
				<br>
				<tr>
  			   <th>
 			    <div class="dropdown">
               <button class="btn btn-default dropdown-toggle" type="button"   data-toggle="dropdown"><b>Accounts</b>
   				 <span class="caret"></span></button>
    			<ul class="dropdown-menu">
      			<li><a href="#">Master<span class="caret"></span></a></li>
      			<li><a href="#">Entries<span class="caret"></span></a></li>
    		 	<li><a href="#">Ledger<span class="caret"></span></a></li>
    		   <li><a href="#">Statements<span class="caret"></span></a></li>
    		   <li><a href="#">Reports<span class="caret"></span></a></li>
    		   <li><a href="#">Pending Authorized<span class="caret"></span></a></li>
    		   <li><a href="#">Close a Account<span class="caret"></span></a></li>
    		   
    		   </ul>
               <td><input id="perm16" class="cb1" type="checkbox" name="accountsAllAccess" value="accountsAllAccess" /></td>
						<td><input id="perm17" type="checkbox" name="accountsEntryAccess" value="accountsEntryAccess" /></td>
						<td><input id="perm18" type="checkbox" name="accountsEditAccess" value="accountsEditAccess" /></td>
						<td><input class="cancelClass"   type="checkbox" name="cancel" value="cancel" /></td>
              	</th>
                 </div>
 				 </div>
				
				<!-- <tr>
					<th> <a href="#">Home</a>
					<select>
  						<option value="User Roles">User Roles</option>
  						<option value="saab">Profile</option>
 						 <option value="opel">Status</option>
 						 <option value="audi">Entries</option>
 							</select>
							</th>
						<td><input id="perm1" class="cb1" type="checkbox" name="homeAllAccess" value="homeAllAccess" /></td>
						<td><input id="perm2" type="checkbox" name="homeEntryAccess" value="homeEntryAccess" /></td>
						<td><input id="perm3" type="checkbox" name="homeEditAccess" value="homeEditAccess" /></td>
						<td><input class="cancelClass" type="checkbox" name="cancel" value="cancel" /></td>
					</tr> -->
				<!-- <tr>
						<th> <a href="#">Member</a>
						<select>
  						<option value="Member Creation">Member Creation</option>
  						<option value="Entries">Entries</option>
 						 <option value="Reports">Reports</option>
 						 <option value="Pending Authorized">Pending Authorized</option>
 						 <option value="Fund Transfer">Fund Transfer</option>
 						 <option value="Status">Status</option>
							</select>
						</th>
						<td><input id="perm4" class="cb1" type="checkbox" name="memberAllAccess" value="memberAllAccess" /></td>
						<td><input id="perm5" type="checkbox" name="memberEntryAccess" value="memberEntryAccess" /></td>
						<td><input id="perm6" type="checkbox" name="memberEditAccess" value="memberEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
					</tr> -->
					
						<!-- <tr>
						<th><a href="#">Deposit</a>
						<select>
  						<option value="Deposit">Deposit</option>
  						</select>
						</th>
						<td><input id="perm7" class="cb1" type="checkbox" name="depositAllAccess" value="depositAllAccess" /></td>
						<td><input id="perm8" type="checkbox" name="depositEntryAccess" value="depositEntryAccess" /></td>
						<td><input id="perm9" type="checkbox" name="depositEditAccess" value="depositEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
					</tr> -->
					<!-- <tr>
						<th><a href="#">Loans</a>
						<select>
  						<option value="Personal Loan">Personal Loan</option>
  						<option value="Vehicle Loan">Vehicle Loan</option>
 						 <option value="Home Loan">Home Loan </option>
 						 <option value="Loan">Loan</option>
 						 
							</select>
						
						</th>
						<td><input id="perm10" class="cb1" type="checkbox" name="loansAllAccess" value="loansAllAccess" /></td>
						<td><input id="perm11" type="checkbox" name="loansEntryAccess" value="loansEntryAccess" /></td>
						<td><input id="perm12" type="checkbox" name="loansEditAccess" value="loansEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
					</tr> -->
					<!-- <tr>
						<th><a href="#">Pigmi</a>
						<select>
  						<option value="Master">Master</option>
  						</select>
						</th>
						<td><input id="perm13" class="cb1" type="checkbox" 	name="pigmiAllAccess" value="pigmiAllAccess" /></td>
						<td><input id="perm14" type="checkbox" name="pigmiEntryAccess" value="pigmiEntryAccess" /></td>
						<td><input id="perm15" type="checkbox" name="pigmiEditAccess" value="pigmiEditAccess" /></td>
						<td><input class="cancelClass"  type="checkbox" name="cancel" value="cancel" /></td>
					</tr> -->
					<!-- <tr>
						<th><a href="#">Accounts</a>
						<select>
  						<option value="Master">Master</option>
  						<option value="Entries">Entries</option>
 						 <option value="Ledger">Ledger </option>
 						 <option value="Statements">Statements</option>
 						 <option value="Reports">Reports</option>
 						 <option value="Pending Authorized">Pending Authorized</option>
 						 <option value="Close a Account">Close a Account</option>
 						 
							</select>
						
						</th>
						<td><input id="perm16" class="cb1" type="checkbox" name="accountsAllAccess" value="accountsAllAccess" /></td>
						<td><input id="perm17" type="checkbox" name="accountsEntryAccess" value="accountsEntryAccess" /></td>
						<td><input id="perm18" type="checkbox" name="accountsEditAccess" value="accountsEditAccess" /></td>
						<td><input class="cancelClass"   type="checkbox" name="cancel" value="cancel" /></td>
					</tr> -->
					
					
					
					
				</tbody>
			</table>

			<br>
			<button class=" pull-right " type="button" id="save">Save</button>


			<!--<td><input type="button" id="Edit" value="Edit"/></td>-->
			<!--<td><input type="button" id="Save" value="Save"/></td>-->

		</div>
	</form>

	<script type="text/javascript">
	$(document).ready(function(){
		  $('.dropdown-submenu a.test').on("click", function(e){
		    $(this).next('ul').toggle();
		    e.stopPropagation();
		    e.preventDefault();
		  });
	/* $("body")
	.on(
			'click',
			"#submit",
			function() {
				var membersize = parseInt($("#membersize").val().length == null ? "0"
						: $("#membersize").val()) + 1;
				memberSize = "EMP-" + membersize;
				$("#employeeId").val(memberSize);

			});
	 */
	
	 $(".ui-widget").click(function() {
		 
			
			$.ajax({
				url : 'adduserslist.action',
				dataType : "json",
				data : {userId : $(".custom-combobox-input").val()},
				
				success : function(data) {
					alert("success"+data);
				    var entityName=data.entityName;
				    alert("name"+entityName);
					var str = data.entityName.replace(/\"/g, "")
					$("#employeeName").val(str);
					
				}
			});
			
		});
	
	 
		$("#dateofbirth").datepicker();

		$(document).ready(function() {

							$("#emplName").prop("selectedIndex", -1);

							$("#emplName").change(function() {

												var userName = $(this).find("option:selected").text();

												var params = {
														userName : userName
												};
												$
														.ajax({
															url : "getUserPerm.action",
															method : "get",
															data : params,
															success : function(
																	data) {

																var jsonData = JSON
																		.parse(data);

																$(".cancelClass").prop('checked',false);
																
																
																if (jsonData.homeAllAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm1")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm1")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.homeEntryAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm2")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm2")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.homeEditAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm3")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm3")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.memberAllAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm4")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm4")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.memberEntryAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm5")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm5")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.memberEditAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm6")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm6")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.depositAllAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm7")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm7")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.depositEntryAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm8")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm8")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.depositEditAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm9")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm9")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.loansAllAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm10")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm10")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.loansEntryAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm11")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm11")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.loansEditAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm12")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm12")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.pigmiAllAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm13")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm13")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.pigmiEntryAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm14")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm14")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.pigmiEditAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm15")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm15")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.accountsAllAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm16")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm16")
																			.prop(
																					'checked',
																					false);
																}
																if (jsonData.accountsEntryAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm17")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm17")
																			.prop(
																					'checked',
																					false);
																}

																if (jsonData.accountsEditAccess
																		.toLowerCase()
																		.indexOf(
																				"y") >= 0) {
																	$("#perm18")
																			.prop(
																					'checked',
																					true);
																} else {
																	$("#perm18")
																			.prop(
																					'checked',
																					false);
																}

															}
														});

											});

							$('.cb1')
									.click(
											function() {
												if (this.checked) {
													$(this)
															.closest("tr")
															.children("td")
															.each(
																	function() {
																		$(this)
																				.find(
																						'input[type=checkbox]')
																				.prop(
																						'checked',
																						true);
																	});
													
												/* 	$(".cancelClass").prop('checked',false); */
												}

												else {
													$(this)
															.closest("tr")
															.children("td")
															.each(
																	function() {
																		$(this)
																				.find(
																						'input[type=checkbox]')
																				.prop(
																						'checked',
																						false);
																	});

												}
											});

							var checkedBoxValues = $('input:checkbox:checked')
									.map(function() {
										return this.value;
									}).get();

							var val = $("#perm1").is(':checked');

							$("#save")
									.click(
											function() {

												alert("Form data will be saved");

												var homeAllAccess = $(
														"#perm1")
														.is(':checked');
												var homeEntryAccess = $(
														"#perm2")
														.is(':checked');
												var homeEditAccess = $(
														"#perm3")
														.is(':checked');
												var memberAllAccess = $(
														"#perm4")
														.is(':checked');
												var memberEntryAccess = $(
														"#perm5")
														.is(':checked');
												var memberEditAccess = $(
														"#perm6")
														.is(':checked');
												var depositAllAccess = $(
														"#perm7")
														.is(':checked');
												var depositEntryAccess = $(
														"#perm8")
														.is(':checked');
												var depositEditAccess = $(
														"#perm9")
														.is(':checked');
												var loansAllAccess = $(
														"#perm10").is(
														':checked');
												var loansEntryAccess = $(
														"#perm11").is(
														':checked');
												var loansEditAccess = $(
														"#perm12").is(
														':checked');
												var pigmiAllAccess = $("#perm13")
														.is(':checked');
												var pigmiEntryAccess = $(
														"#perm14").is(
														':checked');
												var pigmiEditAccess = $("#perm15")
														.is(':checked');
												var accountsAllAccess = $("#perm16")
														.is(':checked');
												var accountsEntryAccess = $(
														"#perm17").is(
														':checked');
												var accountsEditAccess = $(
														"#perm18").is(
														':checked');
												
												
												var empName = $(
														"#emplName option:selected")
														.text();

												var checkboxValues = {
													userName : empName,
													homeAllAccess : homeAllAccess,
													homeEntryAccess : homeEntryAccess,
													homeEditAccess : homeEditAccess,
													memberAllAccess : memberAllAccess,
													memberEntryAccess : memberEntryAccess,
													memberEditAccess : memberEditAccess,
													depositAllAccess : depositAllAccess,
													depositEntryAccess : depositEntryAccess,
													depositEditAccess : depositEditAccess,
													loansAllAccess : loansAllAccess,
													loansEntryAccess : loansEntryAccess,
													loansEditAccess : loansEditAccess,
													pigmiAllAccess : pigmiAllAccess,
													pigmiEntryAccess : pigmiEntryAccess,
													pigmiEditAccess : pigmiEditAccess,
													accountsAllAccess : accountsAllAccess,
													accountsEntryAccess : accountsEntryAccess,
													accountsEditAccess : accountsEditAccess,
													
												};

												$
														.ajax({
															url : "updateUserPerm.action",
															type : "POST",
															data : checkboxValues,
															success : function(
																	data) {
																alert("User Permission Changed");
															}
														});

											});

						});
		
		
		
		
</script>
</body>
</html>