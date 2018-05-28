<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	Integer number = (Integer) session.getAttribute("membersize");
%>

<%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"%>

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

.form-group .required .control-label:after {
	content: "*";
	color: red;
	content-size: 10px;
}
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height:520px;
    overflow-y: auto;
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
					<h3 class="modal-title" id="myModalLabel">PersonalLoan</h3>
				</div>

				<div class="modal-body">
					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Personal Loan</legend>

						<div class="row">
							<div class="ui-widget">
								<div class="col-sm-3">
									<div class="form-group">
										<div class="form-group required">
											<label class="control-label">MemberId</label><br /> <select
												placeholder="" id="combobox">
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
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Loan Type</label> <select
											id="loantype" class="form-control">
											<option value="Select">Select</option>
											<option value="Personal Loan">Personal Loan</option>
											<option value="Medical Loan">Medical Loan</option>
											<option value="Educational Loan">Educational Loan</option>
										</select>
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Account No</label> <input type="text"
										id="loanaccountno" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Number</label> <input type="text" id="loannumber"
										autocomplete="off" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Customer Name</label> <input
											type="text" id="name" autocomplete="off" class="form-control"
											readonly="readonly" />

									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Name of the Father /
											Husband Name</label> <input type="text" id="husbandname"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Age</label> <input type="text"
											id="age" autocomplete="off" class="form-control"
											maxlength="2" readonly="readonly" />
									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Occupation</label> <input
											type="text" id="occupation" autocomplete="off"
											class="form-control" readonly="readonly" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Phone</label> <input type="text"
											id="phone" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Residential number</label> <input
											type="text" id="residentialnumber" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>




							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Mobile No</label> <input
											type="text" id="cell" autocomplete="off" class="form-control"
											readonly="readonly" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Are You Relate to Member
											Of Committee</label> <input type="text" id="memberofcommittee"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Do they belongs to SC /
											ST</label> <input type="text" id="belongsSCST" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Monthly income Rs</label> <input
											type="text" id="monthlyincome" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Attested any Income
											Certificate from Salary / Rent / Business</label> <input type="text"
											id="incomecertificate" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Details of Immovable
											Property</label> <input type="text" id="immovableproperty"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Estimated value of
											Property</label> <input type="text" id="estimatedproperty"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Loan Duration</label> <input
											type="text" id="loanduration" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>





							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Purpose of Loan</label> <input
											type="text" id="loanpurpose" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Details of the member of
											society</label> <input type="text" id="memberofsociety"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

						</div>



						<div class="row">

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Office Address</label>
										<textarea class="form-control" id="officeaddress"></textarea>
									</div>
								</div>
							</div>




							<div class="col-sm-3">
								<div class="form-group">
									<label>Residential Address</label>
									<textarea class="form-control" id="paddress"
										readonly="readonly"></textarea>
								</div>
							</div>
						
						
						<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Amount</label> <input type="text" id="loannumber"
										autocomplete="off" class="form-control" />
								</div>
							</div>
							<div class="col-sm-3">
									<div class="form-group">
										<label>Rate Of Interest</label> <input type="text"
											id="rateofint" autocomplete="off" class="form-control" />
									</div>
								</div>
</div>




					</fieldset>

					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Surety Details 1</legend>

						<div class="row">
							<div class="ui-widget">
								<div class="col-sm-3">
									<div class="form-group">

										<label class="control-label">MemberId</label> <select
											id="memidone" class="form-control">
											<option value=""></option>
											<s:iterator id="personalbean"
												value="#session.personalacclist" status="i">
												<option value="${personalbean}">${personalbean}</option>
											</s:iterator>
										</select>

									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Customer Name</label> <input
											type="text" id="custnameone" autocomplete="off"
											class="form-control" />
									</div>
								</div>

							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Name of the Father /
											Husband Name</label> <input type="text" id="husbnameone"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Age</label> <input type="text"
											id="ageone" autocomplete="off" class="form-control"
											maxlength="2" />
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Residential number</label> <input
											type="text" id="resnumberone" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Mobile No</label> <input
											type="text" id="mobnumberone" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Are You Relate to Member
											Of Committee</label> <input type="text" id="membercommitteeone"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Do they belongs to SC /
											ST</label> <input type="text" id="SCSTone" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Monthly income Rs</label> <input
											type="text" id="mincomeone" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Attested any Income
											Certificate from Salary / Rent / Business</label> <input type="text"
											id="salaryone" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Details of Immovable
											Property</label> <input type="text" id="immovablepropsone"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Estimated value of
											Property</label> <input type="text" id="estimatedpropsone"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Office Address</label>
										<textarea class="form-control" id="officeaddsone"></textarea>
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Residential Address</label>
										<textarea class="form-control" id="resaddressone"></textarea>
									</div>
								</div>
							</div>
						</div>
					</fieldset>

					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Surety Details 2</legend>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">MemberId</label> <select
											id="memberidstwo" class="form-control">
											<option value=""></option>
											<s:iterator id="personalbean"
												value="#session.personalacclist" status="i">
												<option value="${personalbean}">${personalbean}</option>
											</s:iterator>
										</select>
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Customer Name</label> <input
											type="text" id="customernamestwo" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Name of the Father /
											Husband Name</label> <input type="text" id="husbandnamestwo"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Age</label> <input type="text"
											id="agestwo" autocomplete="off" class="form-control"
											maxlength="2" />
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Residential number</label> <input
											type="text" id="resnostwo" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Mobile No</label> <input
											type="text" id="mobilenostwo" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Are You Relate to Member
											Of Committee</label> <input type="text" id="committeestwo"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Do they belongs to SC /
											ST</label> <input type="text" id="SCSTtwo" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Monthly income Rs</label> <input
											type="text" id="mincomestwo" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Attested any Income
											Certificate from Salary / Rent / Business</label> <input type="text"
											id="Salarystwo" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Details of Immovable
											Property</label> <input type="text" id="ImmovablePropertystwo"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Estimated value of
											Property</label> <input type="text" id="estimatedpropstwo"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Office Address</label>
										<textarea class="form-control" id="officestwo"></textarea>
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Residential Address</label>
										<textarea class="form-control" id="resdstwo"></textarea>
									</div>
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
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<fieldset>
		<legend> Personal Loan </legend>
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
						<th>MemberId</th>
						<th>Loan Type</th>
						<th>Loan Account No</th>
						<th>Customer Name</th>
						<th>Age</th>
						<th>Occupation</</th>
						<th>Phone</th>

					</tr>
				</thead>
			</table>
		</div>
	</div>



	<button type="button" data-toggle="modal" data-target="#basicModal"
		data-backdrop="static" data-keyboard="false">NEW</button>

	<input type="hidden" id="membersize"
		value="<%=session.getAttribute("membersize")%>" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#submit").click(function() {

				var memberid = $('#combobox').val();
				var loantype = $('#loantype').val();
				var loanaccountno = $('#loanaccountno').val();
				var loannumber = $('#loannumber').val();
				var name = $('#name').val();
				var husbandname = $('#husbandname').val();
				var age = $('#age').val();
				var occupation = $('#occupation').val();
				var phone = $('#phone').val();
				var residentialnumber = $('#residentialnumber').val();
				var cell = $('#cell').val();

				var memberofcommittee = $('#memberofcommittee').val();
				var belongsSCST = $('#belongsSCST').val();
				var monthlyincome = $('#monthlyincome').val();
				var incomecertificate = $('#incomecertificate').val();
				var immovableproperty = $('#immovableproperty').val();
				var estimatedproperty = $('#estimatedproperty').val();
				var loanduration = $('#loanduration').val();
				var loanpurpose = $('#loanpurpose').val();
				var memberofsociety = $('#memberofsociety').val();
				var officeaddress = $('#officeaddress').val();

				var paddress = $('#paddress').val();
				var memidone = $('#memidone').val();
				var custnameone = $('#custnameone').val();
				var husbnameone = $('#husbnameone').val();
				var ageone = $('#ageone').val();
				var resnumberone = $('#resnumberone').val();
				var mobnumberone = $('#mobnumberone').val();
				var membercommitteeone = $('#membercommitteeone').val();
				var SCSTone = $('#SCSTone').val();
				var mincomeone = $('#mincomeone').val();

				var salaryone = $('#salaryone').val();
				var immovablepropsone = $('#immovablepropsone').val();
				var estimatedpropsone = $('#estimatedpropsone').val();
				var officeaddsone = $('#officeaddsone').val();
				var resaddressone = $('#resaddressone').val();

				var memberidstwo = $('#memberidstwo').val();
				var customernamestwo = $('#customernamestwo').val();
				var husbandnamestwo = $('#husbandnamestwo').val();
				var agestwo = $('#agestwo').val();
				var resnostwo = $('#resnostwo').val();
				var mobilenostwo = $('#mobilenostwo').val();
				var committeestwo = $('#committeestwo').val();
				var SCSTtwo = $('#SCSTtwo').val();
				var mincomestwo = $('#mincomestwo').val();
				var Salarystwo = $('#Salarystwo').val();
				var ImmovablePropertystwo = $('#ImmovablePropertystwo').val();
				var estimatedpropstwo = $('#estimatedpropstwo').val();
				var officestwo = $('#officestwo').val();
				var resdstwo = $('#resdstwo').val();

				 	 /*  if ($.trim(loantype).length == 0) {
				 alert("Provide loantype");
				 } else if ($.trim(husbandname).length == 0) {
				 alert("Provide husbandname");
				 }  else if ($.trim(phone).length == 0) {
				 alert("Provide phone");
				 } else if ($.trim(residentialnumber).length == 0) {
				 alert("Provide residentialnumber");
				 }
				
				 else if ($.trim(memberofcommittee).length == 0) {
				 alert("Provide memberofcommittee");
				 } else if ($.trim(belongsSCST).length == 0) {
				 alert("Provide belongsSCST");
				 } else if ($.trim(monthlyincome).length == 0) {
				 alert("Provide monthlyincome");
				 } else if ($.trim(incomecertificate).length == 0) {
				 alert("Provide incomecertificate");
				 } else if ($.trim(immovableproperty).length == 0) {
				 alert("Provide immovableproperty");
				 } else if ($.trim(estimatedproperty).length == 0) {
				 alert("Provide estimatedproperty");
				 } else if ($.trim(loanduration).length == 0) {
				 alert("Provide loanduration");
				 } else if ($.trim(loanpurpose).length == 0) {
				 alert("Provide loanpurpose");
				 } else if ($.trim(memberofsociety).length == 0) {
				 alert("Provide memberofsociety");
				 } else if ($.trim(officeaddress).length == 0) {
				 alert("Provide officeaddress");

				 }	
				
				
				 else if ($.trim(custnameone).length == 0) {
				 alert("Provide custnameone");
				 } else if ($.trim(husbnameone).length == 0) {
				 alert("Provide husbnameone");
				 } else if ($.trim(ageone).length == 0) {
				 alert("Provide ageone");
				 } else if ($.trim(resnumberone).length == 0) {
				 alert("Provide resnumberone");
				 } else if ($.trim(mobnumberone).length == 0) {
				 alert("Provide mobnumberone");
				 } else if ($.trim(membercommitteeone).length == 0) {
				 alert("Provide membercommitteeone");
				 } else if ($.trim(SCSTone).length == 0) {
				 alert("Provide SCSTone");
				 } else if ($.trim(mincomeone).length == 0) {
				 alert("Provide mincomeone");
				 }
				
				
				 else if ($.trim(salaryone).length == 0) {
				 alert("Provide salaryone");
				 } else if ($.trim(immovablepropsone).length == 0) {
				 alert("Provide immovablepropsone");
				 } else if ($.trim(estimatedpropsone).length == 0) {
				 alert("Provide estimatedpropsone");
				 } else if ($.trim(officeaddsone).length == 0) {
				 alert("Provide officeaddsone");
				 } else if ($.trim(resaddressone).length == 0) {
				 alert("resaddressone");
				 }

				
				 else if ($.trim(customernamestwo).length == 0) {
				 alert("Provide customernamestwo");
				 } else if ($.trim(husbandnamestwo).length == 0) {
				 alert("Provide husbandnamestwo");
				 } else if ($.trim(agestwo).length == 0) {
				 alert("Provide agestwo");
				 } else if ($.trim(resnostwo).length == 0) {
				 alert("Provide resnostwo");
				 } else if ($.trim(mobilenostwo).length == 0) {
				 alert("Provide mobilenostwo");
				 } else if ($.trim(committeestwo).length == 0) {
				 alert("Provide committeestwo");
				 } else if ($.trim(SCSTtwo).length == 0) {
				 alert("Provide SCSTtwo");
				 } else if ($.trim(mincomestwo).length == 0) {
				 alert("Provide mincomestwo");
				 } else if ($.trim(Salarystwo).length == 0) {
				 alert("Provide Salarystwo");
				 } else if ($.trim(ImmovablePropertystwo).length == 0) {
				 alert("Provide ImmovablePropertystwo");
				 } else if ($.trim(estimatedpropstwo).length == 0) {
				 alert("Provide estimatedpropstwo");
				 } else if ($.trim(officestwo).length == 0) {
				 alert("Provide officestwo");
				 } else if ($.trim(resdstwo).length == 0) {
				 alert("Provide resdstwo");
				 }

				 else {  */
				var parms = {
					memberid : memberid,
					loantype : loantype,
					loanaccountno : loanaccountno,
					loannumber : loannumber,
					name : name,
					husbandname : husbandname,
					age : age,
					occupation : occupation,
					phone : phone,
					residentialnumber : residentialnumber,
					cell : cell,
					memberofcommittee : memberofcommittee,

					belongsSCST : belongsSCST,
					monthlyincome : monthlyincome,
					incomecertificate : incomecertificate,
					immovableproperty : immovableproperty,
					estimatedproperty : estimatedproperty,
					loanduration : loanduration,
					loanpurpose : loanpurpose,
					memberofsociety : memberofsociety,
					officeaddress : officeaddress,
					paddress : paddress,

					memidone : memidone,
					custnameone : custnameone,
					husbnameone : husbnameone,
					ageone : ageone,
					resnumberone : resnumberone,
					mobnumberone : mobnumberone,
					membercommitteeone : membercommitteeone,
					SCSTone : SCSTone,
					mincomeone : mincomeone,
					salaryone : salaryone,
					immovablepropsone : immovablepropsone,
					estimatedpropsone : estimatedpropsone,
					officeaddsone : officeaddsone,
					resaddressone : resaddressone,

					memberidstwo : memberidstwo,
					customernamestwo : customernamestwo,
					husbandnamestwo : husbandnamestwo,
					agestwo : agestwo,
					resnostwo : resnostwo,
					mobilenostwo : mobilenostwo,
					committeestwo : committeestwo,
					SCSTtwo : SCSTtwo,
					mincomestwo : mincomestwo,
					Salarystwo : Salarystwo,
					ImmovablePropertystwo : ImmovablePropertystwo,
					estimatedpropstwo : estimatedpropstwo,
					officestwo : officestwo,
					resdstwo : resdstwo

				};
				$.ajax({
					type : "POST",
					url : "personal.action",
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
							alert("Data Inserted Sucessfully");
							window.location.href = "index.jsp";

						}
					}

				});
				/*   }   */
			});
		});

		$("body")
				.on(
						'click',
						"#submit",
						function() {
							var membersize = parseInt($("#membersize").val().length == null ? "0"
									: $("#membersize").val()) + 1;
							memberSize = "PL-" + membersize;
							$("#loanaccountno").val(memberSize);

						});

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

			$('.ui-widget').click(function() {

				$.ajax({
					url : 'accountname.action',
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
						$("#paddress").val(str1);
						$("#occupation").val(str2);
						$("#age").val(data.entityName4);

					}
				});

			});

			$('#memidone').click(function() {

				$.ajax({
					url : 'accountname.action',
					dataType : "json",
					data : {
						memberid : $("#memidone").val()
					},
					success : function(data) {
						var entityName = data.entityName;
						var entityName2 = data.entityName2;
						var entityName3 = data.entityName3;
						var entityName4 = data.entityName4;

						var str = data.entityName.replace(/\"/g, "")
						var str1 = data.entityName2.replace(/\"/g, "")
						var str2 = data.entityName3.replace(/\"/g, "")

						$("#custnameone").val(str);
						$("#resaddressone").val(str1);
						$("#ageone").val(data.entityName4);

					}
				});

			});

			$('#memberidstwo').click(function() {

				$.ajax({
					url : 'accountname.action',
					dataType : "json",
					data : {
						memberid : $("#memberidstwo").val()
					},
					success : function(data) {
						var entityName = data.entityName;
						var entityName2 = data.entityName2;
						var entityName3 = data.entityName3;
						var entityName4 = data.entityName4;

						var str = data.entityName.replace(/\"/g, "")
						var str1 = data.entityName2.replace(/\"/g, "")
						var str2 = data.entityName3.replace(/\"/g, "")

						$("#customernamestwo").val(str);
						$("#resdstwo").val(str1);
						$("#agestwo").val(data.entityName4);

					}
				});

			});

		});
	</script>
</body>
</html>

