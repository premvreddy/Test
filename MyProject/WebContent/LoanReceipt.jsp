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
					<h4 class="modal-title" id="myModalLabel">Loan Payment
						Application</h4>
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
									<label>Recipt Date </label><input  id="Date" class="form-control date" 
									value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
									 <span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span> 
									</div>
									</div>
									</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class="control-label"> LRec No</label> <input
										type="text" readonly="readonly" id="lrec" class="form-control">
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label class="control-label"> Account No</label> <input
										type="text" id="accountno" class="form-control">
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Account Holder Name</label><br /> <select
										placeholder="AccountHolder" id="combobox">
										<option value="" selected="selected">Account Holder</option>
										
									</select>
								</div>
							</div>

							
						<div class="col-xs-3">
			<div class="form-group">
			<div class='input-group date'  data-provide="datepicker"
				data-date-autoclose="true" data-date-today-btn="linked"
										 data-date-today-highlight="true"
										data-date-format="dd.mm.yyyy">
									<label>Last Recipt Date </label><input  id="Date" class="form-control date" readonly="readonly" 
									value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
									 <span class="input-group-addon"><span
											class="icon icon-calendar"  ></span> </span> 
									</div>
									</div>
									</div>
					</div>
					
					
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Total No. of Day</label> <input
									type="text" id="days" class="form-control">
							</div>
						</div>

						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label"> Total amount</label> <input
									type="text" id="totalamount" class="form-control">
							</div>
						</div>

						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label"></label>Principal Amount <input type="text" id="principalamt"
									autocomplete="off" class="form-control" />
							</div>
						</div>

						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Int.,Amt.,</label> <input
									type="text" id="intamt" autocomplete="off" class="form-control" />
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Pnl., Int.,</label> <input
									type="text" id="penalint" autocomplete="off"
									class="form-control" />
							</div>
						</div>

						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">Penal Int., Amt.,</label> <input
									type="text" id="penalintamt" autocomplete="off"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label> Remarks</label>
								<textarea class="form-control" id="remarks"></textarea>
							</div>
						</div>

					</div>

					</fieldset>
				</div>

				<div class="modal-footer">
					<input type="button" id="submit" class="btn btn-primary"
						value="Submit" />
				</div>
</div>
			</div>
		</div>
	</div>


	<fieldset>
		<legend> Loan Receipt </legend>
	</fieldset>
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
						<th>LRec No</th>
						<th>totalamount</th>
						<th>Account No</th>
						<th>Principal Amount</th>
						<th>Remarks</th>
					

					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	



	<button type="button" data-toggle="modal" data-target="#basicModal"
		data-backdrop="static" data-keyboard="false">NEW</button>
	<!-- <input type="button" class="rs-links" id="new1" value="NEW" /> -->

	<%-- 	<input type="hidden" id="membersize" value="<%=session.getAttribute("membersize") %>" />	 --%>

	<script type="text/javascript">
		$(document).ready(function() {

			/* 	$("#new1").click(function(){
					$("#basicModal").modal('show');
					
				});	 */

			$("#addNewUser").click(function() {

				var date = $.trim($('#date').val());
				/* var lrec = $.trim($('#lrec').val());
				var accountno = $.trim($('#accountno').val());
				var combobox = $.trim($('#combobox').val());
				var receiptdate = $.trim($('#receiptdate').val());
				var days = $.trim($('#days').val());
				var totalamount = $.trim($('#totalamount').val());
				var principalamt = $.trim($('#principalamt').val());
				var intamt = $.trim($('#intamt').val());
				var penalint = $.trim($('#penalint').val());
				var penalintamt = $.trim($('#penalintamt').val());
				var remarks = $.trim($('#remarks').val()); */

				if ($.trim(date).length == 0) {
					alert("Provide Date");
				}
				/*  else if($.trim(memberid).length == 0) {
				    	alert("Provide Member ID");
				    }   
				 */

				else {
					var parms = {

						date : date,
					/* 	lrec : lrec,
						accountno : accountno,
						combobox : combobox,
						receiptdate : receiptdate,
						days : days,
						totalamount : totalamount,
						principalamt : principalamt,
						intamt : intamt,
						penalint : penalint,
						penalintamt : penalintamt,
						remarks : remarks, */
					};
					$.ajax({
						type : "POST",
						url : "receipt.action",
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
		/* $("body").on('click',"#addNewUser",function(){
			var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
			memberSize= "LRec.No-"+membersize;
			$("#lrec").val(memberSize); 
							
			});*/
		(function($) {
			$
					.widget(
							"custom.combobox",
							{
								_create : function() {
									this.wrapper = $("<span>").addClass(
											"custom-combobox").insertAfter(
											this.element);
									this.element.hide();
									this._createAutocomplete();
									this._createShowAllButton();
									this.input.attr("placeholder", this.element
											.attr('placeholder'));
								},

								_createAutocomplete : function() {
									var selected = this.element
											.children(":selected"), value = selected
											.val() ? selected.text() : "";
									this.input = $("<input>")
											.appendTo(this.wrapper)
											.val(value)
											.attr("title", "")
											.addClass(
													"custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
											.autocomplete(
													{
														delay : 0,
														minLength : 0,
														source : $.proxy(this,
																"_source")
													})
											.tooltip(
													{
														tooltipClass : "ui-state-highlight"
													});

									this
											._on(
													this.input,
													{
														autocompleteselect : function(
																event, ui) {
															ui.item.option.selected = true;
															this
																	._trigger(
																			"select",
																			event,
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
									var matcher = new RegExp($.ui.autocomplete
											.escapeRegex(request.term), "i");
									response(this.element
											.children("option")
											.map(
													function() {
														var text = $(this)
																.text();
														if (this.value
																&& (!request.term || matcher
																		.test(text)))
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
									var value = this.input.val(), valueLowerCase = value
											.toLowerCase(), valid = false;
									this.element
											.children("option")
											.each(
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
									this.input.val("").attr("title",
											value + " didn't match any item")
											.tooltip("open");
									this.element.val("");
									this._delay(function() {
										this.input.tooltip("close").attr(
												"title", "");
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
			$("#toggle").click(function() {
				$("#combobox").toggle();
			});

			$(".custom-combobox-input").change(function(event) {
				//alert('fffff');
				$.ajax({
					url : 'member.action',
					dataType : "json",
					data : {
						accountno : $(".custom-combobox-input").val()
					},
					success : function(data) {

						var entityName = data.entityName;
						var entityName2 = data.entityName2;
						var entityName3 = data.entityName3;
						var str = data.entityName.replace(/\"/g, "")
						var str1 = data.entityName2.replace(/\"/g, "")

						$("#accountname").val(str);
						$("#cell").val(data.entityName3);
						$("#address").val(str1);

					}
				});
			});

			$(".ui-widget").click(function() {
				//alert('Helloooooo');
				$.ajax({
					url : 'member.action',
					dataType : "json",
					data : {
						accountno : $(".custom-combobox-input").val()
					},
					success : function(data) {

						var entityName = data.entityName;
						var entityName2 = data.entityName2;
						var entityName3 = data.entityName3;
						var str = data.entityName.replace(/\"/g, "")
						var str1 = data.entityName2.replace(/\"/g, "")

						$("#accountname").val(str);
						$("#cell").val(data.entityName3);
						$("#address").val(str1);

					}
				});
			});
		});
	</script>


</body>
</html>





