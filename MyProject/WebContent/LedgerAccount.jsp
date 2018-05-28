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
          width: 780px; /* New width for large modal */
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
					<h4 class="modal-title" id="myModalLabel">Ledger Account</h4>
				</div>
									
						
					<div class="modal-body">
						
						<div class="row">
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Ledger_Account</legend>
						<div class="col-sm-4">
									<div class="form-group">
										<label>Branch Name</label> <select id="branchname"
										class="form-control">
										<option value="PCCSL Main Branch">PCCSL Main Branch</option>
										</select>
									</div>
							 	</div>
								<div class="col-sm-4">2	
									<div class="form-group">
										<label>Branch Code</label> <select id="branchcode"
										class="form-control">
										<option value="PCCSLMB">PCCSLMB</option>
										</select>
									</div>
								</div>
						
						<div class="col-sm-4">
							<div class="form-group">
								<label>SubGroupName</label> <select id="subgroupname"
									class="form-control">
									<option value="" selected="selected"></option>
											<s:iterator id="groupbean" value="#session.lglist" status="i">
												<option data-maingroup="${groupbean.maingroup}"
													value="${groupbean.groupname}">${groupbean.groupname}</option>
											</s:iterator>
										</select>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="form-group">
								<label>Main Group</label> <input type="text" id="maingroup"
									class="form-control" />
							</div>
						</div> 
						<div class="col-sm-4">
							<div class="form-group">
								<label>Account Name</label> <input type="text" id="accountname"
									class="form-control" />
							</div>
						</div> 
						<div class="col-sm-4">
							<div class="form-group">
								<label>Account Code</label> <input type="text" id="accountcode"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label>Opening Balance</label> <input type="text" id="openingbalance"
									class="form-control" />
							</div>
						</div> 
						<div class="col-sm-4">
							<div class="form-group">
								<label>Type</label> <select id="type"
									class="form-control">
									<option value="Cr">Cr</option>
										<option value="Dr">Dr</option>
								</select>
							</div>
						</div>
						</fieldset>
					</div>	
		</div>
				<div class="modal-footer">
					
					<button type="button" id="addNewUser" data-type='New'
						class="btn btn-primary">Save</button>
					<!-- <button type="button" id="update" data-type='New'
						class="btn btn-primary">update</button> -->
					<!-- <button type="button" id="delete1" data-type='New'
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
			Ledger Account 
		</legend>
	</fieldset>
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th> 
						<th class="abc">Branch Name</th>
						<th class="abc">Branch Code</th>
						<th>SubGroup Name</th>
						<th>Main Group</th>
						<th>Account	Name</th>
						<th>Account Code</th>
						<th>Opening Balance</th>
						<th>Type</th>
						 
						
					</tr>
				</thead>
				<tbody>
					<s:iterator id="accountbean" value="#session.accountlist" status="i">
						<tr>
							 <td>${accountbean.id}<input type="hidden"
								value="${accountbean.id}" /></td>
								
							 <%--<td class="dw-links" data-page="ContraEntry.jsp"><a
								href="#">${contrabean.userName}</a><input type="hidden"
								value="${contrabean.userName}" /></td>--%> 
						
																
							  <td class="abc">${accountbean.branchname}<input type="hidden"
								value="${accountbean.branchname}" /></td>
								
								<td class="abc">${accountbean.branchcode}<input type="hidden"
								value="${accountbean.branchcode}" /></td>
								
								<td>${accountbean.subgroupname}<input type="hidden"
								value="${accountbean.subgroupname}" /></td>
								
								<td>${accountbean.maingroup}<input type="hidden"
								value="${accountbean.maingroup}" /></td> 
								
								<td>${accountbean.accountname}<input type="hidden"
								value="${accountbean.accountname}" /></td>
								
								<td class="rs-links"><a
								href="#">${accountbean.accountcode}</a><input type="hidden"
								value="${accountbean.accountcode}" /></td>
								
								<td>${accountbean.openingbalance}<input type="hidden"
								value="${accountbean.openingbalance}" /></td>
								
								<td>${accountbean.type}<input type="hidden"
								value="${accountbean.type}" /></td>
								
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
	
	<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">
	NEW
	</button>
	
	<!-- <input type="button" class="rs-links" id="new2" value="NEW" /> -->
		<script type="text/javascript">
				$(document).ready(function(){
					
					/* $("#subgroupname").change(function() {
						
						if ($("#maingroup").val() == 'ASSETS') {
							$('#type')val('Dr');
						} else {
							$('#type')val('Cr');

						}
					}); */
					
					$(".rs-links").click(function(){
						var rowinfo = $(this).closest('tr').find('td').map(function () {
				        	return $(this).text();
				     	}).get();
						$("#update").attr('data-id',rowinfo[0]);
						$("#delete1").attr('data-id',rowinfo[0]);
						$("#basicModal").modal('show');
						$("#branchname").val(rowinfo[1]);
						$("#branchcode").val(rowinfo[2]);
					    $("#subgroupname").val(rowinfo[3]);
						$("#maingroup").val(rowinfo[4]);
						$("#accountname").val(rowinfo[5]);
						$("#accountcode").val(rowinfo[6]);
						$("#openingbalance").val(rowinfo[7]);
						$("#type").val(rowinfo[8]);
					
					});
					
		$("#addNewUser").click(function() {
						
						var branchname = $.trim($('#branchname').val());
						var branchcode = $.trim($('#branchcode').val());
						var subgroupname = $.trim($('#subgroupname').val());
						var maingroup = $.trim($('#maingroup').val());
						var accountname = $.trim($('#accountname').val());
						var accountcode = $.trim($('#accountcode').val());
						var openingbalance = $.trim($('#openingbalance').val());
						var type = $.trim($('#type').val());
						
						if($.trim(accountname).length == 0) {
					    	alert("Provide accountname");
					    }
						else if($.trim(maingroup).length == 0) {
					    	alert("Provide maingroup");
					    }
						else if($.trim(branchname).length == 0) {
					    	alert("Provide branchname");
					    }
						else if($.trim(branchcode).length == 0) {
					    	alert("Provide branchcode");
					    }
						else if($.trim(subgroupname).length == 0) {
					    	alert("Provide subgroupname");
					    }
					    
						else {
						
									var parms = {
										
										branchname : branchname,
										branchcode : branchcode,
										subgroupname : subgroupname,
										maingroup : maingroup,
										accountname : accountname,
										accountcode : accountcode,
										openingbalance : openingbalance,
										type : type
										};
											$.ajax({
												type : "POST",
												url : "ledgeraccnt.action",
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
									});
				});
		$("#update").click(function(){
			//alert(' Account number cannot be changed');
			
			var rowId1 = {id: $(this).attr('data-id'),
					
			 branchname : $("#branchname").val(),
			 branchcode : $("#branchcode").val(),
			 accountname : $('#accountname').val(),
			 accountcode : $('#accountcode').val(),
			 subgroupname : $("#subgroupname").val(),
			 maingroup : $("#maingroup").val(),
			 openingbalance  : $("#openingbalance").val(),
			 type  : $("#type").val()
			 
					}
					
				 $.ajax({
					url: 'ledgeraccoutupdate.action',
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
					}
				});
		});
		
		
		$("#delete1").click(function(){
			
			//alert('Hello');
			var id = $(this).attr('data-id');
			var accountcode = $("#accountcode").val();
			
			$.ajax({
					url: 'ledgeraccountdelete.action',
					data: {id: id,
						accountcode:accountcode},
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
					}
				});  
			
		}); 
			
				 $("body").on('focusout',"#accountname",function(){
					var size=${accountbean.id} + 1 ;
					size= "LA-"+size;
					$("#accountcode").val(size);
						
					});
				
				$("#subgroupname").change(
						function() {
							var mainGroup = $(this).find('option:selected').attr('data-maingroup');
							$("#maingroup").val(mainGroup);
							if ($("#maingroup").val() == 'ASSETS' || $("#maingroup").val() == 'EXPENSES') {
								var newvalue = 'Dr';
								$('#type').val(newvalue);
							} else {
								var newvalue = 'Cr';
								$('#type').val(newvalue);

							}
						});
				
				
</script>

</body>
</html>