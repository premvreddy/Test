<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 
<%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"  %>

<s:set name="receiptnumber" value="#session.transnumberinc" />


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
       .form-control1 {
    	border: 0;
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
.table > tbody > tr > td
{
padding:4px;
}

</style>
</head>
<body>
				<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<label>Branch Name</label> <select id="bankname"
										class="form-control">
										<option value="PCCSL Main Branch">PCCSL Main Branch</option>
										</select>
									</div>
							 	</div>
								<div class="col-sm-3">	
									<div class="form-group">
										<label>Branch Code</label> <select id="bankcode"
										class="form-control">
										<option value="PCCSLMB">PCCSLMB</option>
										</select>
									</div>
								</div>
							<div class="col-sm-2">
								<div class="form-group">
								
							</div>
							</div>
								   
						
					</div>
						<div class="row">
						<fieldset  class="scheduler-border">
							<legend  class="scheduler-border">Journal</legend>
							
								<div class="col-sm-3">	
									<div class="form-group">
									<label>Trans Number</label> <input type="text" id="tNumber"  
									autocomplete="off" class="form-control" />
									</div>
								</div>
								<div class="col-xs-3">
									<div class="form-group">
										<div class='input-group date'  data-provide="datepicker"
											data-date-autoclose="true" data-date-today-btn="linked"
														 data-date-today-highlight="true"
														data-date-format="dd.mm.yyyy">
														<label>Trans Date</label><input  id="tDate" class="form-control date"
														value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
														<span class="input-group-addon"><span
															class="icon icon-calendar"></span> </span>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label>Account Type</label> <select id="tType"
											class="form-control">
											<option value="Select">Select</option>
											<option value="Transfer">Transfer</option>
											<option value="Adjustment">Adjustment</option>
											<option value="Other">Other</option>
										</select>
									</div>
								</div>
						</fieldset>
					</div>
						
					
					
					
					<div class="row">
						
					<div class="ui-widget">
						<div class="col-sm-3">
							<div class="form-group">
								<label>Account Number</label><br/>
								<select placeholder="AccountNumber" id="combobox" >
									<option value="" selected="selected">Account No</option>
											<s:iterator id="conbean" value="#session.journallist1" status="i">
												<%-- <option value="${(conbean.accountno).concat(conbean.getName())}">${(conbean.accountno).concat(conbean.getName())}</option> --%>
											 <option value="${(conbean.name).concat(conbean.getAccountno())}">${(conbean.name).concat(conbean.getAccountno())}</option> 
											
											
											</s:iterator>
										</select>
								
							</div>
						</div>
					</div> 
								<div class="col-sm-2">
									<div class="form-group">
										<label>Ref</label> <input type="text" id="reference"  
											autocomplete="off" class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Debit</label> <input type="text" id="debit"  
											class="form-control" />
									</div>
								</div>
					
								<div class="col-sm-2">
									<div class="form-group">
										<label>Credit</label> <input type="text" id="credit" 
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Narration</label> <input type="text" id="narration"
											class="form-control" />
									</div>
								</div><br/>
								<button type="button" id="insert" data-type='New'
									class="btn btn-primary">Insert</button>
						
							</div><br/>
							
							
							<div class="row">
								<div class="table-responsive" id="tableDiv" >
									<div class="wraper">
										<!-- Begining -->
										<table border="1"  id="jsonTable1"
											class="table table-striped table-bordered table-hover">
											<thead>
											<tr>
												<th class="abc">ID</th>
												<th>Transaction Number</th>
												<th>Account Number</th>
								                <th>Reference</th>
												<th>Debit</th>
												<th>Credit</th>
												<th>Narration</th>
												<th class="abc">Bank Name</th>
												<th class="abc">Bank Code</th>
												<th class="abc">Transaction Date</th>
												<th class="abc">Transaction Type</th>
												<th>Action</th>
												</tr>
											</thead>
											<tbody>
											<s:iterator id="journalbean" value="#session.journallist" status="i">
													<tr>
													
														<td class="abc">${journalbean.id}<input type="hidden"
															value="${journalbean.id}" /></td>
															
														 <td>${journalbean.tNumber}<input type="hidden"
															value="${journalbean.tNumber}" /></td>
																							
														  <td>${journalbean.accountno}<input type="hidden"
															value="${journalbean.accountno}" /></td>
															
															<td>${journalbean.reference}<input type="hidden"
															value="${journalbean.reference}" /></td>
															
															<td>${journalbean.debit}<input type="hidden"
															value="${journalbean.debit}" /></td>
															
															<td>${journalbean.credit}<input type="hidden"
															value="${journalbean.credit}" /></td> 
															
															<td>${journalbean.narration}<input type="hidden"
															value="${journalbean.narration}" /></td>
															
															<td class="abc">${journalbean.bankname}<input type="hidden"
															value="${journalbean.bankname}" /></td>
															
															<td class="abc">${journalbean.bankcode}<input type="hidden"
															value="${journalbean.bankcode}" /></td>
															
															<td class="abc">${journalbean.date}<input type="hidden"
															value="${journalbean.date}" /></td>
															
															<td class="abc">${journalbean.tType}<input type="hidden"
															value="${journalbean.tType}" /></td>
															
															<td><input type="button" id="delete"
															value="delete"  class="deletee"/></td>
															
													</tr>
											</s:iterator>
											</tbody>
										</table>
									</div>
								</div>
							</div><br/>
						     <div class="row">
								<div class="col-sm-4">
										<div class="form-group" align="center">
										<s:iterator id="journalBeans" value="#session.journallist" status="i">
				                          <c:set var="crtotal" value="${crtotal + journalBeans.credit}" />
				                          <c:set var="drtotal" value="${drtotal + journalBeans.debit}" />
			                               </s:iterator>
											<label>Total</label> 
										</div>
								</div>
								<div class="col-sm-4">
								<label for="dbt">Debit</label>
									<div class="form-group">
												 <input type="text" id="dbt" class="form-control1 no-border"
												name="debit"	class="form-control" value=${drtotal} />
									</div>
									
								</div>
								<div class="col-sm-4">
								<label for="crd">Credit</label>
									<div class="form-group">
												<input type="text" id="crd" class="form-control1 no-border" name="credit"
													class="form-control" value=${crtotal} />
										</div>
											
								</div>
							</div>	
							<div class="row">		
								<div class="col-sm-6">
									<div class="form-group" align="center">
												
									</div>
								</div>
								<div class="col-sm-6">
									<label for="diff">Difference</label> 
									<div class="form-group">
												<input type="text" id="diff" class="form-control1 no-border"
													class="form-control" value=${crtotal-drtotal} />
										</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button"  id="submit"  data-type='New'
									class="btn btn-primary">Submit</button>
							</div>
						      
<script type="text/javascript">

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
/* $(document).ready(function(){
		
		$("#debit").change(function() {
			
			if ($("#debit").val().length == 0) {
				$('#credit').attr('disabled', false);
			} else {
				$('#credit').attr('disabled', true);
			}
		});
		
		$("#credit").change(function() {
			
			if ($("#credit").val().length == 0) {
				$('#debit').attr('disabled', false);
			} else {
				$('#debit').attr('disabled', true);

			}
		});
		
		var difference=${crtotal-drtotal};
		if(difference==0)
			{
			$('#submit').prop('disabled', false);
			}
		else
			{
			$('#submit').prop('disabled', true);
		}
	
	 */
		
 $('#insert').click(function(){

var tNumber = $('#tNumber').val();
var accountno= $('#combobox').val();
var reference= $('#reference').val();
var debit= $('#debit').val();
var credit = $('#credit').val();
var narration = $('#narration').val();
var bankname = $('#bankname').val();
var bankcode = $('#bankcode').val();
var tDate = $('#tDate').val();
var tType = $('#tType').val();

			var parms = {
				
				tNumber : tNumber,
				accountno : accountno,
				reference : reference,
				debit : debit,
				credit : credit,
				narration : narration,
				bankname : bankname,
				bankcode : bankcode,
				date : tDate,
				tType : tType,
				
				};
					$.ajax({
						type : "POST",
						url : "DraftJournal.action",
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
									
									$("#addjournal").trigger('click');
									$("#tNumber,.custom-combobox-input,#reference,#debit,#credit,#narration").val("");
									
									}
							}
						});
					
			});
  
 
 
  /*  $('#submit').keyup(
			function() {
				$.ajax({
					
					url : 'transnumber.action',
					dataType : "json",
					success : function(data) {
						var abc = "JEC-";

						var d = new Date();
						var today_date = ("0" + d.getDate()).slice(-2)
								+ ("0" + (d.getMonth() + "/")).slice(-2)
								+ d.getFullYear();
						var number = '${transnumber}';
						alert("jsp apge"+number);
						$("#tNumber").val(
								abc + "-" + today_date + "-" + number + slno);
						

					}
				});
			});  */


		$("#submit").click(function(){
				$.ajax({
					url : 'receiptnumber.action',
					dataType : "json",
					success : function(data) {
						var abc = "JEC";

						var d = new Date();
						var today_date = ("0" + d.getDate()).slice(-2)
								+ ("0" + (d.getMonth() + 1)).slice(-2)
								+ d.getFullYear();
						var number = '${receiptnumber}';
						$("#tNumber").val(
								abc + "-" + today_date + "-" + number);

					}
				});
			}); 
			
   
		
		$(".deletee").click(function(){
		var rowinfo = $(this).closest('tr').find('td').map(function () {
				        	return $(this).text();
				     	}).get();
	                   $(".deletee").attr('data-id',rowinfo[0]);
				        var id = $(this).attr('data-id');
				        alert(id);
				        var accountno = $("#accountno").val();
					$.ajax({
							url: 'journaldelete.action',
							data: {id: id,
								   accountno:accountno},
							success: function(data) {
								var errorString = data.errorString;
								var resultString = data.resultString;
								if(resultString == "error") {
									$("#loading").hide();
									alert(errorString);
									return;
								} else {
                                        						
										var address = "Journal.jsp?Time="+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
										$('#workarea').html(data);
										$('#jsonTable').dataTable();
									}
								});
								}
							}
						});  
				}); 
		
								
</script>


</body>
</html> 

