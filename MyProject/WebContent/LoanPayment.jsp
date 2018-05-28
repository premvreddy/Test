<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <% Integer number= (Integer)session.getAttribute("membersize"); %> --%>
<%-- <% Integer autoincrement=number+2 ;%> --%> 

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

.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height:520px;
    overflow-y: auto;
}

.form-group .required .control-label:after {
  content:"*";
  color:red;
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
					<h4 class="modal-title" id="myModalLabel">Loan Payment Application</h4>
				</div>
									
						
					<div class="modal-body">
					<fieldset class="scheduler-border">

		<legend class="scheduler-border">Home Loan</legend>
					
					
		<div class="row">
							
						<div class="col-xs-3">
			<div class="form-group">
			<div class='input-group date'  data-provide="datepicker"
				data-date-autoclose="true" data-date-today-btn="linked"
										 data-date-today-highlight="true"
										data-date-format="dd.mm.yyyy">
									<label>Date </label><input  id="Date" class="form-control date" 
									value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
									 <span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span> 
									</div>
									</div>
									</div>
						
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label"> LPay No</label> <input type="text" readonly="readonly"
									id="lpay" class="form-control">
						</div>
					</div>	
					
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label"> Account No</label> <input type="text" 
									id="accountno" class="form-control">
						</div>
					</div>		
							
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label"> Account Holder Name</label> <input type="text" 
									id="name" class="form-control">
						</div>
					</div>	
					
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label">Total No. of months</label> <input type="text" 
									id="months" class="form-control">
						</div>
					</div>		
					
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label"> Total amount</label> <input type="text" 
									id="totalamount" class="form-control">
						</div>
					</div>		
					
					<div class="col-sm-3">
				         <div class="form-group">
					              <label> Address</label>
					              <textarea class="form-control" id="address" ></textarea>
				          </div>
			       </div>
		
	</div>
	</fieldset>
								
		</div>
				<div class="modal-footer">
					
					<button type="button" id="addNewUser" data-type='New'
						class="btn btn-primary">AddUser</button>
					<!-- <button type="button" id="updat" data-type='New'
						class="btn btn-primary">update</button>
					<button type="button" id="deleteval" data-type='New'
						class="btn btn-primary">Cancel</button> -->
				</div>
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	
	<fieldset>
		<legend>
			Loan Payment Application
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
						 <th>Slno</th>
						<th class="abc">bankname</th>
						<th class="abc">bankcode</th>
						<th>MemberId</th>
					
					</tr>
				</thead>
				<tbody>
					<s:iterator id="regularbean" value="#session.paymentlist" status="i">
						<tr>
							  <td>${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td>
								
							<td >${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td> 
						
							 	<td class="abc">${regularbean.bankname}<input type="hidden"
								value="${regularbean.bankname}" /></td>
								
								<td class="abc">${regularbean.bankcode}<input type="hidden"
								value="${regularbean.bankcode}" /></td>
								
								<td>${regularbean.memberid}<input type="hidden"
								value="${regularbean.memberid}" /></td>
								
							
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div> 
	
	<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">
	NEW
	</button>
	<!-- <input type="button" class="rs-links" id="new1" value="NEW" /> -->
		
	<%-- 	<input type="hidden" id="membersize" value="<%=session.getAttribute("membersize") %>" />	 --%>
		
		<script type="text/javascript">
	
			$(document).ready(function(){
											
				/* 	$("#new1").click(function(){
						$("#basicModal").modal('show');
						
					});	 */				
					
					
					$("#addNewUser").click(function() {
							
						var name = $.trim($('#name').val());
						var address = $.trim($('#address').val());
						var memberid = $.trim($('#memberid').val());
						
						
						if($.trim(name).length == 0) {
							    	alert("Provide Name");
							    }
					    else if($.trim(memberid).length == 0) {
						    	alert("Provide Member ID");
						    }  
					
					    
						else {
									var parms = {
										
										name : name,
										address : address,
										memberid : memberid,
									
										};
											$.ajax({
												type : "POST",
												url : "savings.action",
												dataType : "json",
												data : parms,
													success : function(data) {
			
															//data = eval('('+data+')');
															var errorString = data.errorString;
															var resultString = data.resultString;
															if (resultString == "error") {
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
											//alert(accountno);
									});
									
				}); 
				
				
		
		</script>

	
</body>
</html>





