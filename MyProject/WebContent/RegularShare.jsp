<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <% Integer number= (Integer)session.getAttribute("membersize"); %> 
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
					<h4 class="modal-title" id="myModalLabel">Regular Share	Application</h4>
				</div>
									
						
					<div class="modal-body">
					
					<div class="row">
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Bank Name</label> <select id="bankname"
									class="form-control">
									<option value="Padmashree Credit Co-operative Society Limited">Padmashree Credit Co-operative Society Limited</option>
									</select>
									</div>
							 </div>
							<div class="col-sm-3">	
								<div class="form-group">
									<label>Bank Code</label> <select id="bankcode"
									class="form-control">
									<option value="PCCSL">PCCSL</option>
									</select>
							</div>
						</div>
					
						
						<!-- <div class="row">
						
						<div class="col-sm-4">
							<div class="form-group"> 
								
									<label  class="control-label">Bank Name</label> <input type="text" id="bankname" readonly="readonly"
										class="form-control" value="Padmashree Credit Co-operative Society Limited" placeholder="Padmashree Credit Co-operative Society Limited"/>
										</div>
									
							 </div>
							<div class="col-sm-2">	
								<div class="form-group">
									<label>Bank Code</label> <input type="text" id="bankcode" readonly="readonly"
									class="form-control" value="PCCSL" placeholder="PCCSL"/>
							</div>
						</div> -->
						<div class="col-sm-2">
							<div class="form-group">
							
						</div>
						</div>
								<div class="col-sm-2">
									<div class="form-group">
									<form id="frmUpload" name="frmUpload"   action="FileUploadAction"
											method="post" enctype="multipart/form-data">															
						                     
									      	<div style="float: right; width: 30%;">
												 	<input type='file' name="photo" onchange="readURL(this);" /> 
													<img id="blah" src="#" alt="preview" width="150" height="150" />
											</div>	
									</form>    
								     </div>
								</div>    
						
					</div>
					<div class="row">
					
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Personal_Info</legend>
					
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Member Id</label> <input type="text" id="memberid"  readonly="readonly"
									autocomplete="off" class="form-control" />
									</div>
							</div>
						</div>
						
						
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Account No</label> <input type="text" id="accountno"  readonly="readonly"
									autocomplete="off" class="form-control" />
									</div>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">UserName</label> <input type="text" id="userName"  readonly="readonly"
									autocomplete="off" class="form-control" />
									</div>
							</div>
						</div>
					
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Password</label> <input type="password" id="password" readonly="readonly"
									class="form-control" />
									</div>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Name of the Applicant</label> <input type="text" id="name"
									class="form-control" />
									</div>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Gender</label> <select id="gender"
									class="form-control">
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Age</label> <input type="text" id="age" maxlength="2"
									class="form-control" />
									</div>
							</div>
						</div>
						
						<div class="col-xs-3">
							<div class="form-group">
								<div class="form-group required">
									<div class='input-group date'  data-provide="datepicker"
										data-date-autoclose="true" data-date-today-btn="linked"
											 	data-date-today-highlight="true" data-date-format="dd-mm-yyyy">
										<label class="control-label"> DOB </label><input  id="dob" class="form-control date" 
										value="<fmt:formatDate pattern='dd-MM-yyyy' value='<%=new java.util.Date()%>' />">
										 <span class="input-group-addon"><span
												class="icon icon-calendar"></span> </span> 
										</div>
								</div>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Phone (o)</label> <input type="text" id="phone" maxlength="8"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>(R)</label> <input type="text" id="res" maxlength="8"
									class="form-control" />
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label"> Cell</label> <input type="text" id="cell" maxlength="10" 
									class="form-control" />
									</div>
							</div>
						</div>
						
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Qualification</label> <input type="text" id="qualification"
									class="form-control" />
							</div>
						</div>
					
						<div class="col-sm-3">
							<div class="form-group">
								<label>Caste</label> <input type="text" id="caste"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Occupation</label> <input type="text" id="occupation"
									class="form-control" />
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
									<label class="control-label">Pan Number</label><input type="text" class="form-control" id="pannumber" maxlength="10"/>
									</div> 
							</div>
						</div><br/>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Aadhaar Number</label><input type="text" class="form-control" id="aadhaarnumber" maxlength="12"/>
								</div> 
							</div>
							</div>
							
							<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<!-- <label class="control-label">Member Id 1</label> --> <input type="hidden" id="memberid1"  hidden="true"  readonly="readonly"
									autocomplete="off" class="form-control" />
									</div>
							</div>
						</div>
							
							
						</fieldset>
						</div>
						<div class="row">
						
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Communication Address</legend>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Flat No/Building No </label><input type="text" class="form-control" id="flatno"/> 
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Communication Address1</label><input type="text" class="form-control" id="address"/>
								</div> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">Communication Address2</label><input type="text" class="form-control" id="caddress2"/> 
								</div>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<div class="form-group required">
								<label class="control-label">LandMark</label><input type="text" class="form-control" id="landmark"/>
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
								<label class="control-label">Pin</label><input type="text" class="form-control" id="cpin" maxlength="6"/>
								</div> 
							</div>
						</div>
						</fieldset>
						</div>
						<div class="row">
						<div class="col-sm-1">
							<div class="form-group">
								<label>Tick_if_Same_Address</label><input type="checkbox" class="form-control" id="pcheck"/> 
							</div>
						</div>
						</div>
						<div class="row">
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Permanent Address</legend>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Flat No/Building No </label><input type="text" class="form-control" id="pflatno"/> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Permanent Address1</label><input type="text" class="form-control" id="paddress"/> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Permanent Address2</label><input type="text" class="form-control" id="paddress2"/> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>LandMark</label><input type="text" class="form-control" id="plandmark"/> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>City/Village</label><input type="text" class="form-control" id="pcity"/> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>District</label><input type="text" class="form-control" id="pdistrict"/> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>State</label><input type="text" class="form-control" id="pstate"/> 
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Pin</label><input type="text" class="form-control" id="ppin"/> 
							</div>
						</div>
						
						
					</fieldset>
					
				</div>	
				<div class="row">
						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Income_Details</legend>
								<div class="col-sm-3">
									<div class="form-group">
										<label>From Salary</label> <input type="text" id="fsalary" maxlength="7"
											class="form-control" />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>From Business</label> <input type="text" id="fbusiness" maxlength="7"
										class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>From Rent</label> <input type="text" id="frent" maxlength="7"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>From other Sources</label> <input type="text" id="fsource" maxlength="7"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Applicant's Father/Husband</label> <input type="text" id="afhname"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Occupation</label> <input type="text" id="idoccupation"
									class="form-control" />
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="form-group">
								<label>Work Address</label><textarea class="form-control" id="idaddress"></textarea> 
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="form-group">
								<label>Objective of the Membership</label> <input type="text" id="omembership"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Immovable Property of the Applicant(if any)</label> <input type="text" id="ipapplicant"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Details of the Membership if the applicant is Member of any other Society</label> <input type="text" id="membersociety"
									class="form-control" />
							</div>
						</div>
							
						</fieldset>
						</div>
						<div class="row">
							<fieldset class="scheduler-border">
								<legend class="scheduler-border">Other_Info</legend>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Nominee Name</label> <input type="text" id="nmname"
											class="form-control" />
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Relation</label> <input type="text" id="relation"
											class="form-control" />
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Nominee Address</label><textarea class="form-control" id="nmaddress"></textarea> 
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Account No.</label> <input type="text" id="accountno1"
											class="form-control" />
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Name1</label> <input type="text" id="name1"
											class="form-control" />
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Account No.</label> <input type="text" id="accountno2"
											class="form-control" />
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Name2</label> <input type="text" id="name2"
											class="form-control" />
										</div>
									</div>
									
							</fieldset>
						</div>
						<div class="row" >
							<fieldset class="scheduler-border">
									<legend class="scheduler-border">Opening Balance_Details</legend>
										<div class="col-sm-3">
											<div class="form-group">
												<label>Share Amount</label> <input type="text" id="shareamount" maxlength="7"
												class="form-control" />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label> Opening Balance</label> <input type="text" id="openingbalance" maxlength="7"
												class="form-control" />
											</div>
										</div>
										<div class="col-sm-3">
												<div class="form-group">
													<label>Opening Balance Type</label> <select id="obtype"
														class="form-control">
														<option value="Cr">Cr</option>
															<option value="Dr">Dr</option>
													</select>
												</div>
											</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label>Sub Group Name</label> <input type="text" id="subgroup" placeholder="Regular Share Holder" value="Regular Share Holder" readonly="readonly"
												class="form-control" />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label>Main Group</label> <input type="text" id="maingroup" placeholder="Liability" value="Liability" readonly="readonly"
												class="form-control" />
											</div>
										</div>
										
							</fieldset>
						</div>
							
							
						<div class="row" >
							<h6>Signature of the Applicant</h6>
									<div class="col-sm-2">
										<div class="form-group">
											<form id="frmUpload1" name="frmUpload"   action="FileUploadAction"
												method="post" enctype="multipart/form-data">															
						                     
									      		<div style="float: right; width: 30%;">
												 	<input type='file' name="photo" onchange="readURL1(this);" /> 
													<img id="blah1" src="#" alt="preview" width="150" height="150" />
												</div>	
											</form>    
								    	 </div>
									</div> 
								
									<div class="col-sm-4">
										<div class="form-group">
										<form id="frmUpload2" name="frmUpload"   action="FileUploadAction"
											method="post" enctype="multipart/form-data">															
						                     
									      	<div style="float: right; width: 30%;">
												 	<input type='file' name="photo" onchange="readURL2(this);" /> 
													<img id="blah2" src="#" alt="preview" width="150" height="150" />
											</div>	
									</form>    
								     </div>
								</div>  
								<div class="col-sm-4">
									<div class="form-group">
									<form id="frmUpload3" name="frmUpload"   action="FileUploadAction"
											method="post" enctype="multipart/form-data">															
						                     
									      	<div style="float: right; width: 30%;">
												 	<input type='file' name="photo" onchange="readURL3(this);" /> 
													<img id="blah3" src="#" alt="preview" width="150" height="150" />
											</div>	
									</form>    
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

	<fieldset>
		<legend>
			Regular Share Account Application
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
						<th class="abc">bankname</th>
						<th class="abc">bankcode</th>
						<th>MemberId</th>
						<th>MemberId1</th>
						<th>AccountNo</th>
						 <th class="abc">userName</th>
						<th class="abc">password</th>
						<th>Name</th>
						<th class="abc">gender</th>
						<th>Age</th>
						<th>Phone</th>
						<th class="abc">res</th>
						<th>cell</th>
						<th class="abc">qualification</th>
						<th class="abc">caste</th>
						<th class="abc">occupation</th>
						<th class="abc">address</th>
						<th class="abc">paddress</th>
						<th class="abc">fsalary</th>
						<th class="abc">fbusiness</th>
						<th class="abc">frent</th>
						<th class="abc">fsource</th>
						<th class="abc">afhname</th>
						<th class="abc">idoccupation</th>
						<th class="abc">idaddress</th>
						<th class="abc">omembership</th>
						<th class="abc">ipapplicant</th>
						<th class="abc">membersociety</th>
						<th class="abc">nmname</th>
						<th class="abc">relation</th>
						<th class="abc">nmaddress</th>
						<th class="abc">name1</th>
						<th class="abc">accountno1</th>
						<th class="abc">name2</th>
						<th class="abc">accountno2</th>
						<th class="abc">Share Amount</th>
						<th class="abc">Opening Balance</th>
						<th class="abc">OpeningBalance Type</th>
						<th class="abc">Sub Group</th>
						<th class="abc">Main Group</th>
						 
						
					</tr>
				</thead>
				<tbody>
					<s:iterator id="regularbean" value="#session.regularlist" status="i">
						<tr>
							  <%-- <td>${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td> --%>
								
							<td >${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td> 
						
							 	<td class="abc">${regularbean.bankname}<input type="hidden"
								value="${regularbean.bankname}" /></td>
								
								<td class="abc">${regularbean.bankcode}<input type="hidden"
								value="${regularbean.bankcode}" /></td>
								
								<td>${regularbean.memberid}<input type="hidden"
								value="${regularbean.memberid}" /></td>
								
								<td>${regularbean.memberid1}<input type="hidden"
								value="${regularbean.memberid1}" /></td>
								
								<td class="rs-links1"><a
								href="#">${regularbean.accountno}</a><input type="hidden"
								value="${regularbean.accountno}" /></td>
								
								<td class="abc">${regularbean.userName}<input type="hidden" 
								value="${regularbean.userName}" /></td>
								
								<td class="abc">${regularbean.password}<input type="hidden"
								value="${regularbean.password}" /></td>
								
								<td >${regularbean.name}<input type="hidden"
								value="${regularbean.name}" /></td>
								
								<td class="abc">${regularbean.gender}<input type="hidden"
								value="${regularbean.gender}" /></td>
								
								<td>${regularbean.age}<input type="hidden"
								value="${regularbean.age}" /></td>
								
								<td>${regularbean.phone}<input type="hidden"
								value="${regularbean.phone}" /></td>
								
								<td class="abc">${regularbean.res}<input type="hidden"
								value="${regularbean.res}" /></td>
								
								<td >${regularbean.cell}<input type="hidden"
								value="${regularbean.cell}" /></td>
								
								<td class="abc">${regularbean.qualification}<input type="hidden"
								value="${regularbean.qualification}" /></td>
								
								<td  class="abc">${regularbean.caste}<input type="hidden"
								value="${regularbean.caste}" /></td>
								
								<td class="abc">${regularbean.occupation}<input type="hidden"
								value="${regularbean.occupation}" /></td>
								
								<td class="abc">${regularbean.address}<input type="hidden"
								value="${regularbean.address}" /></td>
								
								<td class="abc">${regularbean.paddress}<input type="hidden"
								value="${regularbean.paddress}" /></td>
								
								<td class="abc">${regularbean.fsalary}<input type="hidden"
								value="${regularbean.fsalary}" /></td>
								
								<td class="abc">${regularbean.fbusiness}<input type="hidden"
								value="${regularbean.fbusiness}" /></td>
								
								<td class="abc">${regularbean.frent}<input type="hidden"
								value="${regularbean.frent}" /></td>
								
								<td class="abc">${regularbean.fsource}<input type="hidden"
								value="${regularbean.fsource}" /></td> 
								
								<td class="abc">${regularbean.afhname}<input type="hidden"
								value="${regularbean.afhname}" /></td> 
								
								<td class="abc">${regularbean.idoccupation}<input type="hidden"
								value="${regularbean.idoccupation}" /></td> 
								
								<td class="abc">${regularbean.idaddress}<input type="hidden"
								value="${regularbean.idaddress}" /></td>
								 
								<td class="abc">${regularbean.omembership}<input type="hidden"
								value="${regularbean.omembership}" /></td>
								 
								<td class="abc">${regularbean.ipapplicant}<input type="hidden"
								value="${regularbean.ipapplicant}" /></td>
								 
								<td class="abc">${regularbean.membersociety}<input type="hidden"
								value="${regularbean.membersociety}" /></td>
								 
								<td class="abc">${regularbean.nmname}<input type="hidden"
								value="${regularbean.nmname}" /></td>
								
								<td class="abc">${regularbean.relation}<input type="hidden"
								value="${regularbean.relation}" /></td>
								
								<td class="abc">${regularbean.nmaddress}<input type="hidden"
								value="${regularbean.nmaddress}" /></td>
								
								<td class="abc">${regularbean.name1}<input type="hidden"
								value="${regularbean.name1}" /></td>
								
								<td class="abc">${regularbean.accountno1}<input type="hidden"
								value="${regularbean.accountno1}" /></td>
								
								<td class="abc">${regularbean.name2}<input type="hidden"
								value="${regularbean.name2}" /></td>
								
								<td class="abc">${regularbean.accountno2}<input type="hidden"
								value="${regularbean.accountno2}" /></td>
								
								<td class="abc">${regularbean.shareamount}<input type="hidden"
								value="${regularbean.shareamount}" /></td>
								
								<td class="abc">${regularbean.openingbalance}<input type="hidden"
								value="${regularbean.openingbalance}" /></td>
								
								<td class="abc">${regularbean.obtype}<input type="hidden"
								value="${regularbean.obtype}" /></td>
								
								<td class="abc">${regularbean.subgroup}<input type="hidden"
								value="${regularbean.subgroup}" /></td>
								
								<td class="abc">${regularbean.maingroup}<input type="hidden"
								value="${regularbean.maingroup}" /></td>
														
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
						
						$("#updat").attr('data-id',rowinfo[0]); 
						$("#deleteval").attr('data-id',rowinfo[0]);
						$("#basicModal").modal('show');
						$("#bankname").val(rowinfo[1]);
						$("#bankcode").val(rowinfo[2]);
						$("#memberid").val(rowinfo[3]);
						$("#memberid1").val(rowinfo[4]);
					    $("#accountno").val(rowinfo[5]);
					    $("#userName").val(rowinfo[6]);
					    $("#password").val(rowinfo[7]);
					    $("#name").val(rowinfo[8]);
					    $("#gender").val(rowinfo[9]);
						$("#age").val(rowinfo[10]);
						$("#phone").val(rowinfo[11]);
						$("#res").val(rowinfo[12]);
						$("#cell").val(rowinfo[13]);
						$("#qualification").val(rowinfo[14]);
						$("#caste").val(rowinfo[15]);
						$("#occupation").val(rowinfo[16]);
						$("#address").val(rowinfo[17]);
						$("#paddress").val(rowinfo[18]);
						$("#fsalary").val(rowinfo[19]);
						$("#fbusiness").val(rowinfo[20]);
						$("#frent").val(rowinfo[21]);
						$("#fsource").val(rowinfo[22]);
						$("#afhname").val(rowinfo[23]);
						$("#idoccupation").val(rowinfo[24]);
						$("#idaddress").val(rowinfo[25]);
						$("#omembership").val(rowinfo[26]);
						$("#ipapplicant").val(rowinfo[27]);
						$("#membersociety").val(rowinfo[28]);
						$("#nmname").val(rowinfo[29]);
						$("#relation").val(rowinfo[30]);
						$("#nmaddress").val(rowinfo[31]);
						$("#name1").val(rowinfo[32]);
						$("#accountno1").val(rowinfo[33]);
						$("#name2").val(rowinfo[34]);
						$("#accountno2").val(rowinfo[35]);
						$("#shareamount").val(rowinfo[36]);
						$("#openingbalance").val(rowinfo[37]);
						$("#obtype").val(rowinfo[38]);	
						$("#subgroup").val(rowinfo[39]);
						$("#maingroup").val(rowinfo[40]); 
											
					});  
					
					$("#addNewUser").click(function() {
							
						var bankname = $.trim($('#bankname').val());
						var bankcode = $.trim($('#bankcode').val());
						var memberid = $.trim($('#memberid').val());
						var memberid1 = $.trim($('#memberid1').val());
						var accountno = $.trim($('#accountno').val());
						var userName = $.trim($('#userName').val());
						var password = $.trim($('#password').val());
						var name = $.trim($('#name').val());
						var gender = $.trim($('#gender').val());
						var age=$.trim($('#age').val());
						var phone=$.trim($('#phone').val());
						var res=$.trim($('#res').val());
						var cell=$.trim($('#cell').val());
						var qualification=$.trim($('#qualification').val());
						var caste=$.trim($('#caste').val());
						var occupation=$.trim($('#occupation').val());
						var address=$.trim($('#address').val());
						var paddress=$.trim($('#paddress').val());
						var fsalary=$.trim($('#fsalary').val());
						var fbusiness=$.trim($('#fbusiness').val());
						var frent=$.trim($('#frent').val());
						var fsource=$.trim($('#fsource').val());
						var afhname=$.trim($('#afhname').val());
						var idoccupation=$.trim($('#idoccupation').val());
						var idaddress=$.trim($('#idaddress').val());
						var omembership=$.trim($('#omembership').val());
						var ipapplicant=$.trim($('#ipapplicant').val());
						var membersociety=$.trim($('#membersociety').val());
						var nmname=$.trim($('#nmname').val());
						var relation=$.trim($('#relation').val());
						var nmaddress=$.trim($('#nmaddress').val());
						var name1=$.trim($('#name1').val());
						var accountno1=$.trim($('#accountno1').val());
						var name2=$.trim($('#name2').val());
						var accountno2=$.trim($('#accountno2').val());
						var shareamount = $.trim($('#shareamount').val());
						var openingbalance = $.trim($('#openingbalance').val());
						var obtype = $.trim($('#obtype').val());	
						var subgroup = $.trim($('#subgroup').val());
						var maingroup = $.trim($('#maingroup').val());
						var dob = $.trim($('#dob').val());
						var pannumber = $.trim($('#pannumber').val());
						var aadhaarnumber = $.trim($('#aadhaarnumber').val());
						var flatno = $.trim($('#flatno').val());
						var caddress2 = $.trim($('#caddress2').val());
						var landmark = $.trim($('#landmark').val());
						var city = $.trim($('#city').val());
						var district = $.trim($('#district').val());
						var state = $.trim($('#state').val());
						var cpin = $.trim($('#cpin').val());
						var pflatno = $.trim($('#pflatno').val());
						var paddress2 = $.trim($('#paddress2').val());
						var plandmark = $.trim($('#plandmark').val());
						var pcity = $.trim($('#pcity').val());
						var pdistrict = $.trim($('#pdistrict').val());
						var pstate = $.trim($('#pstate').val());
						var ppin = $.trim($('#ppin').val());
						
						
						if($.trim(name).length == 0) {
							    	alert("Provide Name");
							    }
					    else if($.trim(memberid).length == 0) {
						    	alert("Provide Member ID");
						    }  
						
					    else if($.trim(memberid1).length == 0) {
					    	alert("Provide Member ID1");
					    } 
						else if($.trim(accountno).length == 0) {
						    	alert("Provide Account Number");
						    }
						else if($.trim(userName).length == 0) {
						    	alert("Provide User Name");
						    }
						else if($.trim(password).length == 0) {
						    	alert("Provide Password");
						    }    
						else if($.trim(gender).length == 0) {
						    	alert("Provide Gender");
						    }  
						else if($.trim(age).length == 0) {
						    	alert("Provide age");
						    }
						else if($.trim(cell).length == 0) {
						    	alert("Provide Cell");
						    }
						else if($.trim(flatno).length == 0) {
					    	alert("Provide Flat No");
					    }
					   /*  else if($.trim(address).length == 0) {
					    	alert("Provide Address");
					    } */
					   /* else if($.trim(address2).length == 0) {
					    	alert("Provide Address2");
					    }
					    else if($.trim(landmark).length == 0) {
					    	alert("Provide Land Mark");
					    }
					    else if($.trim(city).length == 0) {
					    	alert("Provide City");
					    }
					    else if($.trim(district).length == 0) {
					    	alert("Provide District");
					    }
					    else if($.trim(state).length == 0) {
					    	alert("Provide State");
					    } 
					    else if($.trim(pin).length == 0) {
					    	alert("Provide Pin Number");
					    }   
					    else if($.trim(pannumber).length == 0) {
					    	alert("Provide Pan Number");
					    }
					    else if($.trim(aadhaarnumber).length == 0) {
					    	alert("Provide Aadhaar Number");
					    }*/
					    
						else {
									var parms = {
										
										bankname : bankname,
										bankcode : bankcode,
										memberid : memberid,
										memberid1 : memberid1,
										accountno : accountno,
										userName : userName,
										password : password,
										name : name,
										gender : gender,
										age : age,
										phone : phone,
										res : res,
										cell : cell,
										qualification : qualification,
										caste : caste,
										occupation : occupation,
										address : address,
										paddress : paddress,
										fsalary : fsalary,
										fbusiness : fbusiness,
										frent : frent,
										fsource : fsource,
										afhname : afhname,
										idoccupation : idoccupation,
										idaddress : idaddress,
										omembership : omembership,
										ipapplicant : ipapplicant,
										membersociety : membersociety,
										nmname : nmname,
										relation : relation,
										nmaddress : nmaddress,
										name1 : name1,
										accountno1 :accountno1,
										name2 : name2,
										accountno2 : accountno2,
										shareamount : shareamount,
										openingbalance : openingbalance,
										obtype : obtype,
										subgroup : subgroup,
										maingroup : maingroup,
										dob : dob,
										pannumber : pannumber,
										aadhaarnumber : aadhaarnumber,
										flatno : flatno,
										caddress2 : caddress2,
										landmark : landmark,
										city : city,
										district : district,
										state : state,
										cpin : cpin,
										pflatno : pflatno,
										paddress2 : paddress2,
										plandmark : plandmark,
										pcity : pcity,
										pdistrict : pdistrict,
										pstate : pstate,
										ppin : ppin,
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
									});
									
				});
				
				
							
				$("body").on('click',"#addNewUser",function(){
					var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RS-"+membersize;
					$("#memberid").val(memberSize);
									
					});
				
				
				
				$("body").on('click',"#addNewUser",function(){
					var membersize=parseInt($("#membersize").val().length == null ? "0" : $("#membersize").val())+1;
					memberSize= "RSb-"+membersize;
					$("#memberid1").val(memberSize);
									
					});
				
				document.getElementById('memberid1').style.visibility='hidden';
				
				
					
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
		$('#name').keyup(function() {
		    var $th = $(this);
		    $th.val( $th.val().replace(/[^a-zA-Z]/g, function(str) 
		    {
		    	
		    	return ''; 
		    } 
		  ) );
		});
		
		$("#age").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
       /*  if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });	
  	  
  	  $("#phone").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    /* 
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });	
  	   $("#res").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
        /* if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });		
						
		$("#cell").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
        /* if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  
  	  $("#fsalary").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
       /*  if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  $("#fbusiness").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
       /*  if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  $("#frent").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
        /* if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  $("#fsource").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
       /*  if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  /*$('#pannumber').keyup(function() {
		    var $th = $(this);
		    $th.val( $th.val().replace(/[^a-zA-Z0-9]/g, function(str) 
		    {
		    	
		    	return ''; 
		    } 
		  ) );
		});
  	   $("#aadhaarnumber").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
            
  	  });*/
  	  $("#shareamount").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
       /*  if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  $("#openingbalance").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
       /*  if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
  	  
  	   $("#pin").keydown(function (e) {
         if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
               (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
                  (e.keyCode >= 35 && e.keyCode <= 40)) {
                       return;
        }
    
        /* if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        } */
            
  	  });
				
				$("#updat").click(function(){
					//alert(' Account number cannot be changed');
					
					var rowId1 = {slno: $(this).attr('data-id'),
							
					 bankname : $("#bankname").val(),
					 bankcode : $("#bankcode").val(),
					 memberid : $("#memberid").val(),
					 memberid1 : $("#memberid1").val(),
					 accountno : $("#accountno").val(),
					 userName : $("#userName").val(),
					 password : $("#password").val(),
					 name : $("#name").val(),
					 gender : $("#gender").val(),
					 age : $("#age").val(),
					 phone : $("#phone").val(),
					 res : $("#res").val(),
					 cell : $("#cell").val(),
					 qualification : $("#qualification").val(),
					 caste : $("#caste").val(),
					 occupation : $("#occupation").val(),
					 address : $("#address").val(),
					 paddress : $("#paddress").val(),
					 fsalary : $("#fsalary").val(),
					 fbusiness : $("#fbusiness").val(),
					 frent : $("#frent").val(),
					 fsource : $("#fsource").val(),
					 afhname : $("#afhname").val(),
					 idoccupation : $("#idoccupation").val(),
					 idaddress : $("#idaddress").val(),
					 omembership : $("#omembership").val(),
					 ipapplicant : $("#ipapplicant").val(),
					 membersociety : $("#membersociety").val(),
					 nmname : $("#nmname").val(),
					 relation : $("#relation").val(),
					 nmaddress : $("#nmaddress").val(),
					 name1 : $("#name1").val(),
					 accountno1 : $("#accountno1").val(),
					 name2 : $("#name2").val(),
					 accountno2 : $("#accountno2").val(),
					 shareamount :  $("#shareamount").val(),
					 openingbalance  : $("#openingbalance").val(),
					 obtype  : $("#obtype").val(),
					 subgroup : $("#subgroup").val(),
					 maingroup : $("#maingroup").val(),
							
							}
							
						 $.ajax({
							url: 'rsupdate.action',
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
				
				$("#deleteval").click(function(){
					
					
					 var slno = $(this).attr('data-id');
					var accountno = $("#accountno").val();
					
					$.ajax({
							url: 'rsdelete.action',
							data: {slno: slno,
								   accountno:accountno},
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
								$("#regularshare").trigger('click');
							}
						});  
					
				}); 
			
		</script>

	<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function readURL1(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah1').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah2').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function readURL3(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah3').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
 $(function(){
    $('#pcheck').click(function(){
      $('#pflatno').val($('#flatno').val());
      $('#paddress').val($('#address').val());
      $('#paddress2').val($('#caddress2').val());
      $('#plandmark').val($('#landmark').val());
      $('#pcity').val($('#city').val());
      $('#pdistrict').val($('#district').val());
      $('#pstate').val($('#state').val());
      $('#ppin').val($('#cpin').val());
    });
});
 


	</script> 
</body>
</html>






