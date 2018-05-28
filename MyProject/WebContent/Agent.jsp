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

	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">Agent</h3>
				</div>
<div class="modal-body">
<fieldset class="scheduler-border">

		<legend class="scheduler-border">Agent_info</legend>

		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Agent Name</label> <input type="text"
							id="agentname" class="form-control">
					</div>
				</div>
			</div>




			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Agent Code</label><input type="text"
							id="agentcode" class="form-control">
					</div>
				</div>
			</div>



			<div class="col-sm-3">
				<div class="form-group required">
					<label class="control-label">City</label>
					 <select id="city"
						class="form-control">
						 <option value="mysore" selected="">Mysuru</option>
						  <!-- <option value="bangalore" selected="">Bangalore</option> -->
					</select>
				</div>
			</div>



			<div class="col-sm-3">
				<div class="form-group">
					<label>Area</label><input type="text" id="area"
						class="form-control">
				</div>
			</div>
		</div>







		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Pin</label><input type="text"
							id="pin" class="form-control" maxlength="6">
					</div>
				</div>
			</div>



			<div class="col-sm-3">
				<div class="form-group">
					<label>Contact Number</label><input type="" id="contactnumber"
						class="form-control">
				</div>
			</div>



			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Mobile Number</label><input
							type="number" id="mobilenumber" class="form-control" maxlength="10">
					</div>
				</div>
			</div>




			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Gender</label><select id="gender"
							class="form-control">

							<option value="Male" selected="selected">Male</option>
							<option value="Female">Female</option>
						</select>
					</div>
				</div>
			</div>
		</div>



		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Other Details</label><input
							type="text" id="otherdetails" class="form-control">
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label>Address</label>
					<textarea class="form-control" id="address"></textarea>
				</div>
			</div>

		</div>

</div>
	<fieldset>
	<div class="modal-footer">
		<input type="button" id="submit" class="btn btn-primary"
			value="Submit" />
	</div>
	
	
		</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	<fieldset>
		<legend>
			Agent
		</legend>
	</fieldset>
	<div class="row">
			<div class="col-xs-3">
			<div class="form-group">
			</div>
			</div>
				<div class="col-xs-3">
			<div class="form-group">
			<div class='input-group date'  data-provide="datepicker"
				data-date-autoclose="true" data-date-today-btn="linked"
										 data-date-today-highlight="true"
										data-date-format="dd.mm.yyyy">
										<label>From Date </label><input  id="fromDate" class="form-control date"
										value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span>
									</div>
									</div>
									</div>
							
			<div class="col-xs-3">
			<div class="form-group">
			<div class='input-group date'  data-provide="datepicker"
				data-date-autoclose="true" data-date-today-btn="linked"
										 data-date-today-highlight="true"
										data-date-format="dd.mm.yyyy">
									<label>To Date </label><input  id="toDate" class="form-control date" 
									value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
									 <span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span> 
									</div>
									</div>
									</div>
									
									<div class="col-xs-2">
									<br/>
				<button type="button" class="btn btn-primary" id="show" >Show</button>
				</div>	
			</div>
	
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					<th> Agent Name</th>
						<th>Agent Code</th>
						<th>City</th>
						<th>Area</th>
						<th>Pin</th>
						<th>Contact Number</</th>
						<th>Mobile Number</th>
						
						</tr>
						</thead>
						</table></div>
						</div>
						
						<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">	NEW</button>

<script type="text/javascript">
$(document).ready(function(){
	$("#submit").click(function(){
	alert("suhfh");
	var agentname = $('#agentname').val();
	var agentcode = $('#agentcode').val();
	var city = $('#city').val();
	var area =$('#area').val();
	var pin= $('#pin').val();
	var contactnumber = $('#contactnumber').val();
	var mobilenumber= $('#mobilenumber').val();
	var gender = $('#gender').val();
	var otherdetails = $('#otherdetails').val();
	var address = $('#address').val();
			var parms = {
					agentname : agentname,
					agentcode : agentcode,
					city : city,
					area : area,
					pin  : pin,
					contactnumber :	contactnumber,
					mobilenumber : mobilenumber,
					gender : gender,
					otherdetails : otherdetails,
					address : address
	};
			$.ajax({
				type : "POST",
				url : "agents.action",
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