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
					<h4 class="modal-title" id="myModalLabel">Branch Information</h4>
				</div>
									
						
					<div class="modal-body">
						
						<div class="row">
						
							<div class="col-sm-3">
								<div class="form-group"> 
										<label  class="control-label">Bank Name</label> <input type="text" id="bankname" readonly="readonly"
										class="form-control" value="Padmashree Credit Co-operative Society Limited" placeholder="Padmashree Credit Co-operative Society Limited"/>
										</div>
							</div>
							<div class="col-sm-3">	
								<div class="form-group">
									<label>Bank Code</label> <input type="text" id="bankcode" readonly="readonly"
									class="form-control" value="PCCSL" placeholder="PCCSL"/>
							</div>
						</div>
						
						
						<div class="col-sm-3">
									<div class="form-group">
										<label>Branch Name</label> <select id="branchname"
										class="form-control">
										<option value="PCCSL Main Branch">PCCSL Main Branch</option>
										</select>
									</div>
							 	</div>
								<div class="col-sm-3">	
									<div class="form-group">
										<label>Branch Code</label> <select id="branchcode"
										class="form-control">
										<option value="PCCSLMB">PCCSLMB</option>
										</select>
									</div>
								</div>
						
						<%-- <div class="col-sm-4">
									<div class="form-group">
										<label>Branch Name</label> <select id="bankname" value="${branchname}"
										  autocomplete="off" class="form-control">
										<option value="PCCSL Main Branch">PCCSL Main Branch</option>
										</select>
									</div>
							 	</div>
								<div class="col-sm-4">	
									<div class="form-group">
										<label>Branch Code</label> <select id="bankcode" 
										class="form-control">
										<option value="PCCSLMB">PCCSLMB</option>
										</select>
									</div>
								</div> --%>
							   
						
						<!-- <div class="col-sm-3">
						<div class="form-group">
							<label>Branch Name</label> <input type="text" id="PCCSL Main Branch" readonly="readonly"
								autocomplete="off" class="form-control" value="PCCSL Main Branch" placeholder="PCCSL Main Branch"/>
						</div>
					</div>
						
						<div class="col-sm-3">
						<div class="form-group">
							<label>Branch Code</label> <input type="text" id="PCCSLMB" readonly="readonly"
								autocomplete="off" class="form-control" value="PCCSLMB" placeholder="PCCSLMB"/>
						</div>
					</div> -->
						
					</div>
								
					<div class="row">
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Branch Address</legend>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Address1</label><input type="text" class="form-control" id="address1"/> 
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Address2</label><input type="text" class="form-control" id="address2"/>
								</div> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Address3</label><input type="text" class="form-control" id="address3"/> 
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Address4</label><input type="text" class="form-control" id="address4"/> 
								</div>
							</div>
						</div>
									
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">City/Village</label><input type="text" class="form-control" id="city"/>
								</div> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">District</label><input type="text" class="form-control" id="district"/>
								</div> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
									<label class="control-label">State</label><input type="text" class="form-control" id="state"/>
									</div> 
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Pin</label><input type="text" class="form-control" id="pin" maxlength="6"/>
								</div> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Contact Number</label><input type="text" class="form-control" id="contactnumber" maxlength="10"/>
								</div> 
							</div>
						</div>
						</fieldset>
					</div>
						
				<div class="modal-footer">
					
					<button type="button" id="save" data-type='New'
						class="btn btn-primary">Save</button>
					<!-- <button type="button" id="cancel" data-type='New'
						class="btn btn-primary">Cancel</button> -->
				</div>
			</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	
							
			
	
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						
						 <th>Id</th>
						<th>Bank Name</th>
						<th>Bank Code</th>
						<th>Branch Name</th>
						<th>Branch Code</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator id="branchbean" value="#session.brlist" status="i">
						<tr>
							
							<td>${branchbean.id}<input type="hidden"
								value="${branchbean.id}" /></td>
								
							  <td>${branchbean.bankname}<input type="hidden"
								value="${branchbean.bankname}" /></td>
								
								<td>${branchbean.bankcode}<input type="hidden"
								value="${branchbean.bankcode}" /></td>
								
								<td>${branchbean.branchname}<input type="hidden"
								value="${branchbean.branchname}" /></td>
								
								<td>${branchbean.branchcode}<input type="hidden"
								value="${branchbean.branchcode}" /></td>
									
						</tr>
					</s:iterator> 
				</tbody>
			</table>
		</div>
		</div>
	<input type="button" class="rs-links" id="new5" value="NEW" />
			
		
		<script type="text/javascript">

				$(document).ready(function(){
											
				 	$("#new5").click(function(){
						$("#basicModal").modal('show');
						
					});	 	
					/* $(".rs-links").click(function(){
						var rowinfo = $(this).closest('tr').find('td').map(function () {
				        	return $(this).text();
				     	}).get();
						
						$("#updat").attr('data-id',rowinfo[0]); 
						$("#deleteval").attr('data-id',rowinfo[0]);
						$("#basicModal").modal('show'); */	
						
						$("#save").click(function(){
						alert('Hello');
						var bankname = $.trim($('#bankname').val());
						var bankcode = $.trim($('#bankcode').val());
						var branchname = $.trim($('#branchname').val());
						var branchcode = $.trim($('#branchcode').val());
						var address1 = $.trim($('#address1').val());
						var address2 = $.trim($('#address2').val());
						var address3 = $.trim($('#address3').val());
						var address4 = $.trim($('#address4').val());
						var city = $.trim($('#city').val());
						var district = $.trim($('#district').val());
						var state = $.trim($('#state').val());
						var pin = $.trim($('#pin').val());
						var contactnumber = $.trim($('#contactnumber').val());
						
						if($.trim(bankname).length == 0) {
					    	alert("Provide bankname");
					    }
						else if($.trim(bankcode).length == 0) {
					    	alert("Provide bankcode");
					    }
						else if($.trim(branchname).length == 0) {
					    	alert("Provide branchname");
					    }
						else if($.trim(branchcode).length == 0) {
					    	alert("Provide branchcode");
					    }
						else if($.trim(address1).length == 0) {
					    	alert("Provide address1");
					    }
						else if($.trim(address2).length == 0) {
					    	alert("Provide address2");
					    }
						else if($.trim(address3).length == 0) {
					    	alert("Provide address3");
					    }
						else if($.trim(address4).length == 0) {
					    	alert("Provide address4");
					    }
						else if($.trim(city).length == 0) {
					    	alert("Provide city");
					    }
						else if($.trim(district).length == 0) {
					    	alert("Provide district");
					    }
						else if($.trim(state).length == 0) {
					    	alert("Provide state");
					    }
						else if($.trim(pin).length == 0) {
					    	alert("Provide pin");
					    }
						else if($.trim(contactnumber).length == 0) {
					    	alert("Provide contactnumber");
					    }
						
						else {
						
									var parms = {
										
										bankname : bankname,
										bankcode : bankcode,
										branchname : branchname,
										branchcode : branchcode,
										address1 : address1,
										address2 : address2,
										address3 : address3,
										address4 : address4,
										city : city,
										district : district,
										state : state,
										pin : pin,
										contactnumber : contactnumber,
										};
											$.ajax({
												type : "POST",
												url : "branchInfo.action",
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
						
						
						
						
						$("#cancel").click(function(){	
						alert('cancel');
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
				
				$('#basicModal').modal({
				    backdrop: 'static',
				    keyboard: false
				})
				
</script>

	
</body>
</html>