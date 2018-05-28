<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"%>

<%
	Integer number = (Integer) session.getAttribute("membersize");
%>
<s:set name="vehicleloan" value="#session.vehicleloanlist" />

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
	content: " * ";
	color: red;
	content-size: 10px;
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
					<h3 class="modal-title" id="myModalLabel">Vehicle Loan</h3>
				</div>
				<div class="modal-body">
					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Vehicle Loan</legend>


						<div class="row">
							<div class="ui-widget">
								<div class="col-sm-3">
									<div class="xyz">
										<div class="form-group">
											<label>MemberId</label><br /> <select placeholder=""
												id="combobox">
												<option value="" selected="selected"></option>

												<s:iterator id="vehiclebean" value="#session.vehicleacclist"
													status="i">
													<option value="${vehiclebean}">${vehiclebean}</option>
												</s:iterator>

											</select>
										</div>
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Account No</label> <input type="text"
										id="loanaccountnumber" autocomplete="off" class="form-control" />

								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Loan Number (Old)</label> <input
											type="text" id="loannumber" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>



							<div class="col-sm-3">
								<div class="form-group">

									<label>Full Name of the Applicant</label> <input type="text"
										id="name" autocomplete="off" class="form-control"
										readonly="readonly" />
								</div>

							</div>

						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">

									<label> Age</label> <input type="text" id="age"
										autocomplete="off" class="form-control" maxlength="2"
										readonly="readonly" />
								</div>
							</div>




							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Profession / Occupation</label> <input
											type="text" id="occupation" autocomplete="off"
											class="form-control" readonly="readonly" />
									</div>
								</div>
							</div>






							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Nationality</label> <select
											id="nationality" class="form-control" readonly="readonly">
											<option value="Indian">Indian</option>
										</select>
									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">What income you have ?</label> <input
											type="text" id="income" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Make & type of Vehicle</label> <input
											type="text" id="makevehicle" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>






							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Purpose for which it will
											be used?</label> <input type="text" id="usepurpose"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Purpose for which it
											will normally be kept</label> <input type="text" id="normalpurpose"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>


							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Father's Name</label> <input
											type="text" id="fathersname" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">What accidents (if any)
											have occurred to any article owned by you</label> <input type="text"
											id="accidentsoccurred" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>




							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Have you ever been
											bankrupt or insolvent/Have you ever arranged with your
											creditors</label> <input type="text" id="bankrupt" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Have you any
											property/investments? State particulars & amount & Whether
											encumbered giving title deed reference?</label> <input type="text"
											id="property" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>





							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Has any application been
											made to any Company for an article on Hire Purchase or other
											terms ? If so, give name of the company. Was application
											accepted ? Was contract completed ?</label> <input type="text"
											id="contract" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Father's name & Address</label>
										<textarea class="form-control" id="nameandaddress"></textarea>
									</div>
								</div>
							</div>




							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Permanent address</label>

										<textarea class="form-control" id="paddress"
											readonly="readonly"></textarea>
									</div>
								</div>
							</div>
							<div class="col-xs-3">
								<div class="form-group">
									<div class="form-group required">
										<div class='input-group date' data-provide="datepicker"
											data-date-autoclose="true" data-date-today-btn="linked"
											data-date-today-highlight="true"
											data-date-format="dd-mm-yyyy">
											<label class="control-label"> DOB </label><input id="dob"
												class="form-control date"
												value="<fmt:formatDate pattern='dd-MM-yyyy' value='<%=new java.util.Date()%>' />">
											<span class="input-group-addon"><span
												class="icon icon-calendar"></span> </span>
										</div>
									</div>
								</div>
							</div>

<div class="col-sm-3">
								<div class="form-group">
									<label>Loan Amount</label> <input type="text" id="loannumber"
										autocomplete="off" class="form-control" />
								</div>
							</div>
							
</div>
	<div class="row">
<div class="col-sm-3">
									<div class="form-group">
										<label>Rate Of Interest</label> <input type="text"
											id="rateofint" autocomplete="off" class="form-control" />
									</div>
								</div>
								</div>
						
					</fieldset>


					<fieldset class="scheduler-border">

						<legend class="scheduler-border">CO-OBLIGANTS</legend>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Full Name of
											Co-Obligant's</label> <input type="text" id="coobligantname"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Profession / Occupation</label> <input
											type="text" id="professions" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Details of Securities
											offered if any ?</label> <input type="text" id="securites"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Permanent address</label>
										<textarea class="form-control" id="permanentadd"></textarea>
									</div>
								</div>
							</div>


						</div>

					</fieldset>

					<fieldset class="scheduler-border">

						<legend class="scheduler-border">Details of Articles </legend>

						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Make</label> <input type="text"
											id="make" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Article</label> <input
											type="text" id="article" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label">Price of Chasis: (Invoice
											Value)</label> <input type="text" id="priceofchasis"
											autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Body Building Charges</label> <input
											type="text" id="building" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Installment (Rs) </label> <input
											type="text" id="installment" autocomplete="off"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<div class="form-group required">
										<label class="control-label"> Each Commencing From</label> <input
											type="text" id="commencing" autocomplete="off"
											class="form-control" />
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
		<legend> Vehicle Loan </legend>
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
						<th>memberid</th>
						<th>loanaccountnumber</th>
						<th>loannumber</th>
						<th>name</th>
						<th>age</</th>
						<th>occupation</th>
						<th>nationality</th>
						<th>income</th>
						<th>makevehicle</th>
						<th>usepurpose</th>
						<th>normalpurpose</th>
						<th>fathersname</th>
						<!-- <th>bankrupt</th>
						<th>property/investments?</th>
						<th> application any Company</th>
						<th>Father's name & Address</th>
						<th>Permanent address</th>
						<th>Name of Co-Obligant's</th>
						<th> Occupation</th>
						<th>Details of Securities</th>
						<th>Permanent address</th>
						<th>Make</th>
						<th>Article</th>
						<th>Price of Chasis:</th>
						<th>Body Building Charges</th>
						<th>Installment (Rs)</th>
						<th>Each Commencing From</th> -->



					</tr>
				</thead>
		<%-- 		<tbody>
					<s:iterator id="personalbean" value="#session.vehiclelist"
						status="i">
						<tr>

							<td>${personalbean.memberid}<input type="hidden"
								value="${personalbean.memberid}" /></td>

							<td>${personalbean.loanaccountnumber}<input type="hidden"
								value="${personalbean.loanaccountnumber}" /></td>

							<td>${personalbean.loannumber}<input type="hidden"
								value="${personalbean.loannumber}" /></td>

							<td>${personalbean.name}<input type="hidden"
								value="${personalbean.name}" /></td>

							<td>${personalbean.age}<input type="hidden"
								value="${personalbean.age}" /></td>

							<td>${personalbean.occupation}<input type="hidden"
								value="${personalbean.occupation}" /></td>

							<td>${personalbean.nationality}<input type="hidden"
								value="${personalbean.nationality}" /></td>

							<td>${personalbean.income}<input type="hidden"
								value="${personalbean.income}" /></td>
							<td>${personalbean.makevehicle}<input type="hidden"
								value="${personalbean.makevehicle}" /></td>

							<td>${personalbean.usepurpose}<input type="hidden"
								value="${personalbean.usepurpose}" /></td>

							<td>${personalbean.normalpurpose}<input type="hidden"
								value="${personalbean.normalpurpose}" /></td>

							<td>${personalbean.fathersname}<input type="hidden"
								value="${personalbean.fathersname}" /></td>

							<td>${personalbean.accidentsoccurred}<input type="hidden"
								value="${personalbean.accidentsoccurred}" /></td>

							<td>${personalbean.bankrupt}<input type="hidden"
								value="${personalbean.bankrupt}" /></td>

							<td>${personalbean.property}<input type="hidden"
								value="${personalbean.property}" /></td>

							<td>${personalbean.contract}<input type="hidden"
								value="${personalbean.contract}" /></td>


							<td>${personalbean.nameandaddress}<input type="hidden"
								value="${personalbean.nameandaddress}" /></td>

							<td>${personalbean.paddress}<input type="hidden"
								value="${personalbean.paddress}" /></td>


						</tr>
					</s:iterator>
				</tbody> --%>
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
				var loanaccountnumber = $('#loanaccountnumber').val();
				var loannumber = $('#loannumber').val();
				var nameofapplicant = $('#name').val();
				var age = $('#age').val();
				var occupation = $('#occupation').val();
				var nationality = $('#nationality').val();
				var income = $('#income').val();
				var makevehicle = $('#makevehicle').val();
				var usepurpose = $('#usepurpose').val();
				var normalpurpose = $('#normalpurpose').val();
				var fathersname = $('#fathersname').val();
				var accidentsoccurred = $('#accidentsoccurred').val();
				var bankrupt = $('#bankrupt').val();
				var property = $('#property').val();
				var contract = $('#contract').val();
				var nameandaddress = $('#nameandaddress').val();
				var paddress = $('#paddress').val();
				var coobligantname = $('#coobligantname').val();
				var professions = $('#professions').val();
				var securites = $('#securites').val();
				var permanentadd = $('#permanentadd').val();
				var make = $('#make').val();
				var article = $('#article').val();
				var priceofchasis = $('#priceofchasis').val();
				var building = $('#building').val();
				var installment = $('#installment').val();
				var commencing = $('#commencing').val();

				

		if ($.trim(combobox).length == 0) {
					alert("Provide Member ID");
				} else if ($.trim(nationality).length == 0) {
					alert("Provide nationality");
				} else if ($.trim(income).length == 0) {
					alert("Provide income");
				} else if ($.trim(makevehicle).length == 0) {
					alert("Provide makevehicle");
				} else if ($.trim(usepurpose).length == 0) {
					alert("Provide usepurpose");
				} else if ($.trim(normalpurpose).length == 0) {
					alert("Provide normalpurpose");
				} else if ($.trim(fathersname).length == 0) {
					alert("Provide fathersname");
				} else if ($.trim(bankrupt).length == 0) {
					alert("Provide bankrupt");
				} else if ($.trim(property).length == 0) {
					alert("Provide property");
				}

				else if ($.trim(contract).length == 0) {
					alert("Provide contract");
				} else if ($.trim(nameandaddress).length == 0) {
					alert("Provide nameandaddress");
				} else if ($.trim(coobligantname).length == 0) {
					alert("Provide coobligantname");
				} else if ($.trim(professions).length == 0) {
					alert("Provide professions");
				} else if ($.trim(securites).length == 0) {
					alert("Provide securites");
				} else if ($.trim(permanentadd).length == 0) {
					alert("Provide permanentadd");
				} else if ($.trim(make).length == 0) {
					alert("Provide make");
				} else if ($.trim(article).length == 0) {
					alert("Provide article");
				} else if ($.trim(installment).length == 0) {
					alert("Provide installment");
				} else if ($.trim(commencing).length == 0) {
					alert("commencing");
				} else if ($.trim(priceofchasis).length == 0) {
					alert("priceofchasis");
				} else if ($.trim(building).length == 0) {
					alert("building");
				}

				else {
					var parms = {
						memberid : memberid,
						loanaccountnumber : loanaccountnumber,
						loannumber : loannumber,
						name : nameofapplicant,
						age : age,
						occupation : occupation,
						nationality : nationality,
						income : income,
						makevehicle : makevehicle,
						usepurpose : usepurpose,
						normalpurpose : normalpurpose,
						fathersname : fathersname,
						accidentsoccurred : accidentsoccurred,
						bankrupt : bankrupt,
						property : property,
						contract : contract,
						nameandaddress : nameandaddress,
						paddress : paddress,
						coobligantname : coobligantname,
						professions : professions,
						securites : securites,
						permanentadd : permanentadd,
						make : make,
						article : article,
						priceofchasis : priceofchasis,
						building : building,
						installment : installment,
						commencing : commencing,

					};
					$.ajax({
						type : "POST",
						url : "vehicle.action",
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
				}
			});
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
		});

		$(".custom-combobox-input").change(function() {

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

		$(".ui-widget").click(function() {

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
	</script>
</body>
</html>