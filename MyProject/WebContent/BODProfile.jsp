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
					<h4 class="modal-title" id="myModalLabel"></h4>
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
								
								
						</div>
							
							<div class="row">
								<fieldset class="scheduler-border">
									<legend class="scheduler-border">Stake Holders</legend>
						
								<div class="col-sm-4">
									<div class="form-group">
										<label>StakeHolder Name</label> <input type="text" id="stakeholdername"
											autocomplete="off" class="form-control" />
									</div>
								</div>
					
								<div class="col-sm-4">
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
									
								<div class="col-sm-4">
									<div class="form-group">
										<label>Address</label> <textarea class="form-control" id="address" ></textarea>
									</div>
								</div>
								
							<!-- </div>
							<div class="row">	 -->		
					
							<div class="col-sm-3">
								<div class="form-group">
									<label>Contact Number</label> <input type="text" id="contactnumber"
										class="form-control" />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>PAN</label> <input type="text" id="pan"
										class="form-control" />
								</div>
							</div>
						
							<div class="col-sm-3">
								<div class="form-group">
									<label>Mobile Number</label> <input type="text" id="mobilenumber"
										class="form-control" />
								</div>
							</div>
					
							<div class="col-sm-3">
								<div class="form-group">
									<label>Email</label> <input type="email" id="email"
										class="form-control" />
								</div>
							</div>
						</fieldset>
				</div>		
					
	
			</div>
				<div class="modal-footer">
					
					<button type="button" id="addNewUser1" data-type='New'
						class="btn btn-primary">AddUser</button>
				<!-- 	<button type="button" id="update" data-type='New'
						class="btn btn-primary">update</button>
					<button type="button" id="deleteRow" data-type='New'
						class="btn btn-primary">delete</button> -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<fieldset>
		<legend>
			BOD Details 
		</legend>
	</fieldset>
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<!-- <th>Name</th>
						<th>DOB</th>
						<th>Address</th>
						<th>Contact No</th>
						<th>Email</th>
						<th>PAN</th> -->
					</tr>
				</thead>
				<tbody>
					<%-- <s:iterator id="contrabean" value="#session.userlist" status="i"> --%>
						<tr>
							<%-- <td>${contrabean.userId}<input type="hidden"
								value="${contrabean.userId}" /></td>
								
							<td class="dw-links" data-page="ContraEntry.jsp"><a
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
								
								<td>${contrabean.age}<input type="hidden"
								value="${contrabean.age}" /></td>
								
								<td>${contrabean.bankname}<input type="hidden"
								value="${contrabean.bankname}" /></td>
								
								<td>${contrabean.branchname}<input type="hidden"
								value="${contrabean.branchname}" /></td>
								
								<td>${contrabean.employeeId}<input type="hidden"
								value="${contrabean.employeeId}" /></td>
								
								<td>${contrabean.dateofbirth}<input type="hidden"
								value="${contrabean.dateofbirth}" /></td>
								
								<td>${contrabean.dateofjoining}<input type="hidden"
								value="${contrabean.dateofjoining}" /></td>
								
								<td>${contrabean.gender}<input type="hidden"
								value="${contrabean.gender}" /></td>
								
								<td>${contrabean.hobbies}<input type="hidden"
								value="${contrabean.hobbies}" /></td>
								
								<td>${contrabean.reqto}<input type="hidden"
								value="${contrabean.reqto}" /></td>
								
								<td>${contrabean.fathername}<input type="hidden"
								value="${contrabean.fathername}" /></td>
								
								<td>${contrabean.raddress}<input type="hidden"
								value="${contrabean.raddress}" /></td>
								
								<td>${contrabean.caddress}<input type="hidden"
								value="${contrabean.caddress}" /></td>
								
								<td>${contrabean.bloodgroup}<input type="hidden"
								value="${contrabean.bloodgroup}" /></td>
								
								<td>${contrabean.resno}<input type="hidden"
								value="${contrabean.resno}" /></td>
								
								<td>${contrabean.apname}<input type="hidden"
								value="${contrabean.apname}" /></td>
								
								<td>${contrabean.apnumber}<input type="hidden"
								value="${contrabean.apnumber}" /></td>
								
								<td>${contrabean.otherdetails}<input type="hidden"
								value="${contrabean.otherdetails}" /></td> --%>
								
						
						</tr>
					<%-- </s:iterator> --%>
				</tbody>
			</table>
		</div>
	</div>
	
		<input type="button"  id="new1" value="NEW" />
 	<script type="text/javascript">	
	
		
	$(document).ready(function(){
		
		
		
		
		$("#new1").click(function(){
		
		 	$("#basicModal").modal('show');
		});  
	});
	</script>
		
		
		
		
		
		
		

</body>
</html>