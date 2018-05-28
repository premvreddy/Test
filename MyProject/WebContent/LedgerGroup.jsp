<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<s:set name="branchname" value="#session.branchname"/>
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
					<h4 class="modal-title" id="myModalLabel">Ledger Group</h4>
				</div>
									
						
					<div class="modal-body">
						
						<div class="row">
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Ledger_Group</legend>
							
							<%-- <div class="col-sm-4">
							<div class="form-group">
								<label>Bank Name</label> <select id="bankname"
									class="form-control">
									<option value="Padmashree Credit Co-operative Society Limited">Padmashree Credit Co-operative Society Limited</option>
									</select>
							</div>
						</div> --%>
							
							
							<div class="col-sm-4">
									<div class="form-group">
										<label>Branch Name</label> <select id="branchname" value="${branchname}"
										  autocomplete="off" class="form-control">
										<option value="PCCSL Main Branch">PCCSL Main Branch</option>
										</select>
									</div>
							 	</div>
								<div class="col-sm-4">	
									<div class="form-group">
										<label>Branch Code</label> <select id="branchcode" 
										class="form-control">
										<option value="PCCSLMB">PCCSLMB</option>
										</select>
									</div>
								</div>
							
							
						<%-- <div class="col-sm-4">
									<div class="form-group">
										<label>Branch Name</label><input type="text" id="branchname" value="${branchname}"
								        autocomplete="off" class="form-control" />
									</div>
							 	</div>
							 
							<div class="col-sm-4">	
								<div class="form-group">
									<label>Bank Code</label> <select id="bankcode"
									class="form-control">
									<option value="PCCSL">PCCSL</option>
									</select>
							</div>
						</div> --%>
						
						<div class="col-sm-4">
							<div class="form-group">
								<label>Group Name</label> <input type="text" id="groupname"
									class="form-control" />
							</div>
						</div>
					<div class="ui-widget">
						<div class="col-sm-4">
							<div class="form-group">
								 <label>SubGroupName</label> <select placeholder="SubGroupName" id="combobox" >
									<option value="" selected="selected">SubGroupName</option>
											<s:iterator id="groupbean" value="#session.lglist" status="i">
												<option data-maingroup='${groupbean.maingroup}'
													value="${groupbean.groupname}">${groupbean.groupname}</option>
											</s:iterator>
										</select>
								
							</div>
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
								<label>Group Code</label> <input type="text" id="groupcode"
									class="form-control" />
							</div>
						</div>
							
						</fieldset>
					</div>	
		</div>
				<div class="modal-footer">
					
					<button type="button" id="addNewUser" data-type='New'
						class="btn btn-primary">Save</button>
					<!-- <button type="button" id="update" data-type='New'
						class="btn btn-primary">update</button>-->
					<!-- <button type="button" id="deleteRow" data-type='New'
						class="btn btn-primary">Cancel</button>  -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<fieldset>
		<legend>
			Ledger Group 
		</legend>
	</fieldset>
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						 <th>LG ID</th> 
						<th>Branch Name</th>
						<th>Branch Code</th>
						<th>Group Name</th>
						<th>SubGroup Name</th>
						<th>Main Group</th>
						<th>Group Code</th>
					
					</tr>
				</thead>
				<tbody>
					<s:iterator id="groupbean" value="#session.lglist" status="i">
						<tr>
							
							<td>${groupbean.id}<input type="hidden"
								value="${groupbean.id}" /></td>
								
							  <td>${groupbean.branchname}<input type="hidden"
								value="${groupbean.branchname}" /></td>
								
								<td>${groupbean.branchcode}<input type="hidden"
								value="${groupbean.branchcode}" /></td>
								
								<td>${groupbean.groupname}<input type="hidden"
								value="${groupbean.groupname}" /></td>
								
								<td>${groupbean.subgroupname}<input type="hidden"
								value="${groupbean.subgroupname}" /></td>
								
								<td>${groupbean.maingroup}<input type="hidden"
								value="${groupbean.maingroup}" /></td>
								
								<td>${groupbean.groupcode}<input type="hidden"
								value="${groupbean.groupcode}" /></td>
								
						
						</tr>
					</s:iterator> 
				</tbody>
			</table>
		</div>
		</div>
	<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">
	NEW
	</button>
	
	<!-- <input type="button"  id="new" value="NEW" /> -->
		<script type="text/javascript">
				
		$(document).ready(function(){
					
		
					$("#new").click(function(){
						var rowinfo = $(this).closest('tr').find('td').map(function () {
				        	return $(this).text();
				     	}).get();
						
						$("#basicModal").modal('show');
						$("#branchname").val(rowinfo[1]);
						$("#branchcode").val(rowinfo[2]);
					    $("#groupname").val(rowinfo[3]);
						$("#combobox").val(rowinfo[4]);
						$("#maingroup").val(rowinfo[5]);
						$("#groupcode").val(rowinfo[6]);
						
					});
					
				
					$("#addNewUser").click(function() {
						
						var branchname = $.trim($('#branchname').val());
						var branchcode = $.trim($('#branchcode').val());
						var groupname = $.trim($('#groupname').val());
						var subgroupname = $.trim($('#combobox').val());
						var maingroup = $.trim($('#maingroup').val());
						var groupcode = $.trim($('#groupcode').val());
						
						if($.trim(groupname).length == 0) {
					    	alert("Provide groupname");
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
					    
						else {
									var parms = {
										
										branchname : branchname,
										branchcode : branchcode,
										groupname : groupname,
										subgroupname : subgroupname,
										maingroup : maingroup,
										groupcode : groupcode,
										};
											$.ajax({
												type : "POST",
												url : "ledgergroup.action",
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
					$("#toggle").click(function() {
						$("#combobox").toggle();
					});

					$(".custom-combobox-input").change(function() {
						alert('fffff');
						$.ajax({
							url : 'subname.action',
							dataType : "json",
							data : {groupname : $(".custom-combobox-input").val()},
							success : function(data) {
								$("#maingroup").val(data.maingroup);
							}
						});
					});

					$(".custom-combobox-toggle").click(function() {
						$.ajax({
							url : 'subname.action',
							dataType : "json",
							data : {groupname : $(".custom-combobox-input").val()},
							success : function(data) {
							   	var str = data.maingroup.replace(/\"/g, "");
								$("#maingroup").val(str);
								$(".custom-combobox-input").on('focusout', function() {
                                 $(".custom-combobox-toggle").trigger("click"); 
                               });
							}
						});
								
					});
				});
				
				 $("body").on('focusout',"#groupname",function(){
						var size=${groupbean.id} + 1 ;
						size= "LG-"+size;
						$("#groupcode").val(size);
							
						});
					
					$("#subgroupname").change(
							function() {
								var mainGroup = $(this).find('option:selected').attr('data-maingroup');
								$("#maingroup").val(mainGroup);
							});
					
					 
		</script>

</body>
</html>