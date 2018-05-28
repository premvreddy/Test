<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
					<h4 class="modal-title" id="myModalLabel">Home Loan
						Application</h4>
				</div>

				<div class="modal-body">
					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Home Loan</legend>

						<div class="row">
							<div class="col-xs-3">
								<div class="form-group">
									<div class='input-group date' data-provide="datepicker"
										data-date-autoclose="true" data-date-today-btn="linked"
										data-date-today-highlight="true" data-date-format="dd.mm.yyyy">
										<label> Date </label><input id="tDate"
											class="form-control date"
											value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span>
									</div>
								</div>
							</div>

							<div class="ui-widget">
								<div class="col-sm-3">
									<div class="form-group">
										<label>MemberId</label><br /> <select placeholder="MemberId"
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
									<label>Loan Type</label> <select id="loantype"
										class="form-control">
										<option value="Select">Select</option>
										<option value="Home Loan">Home loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Medical Loan">Medical Loan</option>
										<option value="Educational Loan">Educational Loan</option>
									</select>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Account No</label> <input type="text"
										readonly="readonly" id="laccount" autocomplete="off"
										class="form-control" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label> Loan Number</label> <input type="text" id="loannumber"
										autocomplete="off" class="form-control" />

								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label> Customer Name</label> <input type="text"
										id="applicantname" autocomplete="off" class="form-control" />

								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Occupation</label> <input type="text" id="occupation"
										autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Name of the Father / Husband Name</label> <input
										type="text" id="husbandname" autocomplete="off"
										class="form-control" />
								</div>
							</div>
						</div>

						<div class="row">

							<div class="col-sm-3">
								<div class="form-group">
									<label>Age</label> <input type="text" id="age"
										autocomplete="off" class="form-control" maxlength="2" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Phone : Rsidence</label> <input type="text" id="phone"
										autocomplete="off" class="form-control" />
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
									<label>Are You Relate to Member Of Committee</label> <input
										type="text" id="memberofcommittee" autocomplete="off"
										class="form-control" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label> Do they belongs to SC / ST</label> <input type="text"
										id="scst" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Monthly income Rs</label> <input type="text"
										id="mincome" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Attested any Income Certificate from Salary /
										Rent / Business</label> <input type="text" id="certificate"
										autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Details of Immovable Property</label> <input type="text"
										id="immovableprop" autocomplete="off" class="form-control" />
								</div>
							</div>
						</div>

						<div class="row">

							<div class="col-sm-3">
								<div class="form-group">
									<label>Estimated value of Property</label> <input type="text"
										id="estimatedprop" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Duration</label> <input type="text"
										id="loanduration" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Purpose of Loan</label> <input type="text"
										id="loanpurpose" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Details of the member of society</label> <input
										type="text" id="memberofsociety" autocomplete="off"
										class="form-control" />
								</div>
							</div>
						</div>

						<div class="row">

							<div class="col-sm-3">
								<div class="form-group">
									<label>Office Address</label>
									<textarea class="form-control" id="officeaddress"></textarea>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Residential Address</label>
									<textarea class="form-control" id="resaddress"></textarea>
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

						<legend class="scheduler-border">Surity Details 1</legend>


						<h4 class="modal-title" id="myModalLabel">Details of the
							Surity 1</h4>

						<div class="row">
							<%-- <div class="ui-widget">
			<div class="col-sm-3">
				<div class="form-group">
				<label>MemberId</label>
					<select id="memberId1" class="form-control">
						<option value=""></option>
							<s:iterator id="hmbean" value="#session.nominalist" status="i">
												<option 
													value="${hmbean}">${hmbean}</option>
											</s:iterator> 
						</select>
				</div>
			</div>
			</div>--%>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Memberid</label><select id="memberId1"
										class="form-control">
										<option value=""></option>
										<s:iterator id="hmbean" value="#session.nominalist" status="i">
											<option value="${hmbean}">${hmbean}</option>
										</s:iterator>
									</select>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label> Customer Name</label> <input type="text"
										id="applicantname1" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Name of the Father / Husband Name</label> <input
										type="text" id="husbandname1" autocomplete="off"
										class="form-control" />
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<label>Age</label> <input type="text" id="age1"
										autocomplete="off" class="form-control" maxlength="2" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Residential number</label> <input type="text"
										id="resno1" autocomplete="off" class="form-control" />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Mobile No</label> <input type="text" id="mobileno1"
										autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Are You Relate to Member Of Committee</label> <input
										type="text" id="memberofcommittee1" autocomplete="off"
										class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Do they belongs to SC / ST</label> <input type="text"
										id="scst1" autocomplete="off" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Monthly income Rs</label> <input type="text"
										id="mincome1" autocomplete="off" class="form-control" />
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<label>Attested any Income Certificate from Salary /
										Rent / Business</label> <input type="text" id="certificate1"
										autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Details of Immovable Property</label> <input type="text"
										id="immovableprop1" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Estimated value of Property</label> <input type="text"
										id="estimatedprop1" autocomplete="off" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Details of the Members of the society, if any</label> <input
										type="text" id="details1" autocomplete="off"
										class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label> Occupation & Office Address</label>
									<textarea class="form-control" id="officeaddress1"></textarea>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Residential Address</label>
									<textarea class="form-control" id="resaddress1"></textarea>
								</div>
							</div>
						</div>
					</fieldset>

					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Surity Details 2</legend>


						<h4 class="modal-title" id="myModalLabel">Details of the
							Surity 2</h4>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Memberid</label><select id="memberId2"
										class="form-control">
										<option value=""></option>
										<s:iterator id="hmbean" value="#session.nominalist" status="i">
											<option value="${hmbean}">${hmbean}</option>
										</s:iterator>
									</select>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label> Customer Name</label> <input type="text"
										id="applicantname2" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Name of the Father / Husband Name</label> <input
										type="text" id="husbandname2" autocomplete="off"
										class="form-control" />
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<label>Age</label> <input type="text" id="age2"
										autocomplete="off" class="form-control" maxlength="2" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Residential number</label> <input type="text"
										id="resno2" autocomplete="off" class="form-control" />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Mobile No</label> <input type="text" id="mobileno2"
										autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Are You Relate to Member Of Committee</label> <input
										type="text" id="memberofcommittee2" autocomplete="off"
										class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Do they belongs to SC / ST</label> <input type="text"
										id="scst2" autocomplete="off" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Monthly income Rs</label> <input type="text"
										id="mincome2" autocomplete="off" class="form-control" />
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">
									<label>Attested any Income Certificate from Salary /
										Rent / Business</label> <input type="text" id="certificate2"
										autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Details of Immovable Property</label> <input type="text"
										id="immovableprop2" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Estimated value of Property</label> <input type="text"
										id="estimatedprop2" autocomplete="off" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Details of the Members of the society, if any</label> <input
										type="text" id="details2" autocomplete="off"
										class="form-control" />
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label> Occupation & Office Address</label>
									<textarea class="form-control" id="officeaddress2"></textarea>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Residential Address</label>
									<textarea class="form-control" id="resaddress2"></textarea>
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
		<legend> Home Loan Account Application </legend>
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
						<th>Slno</th>
						<th class="abc">tDate</th>
						<th>MemberId</th>
						<th class="abc">loantype</th>
						<th class="abc">laccount</th>
						<th class="abc">loannumber</th>
						<th>applicantname</th>
						<th class="abc">occupation</th>
						<th class="abc">husbandname</th>
						<th class="abc">age</th>
						<th class="abc">phone</th>
						<th class="abc">mobileno</th>
						<th class="abc">memberofcommittee</th>
						<th class="abc">scst</th>
						<th class="abc">mincome</th>
						<th class="abc">certificate</th>
						<th class="abc">immovableprop</th>
						<th class="abc">estimatedprop</th>
						<th class="abc">loanduration</th>
						<th class="abc">loanpurpose</th>
						<th class="abc">memberofsociety</th>
						<th class="abc">officeaddress</th>
						<th class="abc">resaddress</th>
						<th class="abc">memberId1</th>
						<th class="abc">applicantname1</th>
						<th class="abc">husbandname1</th>
						<th class="abc">age1</th>
						<th class="abc">resno1</th>
						<th class="abc">mobileno1</th>
						<th class="abc">memberofcommittee1</th>
						<th class="abc">scst1</th>
						<th class="abc">mincome1</th>
						<th class="abc">certificate1</th>
						<th class="abc">immovableprop1</th>
						<th class="abc">estimatedprop1</th>
						<th class="abc">details1</th>
						<th class="abc">officeaddress1</th>
						<th class="abc">resaddress1</th>
						<th class="abc">memberId2</th>
						<th class="abc">applicantname2</th>
						<th class="abc">husbandname2</th>
						<th class="abc">age2</th>
						<th class="abc">resno2</th>
						<th class="abc">mobileno2</th>
						<th class="abc">memberofcommittee2</th>
						<th class="abc">scst2</th>
						<th class="abc">mincome2</th>
						<th class="abc">certificate2</th>
						<th class="abc">immovableprop2</th>
						<th class="abc">estimatedprop2</th>
						<th class="abc">details2</th>
						<th class="abc">officeaddress2</th>
						<th class="abc">resaddress2</th>


					</tr>
				</thead>
				<tbody>
					<s:iterator id="homebean" value="#session.homelist" status="i">
						<tr>
							<%-- <td>${regularbean.slno}<input type="hidden"
								value="${regularbean.slno}" /></td> --%>

							<td>${homebean.slno}<input type="hidden"
								value="${homebean.slno}" /></td>

							<td class="abc">${homebean.tDate}<input type="hidden"
								value="${homebean.tDate}" /></td>

							<td>${homebean.memberid}<input type="hidden"
								value="${homebean.memberid}" /></td>

							<td class="abc">${homebean.loantype}<input type="hidden"
								value="${homebean.loantype}" /></td>

							<td class="abc">${homebean.laccount}<input type="hidden"
								value="${homebean.laccount}" /></td>

							<td class="abc">${homebean.loannumber}<input type="hidden"
								value="${homebean.loannumber}" /></td>

							<td>${homebean.applicantname}<input type="hidden"
								value="${homebean.applicantname}" /></td>

							<td class="abc">${homebean.occupation}<input type="hidden"
								value="${homebean.occupation}" /></td>

							<td class="abc">${homebean.husbandname}<input type="hidden"
								value="${homebean.husbandname}" /></td>

							<td class="abc">${homebean.age}<input type="hidden"
								value="${homebean.age}" /></td>

							<td class="abc">${homebean.phone}<input type="hidden"
								value="${homebean.phone}" /></td>

							<td class="abc">${homebean.mobileno}<input type="hidden"
								value="${homebean.mobileno}" /></td>

							<td class="abc">${homebean.memberofcommittee}<input
								type="hidden" value="${homebean.memberofcommittee}" /></td>

							<td class="abc">${homebean.scst}<input type="hidden"
								value="${homebean.scst}" /></td>

							<td class="abc">${homebean.mincome}<input type="hidden"
								value="${homebean.mincome}" /></td>

							<td class="abc">${homebean.certificate}<input type="hidden"
								value="${homebean.certificate}" /></td>

							<td class="abc">${homebean.immovableprop}<input
								type="hidden" value="${homebean.immovableprop}" /></td>

							<td class="abc">${homebean.estimatedprop}<input
								type="hidden" value="${homebean.estimatedprop}" /></td>

							<td class="abc">${homebean.loanduration}<input type="hidden"
								value="${homebean.loanduration}" /></td>

							<td class="abc">${homebean.loanpurpose}<input type="hidden"
								value="${homebean.loanpurpose}" /></td>

							<td class="abc">${homebean.memberofsociety}<input
								type="hidden" value="${homebean.memberofsociety}" /></td>

							<td class="abc">${homebean.officeaddress}<input
								type="hidden" value="${homebean.officeaddress}" /></td>

							<td class="abc">${homebean.resaddress}<input type="hidden"
								value="${homebean.resaddress}" /></td>

							<td class="abc">${homebean.memberId1}<input type="hidden"
								value="${homebean.memberId1}" /></td>

							<td class="abc">${homebean.applicantname1}<input
								type="hidden" value="${homebean.applicantname1}" /></td>

							<td class="abc">${homebean.husbandname1}<input type="hidden"
								value="${homebean.husbandname1}" /></td>

							<td class="abc">${homebean.age1}<input type="hidden"
								value="${homebean.age1}" /></td>

							<td class="abc">${homebean.resno1}<input type="hidden"
								value="${homebean.resno1}" /></td>

							<td class="abc">${homebean.mobileno1}<input type="hidden"
								value="${homebean.mobileno1}" /></td>

							<td class="abc">${homebean.memberofcommittee1}<input
								type="hidden" value="${homebean.memberofcommittee1}" /></td>

							<td class="abc">${homebean.scst1}<input type="hidden"
								value="${homebean.scst1}" /></td>

							<td class="abc">${homebean.mincome1}<input type="hidden"
								value="${homebean.mincome1}" /></td>

							<td class="abc">${homebean.certificate1}<input type="hidden"
								value="${homebean.certificate1}" /></td>

							<td class="abc">${homebean.immovableprop1}<input
								type="hidden" value="${homebean.immovableprop1}" /></td>

							<td class="abc">${homebean.estimatedprop1}<input
								type="hidden" value="${homebean.estimatedprop1}" /></td>

							<td class="abc">${homebean.details1}<input type="hidden"
								value="${homebean.details1}" /></td>

							<td class="abc">${homebean.officeaddress1}<input
								type="hidden" value="${homebean.officeaddress1}" /></td>

							<td class="abc">${homebean.resaddress1}<input type="hidden"
								value="${homebean.resaddress1}" /></td>

							<td class="abc">${homebean.memberId2}<input type="hidden"
								value="${homebean.memberId2}" /></td>

							<td class="abc">${homebean.applicantname2}<input
								type="hidden" value="${homebean.applicantname2}" /></td>

							<td class="abc">${homebean.husbandname2}<input type="hidden"
								value="${homebean.husbandname2}" /></td>

							<td class="abc">${homebean.age2}<input type="hidden"
								value="${homebean.age2}" /></td>

							<td class="abc">${homebean.resno2}<input type="hidden"
								value="${homebean.resno2}" /></td>

							<td class="abc">${homebean.mobileno2}<input type="hidden"
								value="${homebean.mobileno2}" /></td>

							<td class="abc">${homebean.memberofcommittee2}<input
								type="hidden" value="${homebean.memberofcommittee2}" /></td>

							<td class="abc">${homebean.scst2}<input type="hidden"
								value="${homebean.scst2}" /></td>

							<td class="abc">${homebean.mincome2}<input type="hidden"
								value="${homebean.mincome2}" /></td>

							<td class="abc">${homebean.certificate2}<input type="hidden"
								value="${homebean.certificate2}" /></td>

							<td class="abc">${homebean.immovableprop2}<input
								type="hidden" value="${homebean.immovableprop2}" /></td>

							<td class="abc">${homebean.estimatedprop2}<input
								type="hidden" value="${homebean.estimatedprop2}" /></td>

							<td class="abc">${homebean.details2}<input type="hidden"
								value="${homebean.details2}" /></td>

							<td class="abc">${homebean.officeaddress2}<input
								type="hidden" value="${homebean.officeaddress2}" /></td>

							<td class="abc">${homebean.resaddress2}<input type="hidden"
								value="${homebean.resaddress2}" /></td>

						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>

	<button type="button" data-toggle="modal" data-target="#basicModal"
		data-backdrop="static" data-keyboard="false">NEW</button>
	<!-- <input type="button" class="rs-links" id="new1" value="NEW" /> -->

	<input type="hidden" id="membersize"
		value="<%=session.getAttribute("membersize")%>" />

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$("#addNewUser")
									.click(
											function() {

												var tDate = $.trim($('#tDate')
														.val());
												var memberid = $.trim($(
														'#combobox').val());
												var loantype = $.trim($(
														'#loantype').val());
												var laccount = $.trim($(
														'#laccount').val());
												var loannumber = $.trim($(
														'#loannumber').val());
												var applicantname = $
														.trim($(
																'#applicantname')
																.val());
												var occupation = $.trim($(
														'#occupation').val());
												var husbandname = $.trim($(
														'#husbandname').val());
												var age = $.trim($('#age')
														.val());
												var phone = $.trim($('#phone')
														.val());
												var mobileno = $.trim($(
														'#mobileno').val());
												var memberofcommittee = $
														.trim($(
																'#memberofcommittee')
																.val());
												var scst = $.trim($('#scst')
														.val());
												var mincome = $.trim($(
														'#mincome').val());
												var certificate = $.trim($(
														'#certificate').val());
												var immovableprop = $
														.trim($(
																'#immovableprop')
																.val());
												var estimatedprop = $
														.trim($(
																'#estimatedprop')
																.val());
												var loanduration = $.trim($(
														'#loanduration').val());
												var loanpurpose = $.trim($(
														'#loanpurpose').val());
												var memberofsociety = $.trim($(
														'#memberofsociety')
														.val());
												var officeaddress = $
														.trim($(
																'#officeaddress')
																.val());
												var resaddress = $.trim($(
														'#resaddress').val());
												var memberId1 = $.trim($(
														'#memberId1').val());
												var applicantname1 = $.trim($(
														'#applicantname1')
														.val());
												var husbandname1 = $.trim($(
														'#husbandname1').val());
												var age1 = $.trim($('#age1')
														.val());
												var resno1 = $
														.trim($('#resno1')
																.val());
												var mobileno1 = $.trim($(
														'#mobileno1').val());
												var memberofcommittee1 = $
														.trim($(
																'#memberofcommittee1')
																.val());
												var scst1 = $.trim($('#scst1')
														.val());
												var mincome1 = $.trim($(
														'#mincome1').val());
												var certificate1 = $.trim($(
														'#certificate1').val());
												var immovableprop1 = $.trim($(
														'#immovableprop1')
														.val());
												var estimatedprop1 = $.trim($(
														'#estimatedprop1')
														.val());
												var details1 = $.trim($(
														'#details1').val());
												var officeaddress1 = $.trim($(
														'#officeaddress1')
														.val());
												var resaddress1 = $.trim($(
														'#resaddress1').val());
												var memberId2 = $.trim($(
														'#memberId2').val());
												var applicantname2 = $.trim($(
														'#applicantname2')
														.val());
												var husbandname2 = $.trim($(
														'#husbandname2').val());
												var age2 = $.trim($('#age2')
														.val());
												var resno2 = $
														.trim($('#resno2')
																.val());
												var mobileno2 = $.trim($(
														'#mobileno2').val());
												var memberofcommittee2 = $
														.trim($(
																'#memberofcommittee2')
																.val());
												var scst2 = $.trim($('#scst2')
														.val());
												var mincome2 = $.trim($(
														'#mincome2').val());
												var certificate2 = $.trim($(
														'#certificate2').val());
												var immovableprop2 = $.trim($(
														'#immovableprop2')
														.val());
												var estimatedprop2 = $.trim($(
														'#estimatedprop2')
														.val());
												var details2 = $.trim($(
														'#details2').val());
												var officeaddress2 = $.trim($(
														'#officeaddress2')
														.val());
												var resaddress2 = $.trim($(
														'#resaddress2').val());

												if ($.trim(applicantname).length == 0) {
													alert("Provide Name");
												} else if ($.trim(laccount).length == 0) {
													alert("Provide Account Number");
												}

												else {
													var parms = {

														tDate : tDate,
														memberid : memberid,
														loantype : loantype,
														laccount : laccount,
														loannumber : loannumber,
														applicantname : applicantname,
														occupation : occupation,
														husbandname : husbandname,
														age : age,
														phone : phone,
														mobileno : mobileno,
														memberofcommittee : memberofcommittee,
														scst : scst,
														mincome : mincome,
														certificate : certificate,
														immovableprop : immovableprop,
														estimatedprop : estimatedprop,
														loanduration : loanduration,
														loanpurpose : loanpurpose,
														memberofsociety : memberofsociety,
														officeaddress : officeaddress,
														resaddress : resaddress,
														memberId1 : memberId1,
														applicantname1 : applicantname1,
														husbandname1 : husbandname1,
														age1 : age1,
														resno1 : resno1,
														mobileno1 : mobileno1,
														memberofcommittee1 : memberofcommittee1,
														scst1 : scst1,
														mincome1 : mincome1,
														certificate1 : certificate1,
														immovableprop1 : immovableprop1,
														estimatedprop1 : estimatedprop1,
														details1 : details1,
														officeaddress1 : officeaddress1,
														resaddress1 : resaddress1,
														memberId2 : memberId2,
														applicantname2 : applicantname2,
														husbandname2 : husbandname2,
														age2 : age2,
														resno2 : resno2,
														mobileno2 : mobileno2,
														memberofcommittee2 : memberofcommittee2,
														scst2 : scst2,
														mincome2 : mincome2,
														certificate2 : certificate2,
														immovableprop2 : immovableprop2,
														estimatedprop2 : estimatedprop2,
														details2 : details2,
														officeaddress2 : officeaddress2,
														resaddress2 : resaddress2,
													};
													$
															.ajax({
																type : "POST",
																url : "hlUser.action",
																dataType : "json",
																data : parms,
																success : function(
																		data) {

																	//data = eval('('+data+')');
																	var errorString = data.errorString;
																	var resultString = data.resultString;
																	if (resultString == "error") {
																		$(
																				"#loading")
																				.hide();
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
							$('#memberId1')
									.change(
											function() {
												$
														.ajax({
															url : 'getname.action',
															dataType : "json",
															data : {
																memberid : $(
																		"#memberId1")
																		.val()
															},
															success : function(
																	data) {
																var entityName = data.entityName;
																var entityName1 = data.entityName1;
																var entityName2 = data.entityName2;
																var entityName3 = data.entityName3;
																var entityName4 = data.entityName4;

																var str = data.entityName
																		.replace(
																				/\"/g,
																				"")
																var str1 = data.entityName1
																		.replace(
																				/\"/g,
																				"")
																var str2 = data.entityName2
																		.replace(
																				/\"/g,
																				"")
																var str3 = data.entityName3
																		.replace(
																				/\"/g,
																				"")
																var str4 = data.entityName4
																		.replace(
																				/\"/g,
																				"")

																$(
																		"#applicantname1")
																		.val(
																				str);
																$("#mobileno1")
																		.val(
																				str1);
																$(
																		"#resaddress1")
																		.val(
																				str2);
																$("#age1").val(
																		str3);
																$("#resno1")
																		.val(
																				str4);

															}
														});

											});

							$('#memberId2')
									.change(
											function() {
												$
														.ajax({
															url : 'getsurityname.action',
															dataType : "json",
															data : {
																memberid : $(
																		"#memberId2")
																		.val()
															},
															success : function(
																	data) {
																var entityName = data.entityName;
																var entityName1 = data.entityName1;
																var entityName2 = data.entityName2;
																var entityName3 = data.entityName3;
																var entityName4 = data.entityName4;

																var str = data.entityName
																		.replace(
																				/\"/g,
																				"")
																var str1 = data.entityName1
																		.replace(
																				/\"/g,
																				"")
																var str2 = data.entityName2
																		.replace(
																				/\"/g,
																				"")
																var str3 = data.entityName3
																		.replace(
																				/\"/g,
																				"")
																var str4 = data.entityName4
																		.replace(
																				/\"/g,
																				"")

																$(
																		"#applicantname2")
																		.val(
																				str);
																$("#mobileno2")
																		.val(
																				str1);
																$(
																		"#resaddress2")
																		.val(
																				str2);
																$("#age2").val(
																		str3);
																$("#resno2")
																		.val(
																				str4);

															}
														});

											});

						});

		$("body")
				.on(
						'click',
						"#addNewUser",
						function() {
							var memsize = parseInt($("#memsize").val().length == null ? "0"
									: $("#memsize").val()) + 1;
							memSize = "HL-" + memsize;
							$("#laccount").val(memSize);

						});
		/* 	$("body").on('click',"#addNewUser",function(){
			var memsize=parseInt($("#memsize").val().length == null ? "0" : $("#memsize").val())+1;
			memSize= "PL-"+memsize;
			$("#laccount").val(memSize);
							
			}); */

		$('#applicantname').keyup(function() {
			var $th = $(this);
			$th.val($th.val().replace(/[^a-zA-Z]/g, function(str) {

				return '';
			}));
		});

		$("#age").keypress(
				function(event) {
					var inputValue = event.charCode;
					//alert(inputValue);
					if (!((inputValue > 47 && inputValue < 58)
							|| (inputValue == 32) || (inputValue == 0))) {
						event.preventDefault();
					}
				});

		$("#mobileno").keypress(
				function(event) {
					var inputValue = event.charCode;
					//alert(inputValue);
					if (!((inputValue > 47 && inputValue < 58)
							|| (inputValue == 32) || (inputValue == 0))) {
						event.preventDefault();
					}
				});

		$("#officeaddress").keypress(
				function(event) {
					var inputValue = event.charCode;
					//alert(inputValue);
					if (!((inputValue > 64 && inputValue < 91)
							|| (inputValue > 96 && inputValue < 123)
							|| (inputValue == 32)
							|| (inputValue > 47 && inputValue < 58)
							|| (inputValue == 32) || (inputValue == 0))) {
						event.preventDefault();
					}
				});

		//<script type="text/javascript">

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

			$(".ui-widget").click(function() {

				$.ajax({
					url : 'homename.action',
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
						$("#applicantname").val(str);
						$("#resaddress").val(str1);
						$("#occupation").val(str2);
						$("#age").val(data.entityName4);

					}
				});

		});
		});
	</script>
</body>
</html>

