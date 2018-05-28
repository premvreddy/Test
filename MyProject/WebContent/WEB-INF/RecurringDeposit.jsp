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
					<h4 class="modal-title" id="myModalLabel">Recurring Deposit Application</h4>
				</div>
									
						
					<div class="modal-body">
					
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
				<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Member Id</label> <input type="text" id="memberid" 
									autocomplete="off" class="form-control" />
									</div>
							</div>
						</div>		
					<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label"> RD Account number</label> <input type="text" id="rdaccountno" 
									autocomplete="off" class="form-control" />
									</div>
					    </div>		
							
					<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label">RD Account old </label> <input type="text" id="rdaccountold" 
									autocomplete="off" class="form-control" />
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
								<label class="control-label"> Address</label> <input type="text"
									id="address" class="form-control">
						</div>
					</div>
					
					<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label"> Occupation</label> <input type="text"
									id="occupation" class="form-control">
						</div>
					</div>		
						
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
			
			<div class="col-sm-3">
				<div class="form-group">
					<label>AadharCard Number</label> <input type="text" id="aadhaarnumber"
						autocomplete="off" class="form-control" maxlength="10" />
				</div>
			</div>		
			
			<div class="col-sm-3">
				<div class="form-group">
					<label>Pan number</label> <input type="text" id="pannumber"
						autocomplete="off" class="form-control" maxlength="10" />
				</div>
			</div>	
			
				<div class="col-sm-3">
				<div class="form-group">
					<label>Residential Address</label>
					<textarea class="form-control" id="resaddress"></textarea>
				</div>
			</div>		
								
	</div>
		<fieldset class="scheduler-border">
			<legend class="scheduler-border">Recurring Deposit Details</legend>
			<div class="row">
			<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label">RD Amount</label> <input type="text"
									id="rdamount" class="form-control">
						</div>
					</div>
					
			<div class="col-sm-3">
						<div class="form-group">
								<label class="control-label">Deposit Period</label> <input type="text"
									id="depositperiod" class="form-control">
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
					<label>Other Details of RD</label>
					<textarea class="form-control" id="details"></textarea>
				</div>
			</div>	
			</div>	
			</fieldset>						
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

	<fieldset>
		<legend>
			Recurring Deposit Application
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
						 <th class="abc">rdaccountno</th>
						 <th class="abc">rdaccountold</th>
						 <th >Name</th>
						 <th class="abc">address</th>
						 <th class="abc">occupation</th>
						 <th class="abc">husbandname</th>
						 <th>Age</th>
						 <th class="abc">resaddress</th>
						 <th class="abc">resno</th>
						 <th class="abc">mobileno</th>
						 <th class="abc">aadhaarnumber</th>
						 <th class="abc">pannumber</th>
					     <th class="abc">rdamount</th>
					     <th class="abc">depositperiod</th>
		   		         <th class="abc">dob</th>
						 <th class="abc">minorage</th>
						 <th class="abc">nmname</th>
						 <th class="abc">nmaddress</th>
						 <th class="abc">details</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator id="recurringbean" value="#session.recurringlist" status="i">
						<tr>
							  
								
							<td >${recurringbean.slno}<input type="hidden"
								value="${recurringbean.slno}" /></td> 
						
							 	<td class="abc">${recurringbean.tDate}<input type="hidden"
								value="${recurringbean.tDate}" /></td>
								
								<td >${recurringbean.memberid}<input type="hidden"
								value="${recurringbean.memberid}" /></td> 
								
								<td class="abc">${recurringbean.rdaccountno}<input type="hidden"
								value="${recurringbean.rdaccountno}" /></td>
								
								<td class="abc">${recurringbean.rdaccountold}<input type="hidden"
								value="${recurringbean.rdaccountold}" /></td>
								
								<td >${recurringbean.name}<input type="hidden"
								value="${recurringbean.name}" /></td>
								
								<td class="abc">${recurringbean.address}<input type="hidden"
								value="${recurringbean.address}" /></td>
								
								<td class="abc">${recurringbean.occupation}<input type="hidden"
								value="${recurringbean.occupation}" /></td>
								
								<td class="abc">${recurringbean.husbandname}<input type="hidden"
								value="${recurringbean.husbandname}" /></td>
								
								<td >${recurringbean.age}<input type="hidden"
								value="${recurringbean.age}" /></td>
								
								<td class="abc">${recurringbean.resaddress}<input type="hidden"
								value="${recurringbean.resaddress}" /></td>
								
								<td class="abc">${recurringbean.resno}<input type="hidden"
								value="${recurringbean.resno}" /></td>
								
								<td class="abc">${recurringbean.mobileno}<input type="hidden"
								value="${recurringbean.mobileno}" /></td>
								
								<td class="abc">${recurringbean.aadhaarnumber}<input type="hidden"
								value="${recurringbean.aadhaarnumber}" /></td>
								
								<td class="abc">${recurringbean.pannumber}<input type="hidden"
								value="${recurringbean.pannumber}" /></td>
								
								<td class="abc">${recurringbean.rdamount}<input type="hidden"
								value="${recurringbean.rdamount}" /></td>
								
								<td class="abc">${recurringbean.depositperiod}<input type="hidden"
								value="${recurringbean.depositperiod}" /></td>
								
								<td class="abc">${recurringbean.dob}<input type="hidden"
								value="${recurringbean.dob}" /></td>
								
								<td class="abc">${recurringbean.minorage}<input type="hidden"
								value="${recurringbean.minorage}" /></td>
								
								<td class="abc">${recurringbean.nmname}<input type="hidden"
								value="${recurringbean.nmname}" /></td>
								
								<td class="abc">${recurringbean.nmaddress}<input type="hidden"
								value="${recurringbean.nmaddress}" /></td>
								
								<td class="abc">${recurringbean.details}<input type="hidden"
								value="${recurringbean.details}" /></td>
								
							
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
		
		<input type="hidden" id="membersize" value="<%=session.getAttribute("membersize") %>" />	
		
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
						$("#memberid").val(rowinfo[2]);
						$("#rdaccountno").val(rowinfo[3]);
						$("#rdaccountold").val(rowinfo[4]);
						$("#name").val(rowinfo[5]);
						$("#address").val(rowinfo[6]);
						$("#occupation").val(rowinfo[7]);
						$("#husbandname").val(rowinfo[8]);
						$("#age").val(rowinfo[9]);
						$("#resaddress").val(rowinfo[10]);
						$("#resno").val(rowinfo[11]);
						$("#mobileno").val(rowinfo[12]);
						$("#aadhaarnumber").val(rowinfo[13]);
						$("#pannumber").val(rowinfo[14]);
						$("#rdamount").val(rowinfo[15]);
						$("#depositperiod").val(rowinfo[16]);
						$("#dob").val(rowinfo[17]);
						$("#minorage").val(rowinfo[18]);
						$("#nmname").val(rowinfo[19]);
						$("#nmaddress").val(rowinfo[20]);
						$("#details").val(rowinfo[21]);
						
					   
					});  
					
					$("#addNewUser").click(function() {
							
						var tDate = $.trim($('#tDate').val());
						var memberid = $.trim($('#memberid').val());
						var rdaccountno = $.trim($('#rdaccountno').val());
						var rdaccountold = $.trim($('#rdaccountold').val());
						var name = $.trim($('#name').val());
						var address = $.trim($('#address').val());
						var occupation = $.trim($('#occupation').val());
						var husbandname = $.trim($('#husbandname').val());
						var age = $.trim($('#age').val());
						var resaddress = $.trim($('#resaddress').val());
						var resno = $.trim($('#resno').val());
						var mobileno = $.trim($('#mobileno').val());
						var aadhaarnumber = $.trim($('#aadhaarnumber').val());
						var pannumber = $.trim($('#pannumber').val());
						var rdamount = $.trim($('#rdamount').val());
						var depositperiod = $.trim($('#depositperiod').val());
						var dob = $.trim($('#dob').val());
						var minorage = $.trim($('#minorage').val());
						var nmname = $.trim($('#nmname').val());
						var nmaddress = $.trim($('#nmaddress').val());
						var details = $.trim($('#details').val());
						
						
						if($.trim(memberid).length == 0) {
							    	alert("Provide memberid");
							    }
					    else if($.trim(name).length == 0) {
						    	alert("Provide Name");
						    }  
					
					    
						else {
									var parms = {
										
										tDate : tDate,
										memberid : memberid,
										rdaccountno : rdaccountno,
										rdaccountold : rdaccountold,
										name : name,
										address : address,
										occupation : occupation,
										husbandname : husbandname,
										age : age,
										resaddress : resaddress,
										resno : resno,
										mobileno : mobileno,
										aadhaarnumber : aadhaarnumber,
										pannumber : pannumber,
										rdamount : rdamount,
										depositperiod : depositperiod,
										dob : dob,
										minorage : minorage,
										nmname : nmname,
										nmaddress : nmaddress,
										details : details,
										};
											$.ajax({
												type : "POST",
												url : "rdUser.action",
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
				
				
			<!-- 				
				$("body").on('click',"#addNewUser",function(){
					var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RS-"+membersize;
					$("#memberid").val(memberSize);
									
					});
					
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
			 -->
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
			 $("#aadhaarnumber").keypress(function(event){
			        var inputValue = event.charCode;
			        //alert(inputValue);
			        if(!((inputValue > 47 && inputValue < 58) ||(inputValue==32) || (inputValue==0))){
			            event.preventDefault();
			        }
			    });
		</script>

	
</body>
</html>






