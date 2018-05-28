<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <% Integer number= (Integer)session.getAttribute("membersize"); %> --%>
<%-- <% Integer autoincrement=number+2 ;%> --%> 
 <%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"  %>

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
    margin: 0 0 1.1em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}
    legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 5px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}


</style>


</head>
<body>

	  								
	 <!-- <div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Ledger Accounts</h4>
				</div>
									
						
					<div class="modal-body"> --> 
						
						<br/>
						<!-- <h3 align="center">LedgerAccount</h3> -->
					<div class="row">
					<fieldset  class="scheduler-border">
						<legend  class="scheduler-border">LedgerAccount</legend>
	
					
					
					<div class="ui-widget">
						<div class="col-sm-3">
							<div class="form-group">
								<label>Account Number</label><br/>
								<select placeholder="AccountNumber" id="combobox" >
									<option value="" selected="selected">Account No</option>
											<%--  <s:iterator id="ldgbean" value="#session.lgdetaillist" status="i">
												<option data-name='${ldgbean.name}'
													value="${ldgbean.accountno}">${ldgbean.accountno}</option>
											</s:iterator> --%> 
											
											<s:iterator id="ldgbean" value="#session.lgdlist" status="i">
												<option 
													value="${ldgbean}">${ldgbean}</option>
											</s:iterator> 
											
										</select>
								
							</div>
						</div>
					</div> 
						<div class="col-sm-3">
							<div class="form-group">
								<label>Account Name</label><br/> 
									<input type="text" id="accountname"  
									autocomplete="off" class="form-control" />
							</div>
						</div>
						
					
				
				
			<!-- </div>
			/.modal-content
		</div>
		/.modal-dialog
	</div> -->
	<!-- /.modal -->

	
			<!-- <div class="row"> -->
				<!-- <div class="col-xs-3">
					<div class="form-group">
					</div>
				</div> -->
				<div class="col-xs-2">
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
							
				<div class="col-xs-2">
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
				</fieldset>
				</div>		
		<!-- </div> -->
	
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="abc">Account No</th>
						<th class="abc">Account Name</th>
						<th>Date</th>
						<th>Entry No</th>
						<th>Particulars</th>
						<th>Debit</th>
						<th>Credits</th>
						<th>Balance</th>
						<th>Type</th>
						<th class="abc">Member ID</th>
						
						 
						
					</tr>
				</thead>
				<tbody>
					<s:iterator id="ldgbean1" value="#session.ldgdetaillist" status="i">
						<tr>
							 
								
								<td class="abc">${ldgbean1.accountno}<input type="hidden"
								value="${ldgbean1.accountno}" /></td>
														
								<td class="abc">${ldgbean1.accountname}<input type="hidden"
								value="${ldgbean1.accountname}" /></td>														
															
								<td>${ldgbean1.date}<input type="hidden"
								value="${ldgbean1.date}" /></td>
								
								<td>${ldgbean1.entryNo}<input type="hidden"
								value="${ldgbean1.entryNo}" /></td>
								
								<td>${ldgbean1.particulars}<input type="hidden"
								value="${ldgbean1.particulars}" /></td>
								
								<td>${ldgbean1.debit}<input type="hidden"
								value="${ldgbean1.debit}" /></td>
								
								<td>${ldgbean1.credit}<input type="hidden"
								value="${ldgbean1.credit}" /></td>
								
								<td>${ldgbean1.balance}<input type="hidden"
								value="${ldgbean1.balance}" /></td>
								
									<td>${ldgbean1.type}<input type="hidden"
								value="${ldgbean1.type}" /></td>
								
									<td class="abc">${ldgbean1.memberId}<input type="hidden"
								value="${ldgbean1.memberId}" /></td>
								
								
								
								
								
								
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
	
	
		
		<script type="text/javascript">
		
		
		
				$(document).ready(function(){
											
				/* 	$("#new1").click(function(){
						$("#basicModal").modal('show');
						
					});	 */				
					  $(".rs-links").click(function(){
						var rowinfo = $(this).closest('tr').find('td').map(function () {
				        	return $(this).text();
				     	}).get();
						
						$("#updat").attr('data-id',rowinfo[0]); 
						$("#deleteval").attr('data-id',rowinfo[0]);
						$("#basicModal").modal('show');

				});
				});
				
				(function($) {
					$.widget("custom.combobox",
									{
						
										_create : function() {
											this.wrapper = $("<span>").addClass("custom-combobox").insertAfter(this.element);
											alert("starting");
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
																	alert("click acc no");
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
											alert("input"+input);

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
				$(function() {
					$("#combobox").combobox();
					$("#toggle").click(function(event) {
						$("#combobox").toggle();
					});

					$(".custom-combobox-input").change(function() {
						
						
						$.ajax({
							url : 'accname.action',
							dataType : "json",
							data : {accountno : $(".custom-combobox-input").val()},
							success : function(data) {
							
							var entityName=data.entityName;
							alert("ld"+entityName);
							var str = data.entityName.replace(/\"/g, "")
							
							$("#accountname").val(str);
							
							}
						});
					});

					$(".ui-widget").click(function() {
					
						$.ajax({
							url : 'accname.action',
							dataType : "json",
							data : {accountno : $(".custom-combobox-input").val()},
							success : function(data) {
							    var entityName=data.entityName;
								var str = data.entityName.replace(/\"/g, "")
								$("#accountname").val(str);
								
							}
						});
					});
				});
		</script>


</body>
</html>