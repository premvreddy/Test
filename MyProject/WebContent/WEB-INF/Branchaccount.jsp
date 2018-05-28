<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<%-- <script src="scripts/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bs_leftnavi.css">
<script src="scripts/bs_leftnavi.js"></script>
<script src="scripts/jquery.dataTables.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="scripts/sha3.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="scripts/metisMenu.min.js"></script>
<script type="text/javascript" src="scripts/bootstrap-datepicker.js"></script> --%>

<!-- Morris Charts JavaScript -->
<!-- Custom Theme JavaScript -->
<%-- <script src="scripts/sb-admin-2.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">

<style type="text/css"> --%>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">

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
<title>Insert title here</title>
</head>
<body>
	<div class="row">

		<fieldset class="scheduler-border">
			<legend class="scheduler-border">ACCOUNT Details</legend>
		</fieldset>
	</div>

	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelled by="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>


                 
				<div class="modal-body">
					<div class="row">
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">BRANCH ACCOUNT DETAILS</legend>
							
							<div class="ui-widget">
							<div class="col-sm-5">
								<div class="form group">
									<label> BankName</label> <select placeholder="bankname" id="combobox" >
									<option value="" selected="selected">Bankname</option>
								 	<s:iterator id="groupbean" value="#session.accountlist" status="i">
												<option
													value="${groupbean.bankname}">${groupbean.bankname}</option>
											</s:iterator>
										</select> 
								</div>
							</div>
							</div>

							<div class="col-sm-5">
								<div class="form group">
									<label> Bankcode</label> <input type="text" id="bankcode"
										class="form-control" />


								</div>
							</div>
							
							
			

							<div class="col-sm-5">
								<div class="form group">
									<label> Bankaddress</label> <input type="text" id="bankaddress"
										class="form-control" />
								</div>
								
							</div>
							
						</fieldset>
					</div>
						
				</div>


				<div class="modal-footer">
					<input type="button" id="save" class="btn btn-primary" value="Save" />
					<input type="button" id="update" class="btn btn-primary"
						value="update" />
						 <input type="button" id="delete"
						class="btn btn-primary" value="delete" />
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<div class="table-responsive" id="tableDiv">
		<table border="1" id="jsonTable"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>id</th>
					<th>bankname</th>
					<th>bankcode</th>
					<th>bankaddress</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="groupbean" value="#session.accountlist">
					<tr>
						<td>${groupbean.id}<input type="hidden"
							value="${groupbean.id}" /></td>

						<td class="dw-links"><a href="#">${groupbean.bankname}</a><input
							type="hidden" value="${groupbean.bankname}" /></td>


						<td>${groupbean.bankcode}<input type="hidden"
							value="${groupbean.bankcode}" /></td>

						<td>${groupbean.bankaddress}<input type="hidden"
							value="${groupbean.bankaddress}" /></td>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<input type="button" class="dw-links" id="new" value="NEW" />
	<script type="text/javascript">
$("#save").click(function(){
	alert("suhfh");
	var bankname = $('#bankname').val();
	var bankcode = $('#bankcode').val();
	var bankaddress = $('#bankaddress').val();
	var parms = {
			
			bankname : bankname,
			bankcode : bankcode,
			bankaddress : bankaddress
	};
			$.ajax({
				type : "POST",
				url : "accoundetail.action",
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
	
	
$(document).ready(function(){
	$(".dw-links").click(function(){
		var rowinfo = $(this).closest('tr').find('td').map(function () {
        	return $(this).text();
     	}).get();
		$("#update").attr('data-id',rowinfo[0]);
		$("#basicModal").modal('show');
		$("#bankname").val(rowinfo[1]);
		$("#bankcode").val(rowinfo[2]);
		$("#bankaddress").val(rowinfo[3]);
		
});


	
	$("#update").click(function(){
		alert("hiii");
		var rowId1 = {id: $(this).attr('data-id'),
				
				 bankname : $("#bankname").val(),
				 bankcode : $("#bankcode").val(),
				 bankaddress : $("#bankaddress").val(),
		}
		 $.ajax({
				url: "updateaccount.action",
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
	$("#delete").click(function(){
		
		//alert('Hello');
		var id = $(this).attr('data-id');
		var bankname = $("#bankname").val();
		
		$.ajax({
				url: 'deleteuser.action',
				data: {id: id,
					bankname : bankname},
				success: function(data) {
					var errorString = data.errorString;
					var resultString = data.resultString;
					alert(resultString);
					if(resultString == "error") {
						$("#loading").hide();
						alert(errorString);
						return;
					} else {
						window.location.href = "index.jsp";
						
					}
				}
			});  
		
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
});
	
	


</script>

</body>
</html>