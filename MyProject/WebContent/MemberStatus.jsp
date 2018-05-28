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
					<h4 class="modal-title" id="myModalLabel">Member Status</h4>
				</div>
									
						
	<div class="modal-body">
					
		<%-- <div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label>Branch Name</label><select id="branch name" class="form-control">
						<option value=""></option>
							<s:iterator id="hmbean" value="#session.nominalist" status="i">
												<option 
													value="${hmbean}">${hmbean}</option>
											</s:iterator> 
						</select>
				</div>
			</div> 
						
						
			</div>--%>
			<div class="row">
				<div class="col-sm-3">
				<div class="form-group">
					<label> Account Type</label> <input type="text" id="accounttype"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label> Account Number</label> <input type="text" id="accountno"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label>Initial Deposit</label> <input type="text" id="initialdeposit"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label> Opening Balance</label> <input type="text" id="opnbal"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label> Debit</label> <input type="text" id="debit"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label> Credit</label> <input type="text" id="credit"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label> Balance</label> <input type="text" id="balance"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label> Type</label> <input type="text" id="type"
						autocomplete="off" class="form-control"  />
				</div>
			</div>
			
				
			</div>
								
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

<div class="modal fade" id="basicModal1" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Member Status</h4>
				</div>
									
						
	<div class="modal-body">
	<div class="row">
			<div class="col-xs-3">
			<div class="form-group">
			</div>
			</div>
			<!-- <div class="col-sm-3">
				<div class="form-group">
					<label>Member Id</label> <input type="text" id="memberid"
						autocomplete="off" class="form-control"  />
			</div>
			</div> -->
			<div class="col-sm-3">
				<div class="form-group">
					<label> Name</label> <input type="text" id="name"
						autocomplete="off" class="form-control"  />
			</div>
			</div>
			</div>
					
		<div class="container">
            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Slno</th>
						 <th>Accnt Type</th>
						 <th>Accnt No</th>
						 <th>Initial Dep</th>
						 <th>Op Bal</th>
						 <th>Debit</th>
						 <th>Credit</th>
						 <th>Balance</th>
						 <th>Type</th>
      </tr>
    </thead>
    <tbody>
     <tr>
     <td>1</td></tr>
    </tbody>
  </table>
</div>
								
		</div>
				<div class="modal-footer">
					
					<button type="button" id="addNewUser" data-type='New'
						class="btn btn-primary">Print</button>
					 <button type="button" id="updat" data-type='New'
						class="btn btn-primary">Close</button>
					<!--<button type="button" id="deleteval" data-type='New'
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
			
	</fieldset>
	
		<div class="row">
		<div class="col-xs-3">
			<div class="form-group">
			</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label>Branch Name</label><select id="branchname" class="form-control">
						<option value=""></option>
							<%-- <s:iterator id="hmbean" value="#session.nominalist" status="i">
												<option 
													value="${hmbean}">${hmbean}</option>
											</s:iterator>  --%>
						</select>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label> Branch Code</label> <input type="text" id="branchcode" readonly="readonly"
						autocomplete="off" class="form-control"  />
			</div>
			</div>
			
			</div>
			<div class="row">
			<div class="col-xs-3">
			<div class="form-group">
			</div>
			</div>
			<div class="ui-widget">
				<div class="col-sm-3">
					<div class="form-group">
						<label>MemberId</label><br/> <select placeholder="MemberId"
							id="combobox">
							<option value="" selected="selected"></option>
                               
											<s:iterator id="fxdbean" value="#session.fxdlist" status="i">
												<option 
													value="${fxdbean}">${fxdbean}</option>
											</s:iterator> 
						</select>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label> Name</label> <input type="text" id="name"
						autocomplete="off" class="form-control"  />
			</div>
			</div>
			</div>
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
										<label>From </label><input  id="fromDate" class="form-control date"
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
									<label>To  </label><input  id="toDate" class="form-control date" 
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
						 <th>Accnt Type</th>
						 <th>Accnt No</th>
						 <th>Initial Dep</th>
						 <th>Op Bal</th>
						 <th>Debit</th>
						 <th>Credit</th>
						 <th>Balance</th>
						 <th>Type</th>
						 <th class="abc">branchname</th>
						 <th class="abc">branchcode</th>
						 <th class="abc">memberid</th>
						 <th class="abc">name</th>
						 <th class="abc">fromDate</th>
						 <th class="abc">toDate</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator id="regularbean" value="#session.statuslist" status="i">
						<tr>
								
							   <td >${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td> 
						
							 	<td>${regularbean.accounttype}<input type="hidden"
								value="${regularbean.accounttype}" /></td>
								
								<td>${regularbean.accountno}<input type="hidden"
								value="${regularbean.accountno}" /></td>
								
								<td>${regularbean.initialdeposit}<input type="hidden"
								value="${regularbean.initialdeposit}" /></td>
								
								<td>${regularbean.opnbal}<input type="hidden" 
								value="${regularbean.opnbal}" /></td>
								
								<td>${regularbean.debit}<input type="hidden"
								value="${regularbean.debit}" /></td>
								
								<td >${regularbean.credit}<input type="hidden"
								value="${regularbean.credit}" /></td>
								
								<td>${regularbean.balance}<input type="hidden"
								value="${regularbean.balance}" /></td>
								
								<td>${regularbean.type}<input type="hidden"
								value="${regularbean.type}" /></td>
								
								<td class="abc">${regularbean.branchname}<input type="hidden"
								value="${regularbean.branchname}" /></td>
								
								<td class="abc">${regularbean.branchcode}<input type="hidden"
								value="${regularbean.branchcode}" /></td>
								
								<td class="abc">${regularbean.memberid}<input type="hidden"
								value="${regularbean.memberid}" /></td>
								
								<td class="abc">${regularbean.name}<input type="hidden"
								value="${regularbean.name}"/></td>
								
								<td class="abc">${regularbean.fromDate}<input type="hidden"
								value="${regularbean.fromDate}" /></td>
								
								<td class="abc">${regularbean.toDate}<input type="hidden"
								value="${regularbean.toDate}" /></td>
								
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
	<!-- 
	<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">
	NEW
	</button> -->
	<button type="button" data-toggle="modal" data-target="#basicModal1" data-backdrop="static" data-keyboard="false">
View Report
	</button>
	<!-- <button type="button" class="btn btn-primary" id="show" >View All Reports</button> -->
	<!-- <input type="button" class="rs-links" id="new1" value="NEW" /> -->
		
		<input type="hidden" id="membersize" value="<%=session.getAttribute("membersize") %>" />	
		
		<script type="text/javascript">
	
		$(document).ready(function(){
											
				
					
				/*  $("#addNewUser").click(function() {
							
						var accounttype = $.trim($('#accounttype').val());
						var accountno = $.trim($('#accountno').val());
						var initialdeposit = $.trim($('#initialdeposit').val());
						var debit = $.trim($('#debit').val());
						var credit = $.trim($('#credit').val());
						var balance = $.trim($('#balance').val());
						var type = $.trim($('#type').val());
						var branchname = $.trim($('#branchname').val());
						var branchcode = $.trim($('#branchcode').val());
						var memberid = $.trim($('#combobox').val());
						var name = $.trim($('#name').val());
						var fromDate = $.trim($('#fromDate').val());
						var toDate = $.trim($('#toDate').val());
						
						
						
						
						
						if($.trim(name).length == 0) {
							    	alert("Provide Name");
							    }
					    else if($.trim(memberid).length == 0) {
						    	alert("Provide Member ID");
						    }  
						
						else {
									var parms = {
										
											accounttype : accounttype,
											accountno : accountno,
											initialdeposit : initialdeposit,
											debit : debit,
											credit : credit,
											balance : balance,
											type : type,
											branchname : branchname,
											branchcode : branchcode,
											memberid : memberid,
											name : name,
											fromDate : fromDate,
											toDate : toDate,
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
									}); */
									
				});
				
				
							
			/* 	$("body").on('click',"#addNewUser",function(){
					var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RS-"+membersize;
					$("#memberid").val(memberSize);
									
					});*/
					
					$('#name').keyup(function() {
					    var $th = $(this);
					    $th.val( $th.val().replace(/[^a-zA-Z]/g, function(str) 
					    {
					    	
					    	return ''; 
					    } 
					  ) );
					});	
		
	
		
	 (function($) {
			$.widget("custom.combobox",
							{
								_create : function() {
									this.wrapper = $("<span>").addClass("custom-combobox").insertAfter(this.element);
									this.element.hide();
									this._createAutocomplete();
									this._createShowAllButton();
									this.input.attr("placeholder", this.element.attr('placeholder'));
								},

								_createAutocomplete : function() {
									var selected = this.element.children(":selected"), value = selected.val() ? selected.text() : "";
									this.input = $("<input>").appendTo(this.wrapper).val(value).attr("title", "").addClass(
													"custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
											.autocomplete(
													{
														delay : 0,
														minLength : 0,
														source : $.proxy(this,"_source")
													})
											.tooltip(
													{
														tooltipClass : "ui-state-highlight"
													});

									this._on(
													this.input,
													{
														autocompleteselect : function(event, ui) {
															ui.item.option.selected = true;
															this._trigger("select",event,
																			{
																				item : ui.item.option
																			});
														},
														autocompletechange : "_removeIfInvalid"
													});
								},

								_createShowAllButton : function() {
									var input = this.input, wasOpen = false;

									$("<a>")
											.attr("tabIndex", -1)
											.attr("title", "Show All Items")
											.tooltip()
											.appendTo(this.wrapper)
											.button(
													{
														icons : {
															primary : "ui-icon-triangle-1-s"
														},
														text : false
													})
											.removeClass("ui-corner-all")
											.addClass(
													"custom-combobox-toggle ui-corner-right")
											.mousedown(
													function() {
														wasOpen = input
																.autocomplete(
																		"widget")
																.is(":visible");
													}).click(
													function() {
														input.focus();

														// Close if already visible
														if (wasOpen) {
															return;
														}

														// Pass empty string as value to search for, displaying all results
														input.autocomplete(
																"search", "");
													});
								},

								_source : function(request, response) {
									var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
									response(this.element.children("option").map(
													function() {
														var text = $(this).text();
														if (this.value && (!request.term || matcher.test(text)))
															return {
																label : text,
																value : text,
																option : this
															};
													}));
								},

								_removeIfInvalid : function(event, ui) {

									// Selected an item, nothing to do
									if (ui.item) {
										return;
									}

									// Search for a match (case-insensitive)
									var value = this.input.val(), valueLowerCase = value.toLowerCase(), valid = false;
									this.element.children("option").each(
													function() {
														if ($(this).text()
																.toLowerCase() === valueLowerCase) {
															this.selected = valid = true;
															return false;
														}
													});

									// Found a match, nothing to do
									if (valid) {
										return;
									}

									// Remove invalid value
									this.input.val("").attr("title", value + " didn't match any item")
											.tooltip("open");
									this.element.val("");
									this._delay(function() {
										this.input.tooltip("close").attr("title", "");
															}, 2500);
									this.input.autocomplete("instance").term = "";
								},

								_destroy : function() {
									this.wrapper.remove();
									this.element.show();
								}
							});
		})(jQuery);		
			
		</script>

</body>
</html>





