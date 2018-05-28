<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% Integer number= (Integer)session.getAttribute("membersize"); %>

<%@ page import="com.entities.*, java.util.*,java.text.*"%>
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
</style>


</head>
<body>

	<!-- <fieldset>
		<legend>Deposit Report</legend>
	</fieldset> -->
	<div class="row">
		<fieldset class="scheduler-border">
			<legend class="scheduler-border">Passbook</legend>

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
				<br />
				<button type="button" class="btn btn-primary" id="show">Show</button>
			</div>

		</fieldset>
	</div>


	<div class="table-responsive" id="tableDiv">
		<div class="wraper">
			<!-- Begining -->
			<table border="1" id="jsonTable1"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>

						<th>Sl No</th>
						<th>Date</th>
						<th>Particulars</th>
						<th>Cheq No</th>
						<th>Withdraw</th>
						<th>Deposit</th>
						<th>Balance Amount</th>

					</tr>
				</thead>
				<tbody>
					<s:iterator id="passbookbean1" value="#session.passbooklist" status="i">
						<tr>
							 
								
								<td class="abc">${passbookbean1.accountno}<input type="hidden"
								value="${passbookbean1.accountno}" /></td>
														
								<td class="abc">${passbookbean1.accountname}<input type="hidden"
								value="${passbookbean1.accountname}" /></td>	
								
								<td>${passbookbean1.slno}<input type="hidden"
								value="${passbookbean1.slno}" /></td>													
															
								<td>${passbookbean1.date}<input type="hidden"
								value="${passbookbean1.date}" /></td>
								
								<td>${passbookbean1.particulars}<input type="hidden"
								value="${passbookbean1.particulars}" /></td>
								
								<td>${passbookbean1.cheqno}<input type="hidden"
								value="${passbookbean1.cheqno}" /></td>
								
								<td>${passbookbean1.withdraw}<input type="hidden"
								value="${passbookbean1.withdraw}" /></td>
								
								<td>${passbookbean1.deposit}<input type="hidden"
								value="${passbookbean1.deposit}" /></td>
								
								<td>${passbookbean1.balance}<input type="hidden"
								value="${passbookbean1.balance}" /></td>
								
								<td class="abc">${passbookbean1.memberId}<input type="hidden"
								value="${passbookbean1.memberId}" /></td>
								
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>
	<br />

	<div class="modal-footer">

		<button type="button" id="print" data-type='Print'
			class="btn btn-primary">Print</button>
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
