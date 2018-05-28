<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <% Integer number= (Integer)session.getAttribute("membersize"); %> --%>
<%-- <% Integer autoincrement=number+2 ;%> --%> 

<%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"  %>
 <%-- <% Integer number= (Integer)session.getAttribute("membersize"); %>  --%>
<s:set name="" value="" />

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

      /* this original for Autocomplete Combobox */
	.ui-button { margin-left: -1px; }
	.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
	.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }

        /* *** Add this for visible Scrolling ;) */

        .ui-autocomplete {
		max-height: 350px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 20px;
	}
	/* IE 6 doesn't support max-height
	 * we use height instead, but this forces the menu to always be this tall
	 */
	* html .ui-autocomplete {
		height: 100px;
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
					<h4 class="modal-title" id="myModalLabel">Fixed Deposit Application</h4>
				</div>
									
						
					<div class="modal-body">
					
	
							<fieldset class="scheduler-border">

						<legend class="scheduler-border">Fixed Deposit</legend>
						
						<div class="row">
					<div class="col-xs-3">
						
			    <div class="form-group">
			        <div class='input-group date'  data-provide="datepicker"
			            	data-date-autoclose="true" data-date-today-btn="linked"
										 data-date-today-highlight="true"
										data-date-format="dd.mm.yyyy">
										<label> Date </label><input  id="tDate" class="form-control date"
										value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span>
									</div>
							</div>
					</div>	
					
					<!-- <div class="col-sm-3">
						<div class="form-group">
							<div class="form-group required">
								<label class="control-label"> Member id</label> <input type="text"
									id="memberid" class="form-control">
							</div>
						</div>
					</div>		 -->
					
				<div class="ui-widget">
				<div class="col-sm-3">
					<div class="form-group">
						<label>MemberId</label><br/> <select placeholder="MemberId"
							id="combobox">
							<option value="" selected="selected"></option>
                               <s:iterator id="personalbean"
												value="#session.personalacclist" status="i">
												<option value="${personalbean}">${personalbean}</option>
											</s:iterator>
											<s:iterator id="personalbean"
												value="#session.personalacclist1" status="i">
												<option value="${personalbean}">${personalbean}</option>
											</s:iterator>
											<s:iterator id="personalbean"
												value="#session.personalacclist2" status="i">
												<option value="${personalbean}">${personalbean}</option>
											</s:iterator>
											
						</select>
					</div>
				</div>
			</div>
						
					<div class="col-sm-3">
						<div class="form-group">
							<div class="form-group required">
								<label > Deposit Type</label> <select id="deposittype" class="form-control">
								<option value="Fixed Deposit"> Fixed Deposit</option>
								<option value="Term Deposit"> Term Deposit</option>
								</select>
							</div>
						</div>
					</div>		
							
					<div class="col-sm-3">
						<div class="form-group">
							<div class="form-group required">
								<label class="control-label">FD Account No</label> <input type="text"  readonly="readonly"
									id="accountno" class="form-control">
							</div>
						</div>
					</div>		
					</div>
					<div class="row">
					<div class="col-sm-3">
						<div class="form-group">
							<div class="form-group required">
								<label class="control-label"> FD AccountOld</label> <input type="text"
									id="fdaccountold" class="form-control">
							</div>
						</div>
					</div>		
								
					<div class="col-sm-3">
						<div class="form-group">
							<div class="form-group required">
								<label class="control-label"> Name</label> <input type="text"
									id="name" class="form-control">
							</div>
						</div>
					</div>
						
					<div class="col-sm-3">
				<div class="form-group">
					<label>Address</label>
					<textarea class="form-control" id="paddress"></textarea>
				</div>
			</div>			
							
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label"> Occupation</label> <input type="text"
									id="occupation" class="form-control">
						</div>
					</div>		
						</div>
						
						
						<div class="row">
			         <div class="col-sm-3">
				         <div class="form-group">
					        <label>Name of the Father / Husband Name</label> <input type="text"
						    id="husbandname" autocomplete="off" class="form-control" />
				      </div>
			       </div>	
			       
			       <div class="col-sm-3">
				<div class="form-group">
					<label>Age</label> <input type="text" id="age" autocomplete="off"  
						class="form-control" maxlength="2"/>
				</div>
			</div>
			
				
			<div class="col-sm-3">
				<div class="form-group">
					<label>Residential number</label> <input type="text" id="resno"
						autocomplete="off" class="form-control" maxlength="8" />
				</div>
			</div>	
			<div class="col-sm-3">
				<div class="form-group">
					<label>Mobile No</label> <input type="text" id="mobileno"
						autocomplete="off" class="form-control" maxlength="10" />
				</div>
			</div>	
			</div>
			
			
			<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label>AadharCard Number</label> <input type="text" id="aadharno"
						autocomplete="off" class="form-control" maxlength="10" />
				</div>
			</div>		
			
			<div class="col-sm-3">
				<div class="form-group">
					<label>Pan number</label> <input type="text" id="panno"
						autocomplete="off" class="form-control" maxlength="10" />
				</div>
			</div>	
			
				<div class="col-sm-3">
				<div class="form-group">
					<label>Residential Address</label>
					<textarea class="form-control" id="resaddress"></textarea>
				</div>
			</div>	
			</fieldset>	
	
			<fieldset class="scheduler-border">
			<legend class="scheduler-border">Fixed Deposit Details</legend>
			<div class="row">
			<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label">Deposit Amount</label> <input type="text"
									id="deposiamount" class="form-control">
						</div>
					</div>
					
			<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label">Deposit Period</label> <input type="text"
									id="deposiperiod" class="form-control">
						</div>
					</div>
					
			<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label">Deposit Interest</label> <input type="text"
									id="depositinterest" class="form-control">
						</div>
					</div>
			</div>
			</fieldset>	
			
			<fieldset class="scheduler-border">
			<legend class="scheduler-border">If Minor</legend>
			<div class="row">	
			
					
					<div class="col-xs-3">
			    <div class="form-group">
			        <div class='input-group date'  data-provide="datepicker"
			            	data-date-autoclose="true" data-date-today-btn="linked"
										 data-date-today-highlight="true"
										data-date-format="dd.mm.yyyy">
										<label> Date Of Birth </label><input  id="dob" class="form-control date"
										value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span>
									</div>
							</div>
					</div>
					
			 <div class="col-sm-3">
				<div class="form-group">
					<label>Age</label> <input type="text" id="minorage" autocomplete="off"  
						class="form-control" maxlength="2"/>
				</div>
			</div>	
					
			</div>
			</fieldset>
			
			<fieldset class="scheduler-border">
			<legend class="scheduler-border">Nominee Details</legend>
			<div class="row">	
			
			<div class="col-sm-3">
			<div class="form-group">
				<label class="control-label">Name of the Nominee</label> <input type="text"
					id="nmname" class="form-control">
						</div>
					</div>
					
			<div class="col-sm-3">
				<div class="form-group">
					<label>Address of Nominee</label>
					<textarea class="form-control" id="nmaddress"></textarea>
				</div>
			</div>		
			
			<div class="col-sm-3">
				<div class="form-group">
					<label>Other Details of FD</label>
					<textarea class="form-control" id="details"></textarea>
				</div>
			</div>	
			</div>	
			</fieldset>
						
		</div>
				<div class="modal-footer">
					
					<button type="button" id="submit" data-type='New'
						class="btn btn-primary">Submit</button>
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
		<legend>
			Fixed Deposit Application
		</legend>
	</fieldset>
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
										<label>From Date </label><input  id="fromDate" class="form-control date"
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
			</div>
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						 <th>Slno</th>
						 <th class="abc">tDate</th>
						 <th>MemberId</th>
						 <th class="abc">deposittype</th>
						 <th class="abc">accountno</th>
						 <th class="abc">fdaccountold</th>
						 <th>name</th>
						 <th class="abc">paddress</th>
						 <th class="abc">occupation</th>
						 <th class="abc">husbandname</th>
						 <th>Age</th>
						 <th class="abc">resaddress</th>
						 <th class="abc">resno</th>
						 <th class="abc">mobileno</th>
						 <th class="abc">aadharno</th>
						 <th class="abc">panno</th>
					     <th class="abc">deposiamount</th>
					     <th class="abc">deposiperiod</th>
					     <th class="abc">depositinterest</th>
		   		         <th class="abc">dob</th>
						 <th class="abc">minorage</th>
						 <th class="abc">nmname</th>
						 <th class="abc">nmaddress</th>
						 <th class="abc">details</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator id="fixedbean" value="#session.fixedlist" status="i">
						<tr>
							  
								
							<td >${fixedbean.slno}<input type="hidden"
								value="${fixedbean.slno}" /></td> 
						
							 	<td class="abc">${fixedbean.tDate}<input type="hidden"
								value="${fixedbean.tDate}" /></td>
								
								<td >${fixedbean.memberid}<input type="hidden"
								value="${fixedbean.memberid}" /></td> 
								
								<td class="abc">${fixedbean.deposittype}<input type="hidden"
								value="${fixedbean.deposittype}" /></td>
								
								<td class="abc">${fixedbean.accountno}<input type="hidden"
								value="${fixedbean.accountno}" /></td>
								
								<td class="abc">${fixedbean.fdaccountold}<input type="hidden"
								value="${fixedbean.fdaccountold}" /></td>
								
								<td >${fixedbean.name}<input type="hidden"
								value="${fixedbean.name}" /></td>
								
								<td class="abc">${fixedbean.paddress}<input type="hidden"
								value="${fixedbean.paddress}" /></td>
								
								<td class="abc">${fixedbean.occupation}<input type="hidden"
								value="${fixedbean.occupation}" /></td>
								
								<td class="abc">${fixedbean.husbandname}<input type="hidden"
								value="${fixedbean.husbandname}" /></td>
								
								<td >${fixedbean.age}<input type="hidden"
								value="${fixedbean.age}" /></td>
								
								<td class="abc">${fixedbean.resaddress}<input type="hidden"
								value="${fixedbean.resaddress}" /></td>
								
								<td class="abc">${fixedbean.resno}<input type="hidden"
								value="${fixedbean.resno}" /></td>
								
								<td class="abc">${fixedbean.mobileno}<input type="hidden"
								value="${fixedbean.mobileno}" /></td>
								
								<td class="abc">${fixedbean.aadharno}<input type="hidden"
								value="${fixedbean.aadharno}" /></td>
								
								<td class="abc">${fixedbean.panno}<input type="hidden"
								value="${fixedbean.panno}" /></td>
								
								<td class="abc">${fixedbean.deposiamount}<input type="hidden"
								value="${fixedbean.deposiamount}" /></td>
								
								<td class="abc">${fixedbean.deposiperiod}<input type="hidden"
								value="${fixedbean.deposiperiod}" /></td>
								
								<td class="abc">${fixedbean.depositinterest}<input type="hidden"
								value="${fixedbean.depositinterest}" /></td>
								
								<td class="abc">${fixedbean.dob}<input type="hidden"
								value="${fixedbean.dob}" /></td>
								
								<td class="abc">${fixedbean.minorage}<input type="hidden"
								value="${fixedbean.minorage}" /></td>
								
								<td class="abc">${fixedbean.nmname}<input type="hidden"
								value="${fixedbean.nmname}" /></td>
								
								<td class="abc">${fixedbean.nmaddress}<input type="hidden"
								value="${fixedbean.nmaddress}" /></td>
								
								<td class="abc">${fixedbean.details}<input type="hidden"
								value="${fixedbean.details}" /></td>
								
							
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
	
	<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">
	NEW
	</button>
	<!-- <input type="button" class="rs-links" id="new1" value="NEW" /> -->
		
	<input type="hidden" id="membersize"
		value="<%=session.getAttribute("membersize")%>" />
		
		<script type="text/javascript">
	
			$(document).ready(function(){
											
				/* 	$("#new1").click(function(){
						$("#basicModal").modal('show');
						
					});	 */				
					   $(".rs-links").click(function(){
						var rowinfo = $(this).closest('tr').find('td').map(function () {
				        	return $(this).text();
				     	}).get();
						
						$("#basicModal").modal('show');
					    $("#tDate").val(rowinfo[1]);
						$("#combobox").val(rowinfo[2]);
						$("#deposittype").val(rowinfo[3]);
						$("#accountno").val(rowinfo[4]);
						$("#fdaccountold").val(rowinfo[5]);
						$("#name").val(rowinfo[6]);
						$("#paddress").val(rowinfo[7]);
						$("#occupation").val(rowinfo[8]);
						$("#husbandname").val(rowinfo[9]);
						$("#age").val(rowinfo[10]);
						$("#resaddress").val(rowinfo[11]);
						$("#resno").val(rowinfo[12]);
						$("#mobileno").val(rowinfo[13]);
						$("#aadharno").val(rowinfo[14]);
						$("#panno").val(rowinfo[15]);
						$("#deposiamount").val(rowinfo[16]);
						$("#deposiperiod").val(rowinfo[17]);
						$("#depositinterest").val(rowinfo[18]);
						$("#dob").val(rowinfo[19]);
						$("#minorage").val(rowinfo[20]);
						$("#nmname").val(rowinfo[21]);
						$("#nmaddress").val(rowinfo[22]);
						$("#details").val(rowinfo[23]); 
					   
					});    
					
					$("#submit").click(function() {
						
						var tDate = $.trim($('#tDate').val());
						var memberid = $.trim($('#combobox').val());
						var deposittype = $.trim($('#deposittype').val());
						var accountno = $.trim($('#accountno').val());
						var fdaccountold = $.trim($('#fdaccountold').val());
						var name = $.trim($('#name').val());
						var paddress = $.trim($('#paddress').val());
						var occupation= $.trim($('#occupation').val());
						var husbandname= $.trim($('#husbandname').val());
						var age= $.trim($('#age').val());
						var resaddress= $.trim($('#resaddress').val());
						var resno= $.trim($('#resno').val());
						var mobileno= $.trim($('#mobileno').val());
						var aadharno= $.trim($('#aadharno').val());
						var panno= $.trim($('#panno').val());
						var deposiamount= $.trim($('#deposiamount').val());
						var deposiperiod= $.trim($('#deposiperiod').val());
						var depositinterest= $.trim($('#depositinterest').val());
						var dob= $.trim($('#dob').val());
						var minorage= $.trim($('#minorage').val());
						var nmname= $.trim($('#nmname').val());
						var nmaddress= $.trim($('#nmaddress').val());
						var details= $.trim($('#details').val());
						
						
						/* if($.trim(name).length == 0) {
							    	alert("Provide Name");
							    }
					     else if($.trim(accountno).length == 0) {
						    	alert("Provide Account Number");
						    } 
					
					    
						else { */
									var parms = {
										
										tDate : tDate,
										memberid : memberid,
										deposittype : deposittype,
										accountno : accountno,
										fdaccountold : fdaccountold,
										name : name,
										paddress : paddress,
										occupation : occupation,
										husbandname : husbandname,
										age : age,
										resaddress : resaddress,
										resno : resno,
										mobileno : mobileno,
										aadharno : aadharno,
										panno : panno,
										deposiamount : deposiamount,
										deposiperiod : deposiperiod,
										depositinterest : depositinterest,
										dob : dob,
										minorage : minorage,
										nmname : nmname,
										nmaddress : nmaddress,
										details : details,
										};
											$.ajax({
												type : "POST",
												url : "fixed.action",
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
											});
											//alert(accountno);
									
					/* $('#memberid').keyup(function() {

						timer = setTimeout(function() {
							var memberid = $("#memberid").val();
							var name = $("#name").val();

							$.ajax({
								url : 'getname.action',
								dataType : "json",
								data : {
									memberid : $("#memberid").val()
								},
								success : function(data) {
									var str = data.name.replace(/\"/g, "");
									$("#name").val(str);

								}
							});
						}, 1000);
					});	 */	
				}); 
		/* 	$('#memberid').keyup(function() {
				var memberid = $("#memberid").val();
				$("#accountno").val(memberid);
			});
				 */
			 				
				  $("body").on('click',"#submit",function(){
					var fixedsize=parseInt($("#fixedsize").val().length == null ? "0" : $("#fixedsize").val())+1;
					fixedSize= "FD-"+fixedsize;
					$("#accountno").val(fixedSize);
									
					}); 
				 
				 
				/* <!--	
				$("body").on('click',"#addNewUser",function(){
					 var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RS-"+membersize;
					$("#accountno").val(memberSize); 
										
					});
				
				$("body").on('click',"#addNewUser",function(){
					 var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RS-"+membersize;
					$("#userName").val(memberSize); 
									
					});
				
				$("body").on('click',"#addNewUser",function(){
					var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RS-"+membersize;
					$("#password").val(memberSize); 
										
					});
			 --> */
			 $('#name').keyup(function() {
				    var $th = $(this);
				    $th.val( $th.val().replace(/[^a-zA-Z]/g, function(str) 
				    {
				    	
				    	return ''; 
				    } 
				  ) );
				});
			 $("#age").keypress(function(event){
			        var inputValue = event.charCode;
			        //alert(inputValue);
			        if(!((inputValue > 47 && inputValue < 58) ||(inputValue==32) || (inputValue==0))){
			            event.preventDefault();
			        }
			    });

			 $("#mobileno").keypress(function(event){
			        var inputValue = event.charCode;
			        //alert(inputValue);
			        if(!((inputValue > 47 && inputValue < 58) ||(inputValue==32) || (inputValue==0))){
			            event.preventDefault();
			        }
			    });
			 $("#resno").keypress(function(event){
			        var inputValue = event.charCode;
			        //alert(inputValue);
			        if(!((inputValue > 47 && inputValue < 58) ||(inputValue==32) || (inputValue==0))){
			            event.preventDefault();
			        }
			    });
			 
			 $("#aadharno").keypress(function(event){
			        var inputValue = event.charCode;
			        //alert(inputValue);
			        if(!((inputValue > 47 && inputValue < 58) ||(inputValue==32) || (inputValue==0))){
			            event.preventDefault();
			        }
			    });
			
				    $('#depositinterest').keypress(function(){
				        if($(this).val().indexOf('.')!=-1){         
				            if($(this).val().split(".")[1].length > 2){                
				                if( isNaN( parseFloat( this.value ) ) ) return;
				                this.value = parseFloat(this.value).toFixed(2);
				            }  
				         }            
				         return this; //for chaining
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
			 });
			
			 $(".ui-widget").click(function() {

					$.ajax({
						url : 'fixedname.action',
						dataType : "json",
						data : {
							memberid : $(".custom-combobox-input").val()
						},
						success : function(data) {
							var entityName = data.entityName;

							var entityName2 = data.entityName2;
							var entityName3 = data.entityName3;
							var entityName4 = data.entityName4;

							var str = data.entityName.replace(/\"/g, "")
							var str1 = data.entityName2.replace(/\"/g, "")
							var str2 = data.entityName3.replace(/\"/g, "")
							$("#name").val(str);
							$("#resaddress").val(str1);
							$("#occupation").val(str2);
							$("#age").val(data.entityName4);

						}
					});

			});
		
			
		</script>

	
</body>
</html>






