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

.modal-dialog {
	overflow-y: initial !important
}

.modal-body {
	height: 520px;
	overflow-y: auto;
}

.form-group .required .control-label:after {
	content: "*";
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
					<h4 class="modal-title" id="myModalLabel">Loan Ledger
						Application</h4>
				</div>


				<div class="modal-body">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Loan Ledger</legend>
						<div class="col-xs-3">
							<div class="form-group">
								<div class='input-group date' data-provide="datepicker"
									data-date-autoclose="true" data-date-today-btn="linked"
									data-date-today-highlight="true" data-date-format="dd.mm.yyyy">
									<label>Date </label><input id="Date" class="form-control date"
										value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
									<span class="input-group-addon"><span
										class="icon icon-calendar"></span> </span>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Entry No</label> <input type="text"
									id="entryno" autocomplete="off" class="form-control" />
							</div>
						</div>

						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Particulars</label> <input
									type="text" id="particulars" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Total Amount Credit</label> <input
									type="text" id="creditamt" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Total Amount Debiit</label> <input
									type="text" id="debitamt" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Principal Amount</label> <input
									type="text" id="principalamt" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Int.,Amt.,</label> <input
									type="text" id="inttamt" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Penal Int.,</label> <input
									type="text" id="penalint" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Balance</label> <input type="text"
									id="balance" autocomplete="off" class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Type</label> <input type="text"
									id="type" autocomplete="off" class="form-control" />
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
		<legend> Loan Ledger Application </legend>
	</fieldset>

	<fieldset class="scheduler-border">
		<legend class="scheduler-border">Loan Ledger</legend>

		<div class="row">

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label">Account Number </label> <input
						type="text" id="accountnumber" autocomplete="off"
						class="form-control" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label">Account Holder Name </label> <input
						type="text" id="name" autocomplete="off" class="form-control" />
				</div>
			</div>
			

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label">Total Loan Amount</label> <input
						type="text" id="tloanamount" autocomplete="off"
						class="form-control" />
				</div>
			</div>


			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label">Rate of Interest</label> <input
						type="text" id="rateofinterest" autocomplete="off"
						class="form-control" />
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label">Loan Type</label> <input type="text"
						id="loantype" autocomplete="off" class="form-control" />
				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label">Loan Taken Date</label> <input
						type="text" id="ldate" autocomplete="off" class="form-control" />
				</div>
			</div>


			<div class="col-xs-3">
				<div class="form-group">
					<label class="control-label">Address</label> <input type="text"
						id="address" autocomplete="off" class="form-control" />
				</div>
			</div>
	</fieldset>
	</div>
	<div class="row">
		<div class="col-xs-3">
			<div class="form-group"></div>
		</div>
		<div class="col-xs-3">
			<div class="form-group">
				<div class='input-group date' data-provide="datepicker"
					data-date-autoclose="true" data-date-today-btn="linked"
					data-date-today-highlight="true" data-date-format="dd.mm.yyyy">
					<label>From Date </label><input id="fromDate"
						class="form-control date"
						value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
					<span class="input-group-addon"><span
						class="icon icon-calendar"></span> </span>
				</div>
			</div>
		</div>

		<div class="col-xs-3">
			<div class="form-group">
				<div class='input-group date' data-provide="datepicker"
					data-date-autoclose="true" data-date-today-btn="linked"
					data-date-today-highlight="true" data-date-format="dd.mm.yyyy">
					<label>To Date </label><input id="toDate" class="form-control date"
						value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
					<span class="input-group-addon"><span
						class="icon icon-calendar"></span> </span>
				</div>
			</div>
		</div>

		<div class="col-xs-2">
			<br />
			<button type="button" class="btn btn-primary" id="show">Show</button>
		</div>
	</div>


	<div class="table-responsive" id="tableDiv">
		<div class="wraper">
			<!-- Begining -->
			<table border="1" id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Slno</th>
						<th>Date</th>
						<th>Entry No</th>
						<th>Particulars</th>
						<th>Total Amt.,</br> credit
						</th>
						<th>Total Amt.,</br> debit
						</th>
						<th>Principal Amount</th>
						<th>Int., Amt.,</th>
						<th>Penal Int.,</th>
						<th>Balance</th>
						<th>Type</th>



					</tr>
				</thead>
				<%-- <tbody>
					<s:iterator id="regularbean" value="#session.ledgerlist" status="i">
						<tr>
							  <td>${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td>
								
							<td >${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td> 
						
							 	<td class="abc">${regularbean.bankname}<input type="hidden"
								value="${regularbean.bankname}" /></td>
								
								<td class="abc">${regularbean.bankcode}<input type="hidden"
								value="${regularbean.bankcode}" /></td>
								
							
														
						</tr>
					</s:iterator>
				</tbody> --%>
			</table>
		</div>
	</div>

	<button type="button" data-toggle="modal" data-target="#basicModal"
		data-backdrop="static" data-keyboard="false">NEW</button>
	<!-- <input type="button" class="rs-links" id="new1" value="NEW" /> -->

	<%-- 	<input type="hidden" id="membersize" value="<%=session.getAttribute("membersize") %>" />	 --%>

	<script type="text/javascript">
	
		$(document).ready(function(){
											
				
					$("#addNewUser").click(function() {
							
						var bankname = $.trim($('#bankname').val());
						var bankcode = $.trim($('#bankcode').val());
						
						
						if($.trim(name).length == 0) {
							    	alert("Provide Name");
							    }
					    else if($.trim(memberid).length == 0) {
						    	alert("Provide Member ID");
						    }  
						
					    
						else {
									var parms = {
										
										bankname : bankname,
										bankcode : bankcode,
									
										};
											$.ajax({
												type : "POST",
												url : "rsUser.action",
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
											alert(accountno);
									});
									
				});
				
				
							
			
			
		</script>
</body>
</html>






