<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"%>
<s:set name="userName" value="#session.userName" />
<s:set name="regularlist" value="#session.regularlist" />
<s:set name="withdrawnumber" value="#session.withdrawnumberinc" />
<!DOCTYPE html>


<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.modal fade {
	margin: 30px;
}

@media screen and (min-width: 992px) {
	.modal-dialog {
		width: 980px; /* New width for large modal */
	}
}

.modal-body {
	padding: 32px;
}

.table-responsive {
	overflow: auto;
}

.abc {
	display: none;
}

.abcd {
	font-weight: bold;
}

fieldset.scheduler-border {
	border: 2px groove #ddd !important;
	padding: 0 0.5em 0.5em 0.5em !important;
	margin: 0 0 1.1em 0 !important;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
}

legend.scheduler-border {
	width: inherit; /* Or auto */
	padding: 0 5px; /* To give a bit of padding on the left and right */
	border-bottom: none;
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
					<h4 class="modal-title" id="myModalLabel">RECEIPT</h4>
				</div>


				<div class="modal-body">

					<br />
					<!-- <h3 align="center">Receipt</h3> -->
					<div class="row">

						<%-- <div class="col-sm-2">
							<div class="form-group">
								<label>Bank Name</label> <select id="bankname"
									class="form-control">
									<option value="Padmashree Credit Co-operative Society Limited">PadmashreeCredit
										Co-operative Society Limited</option>
								</select>
								</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td>
								<label>Date:</label> </td>&nbsp;&nbsp;<td><input type="text" id="date" name="deposit_Date" align="right"  size="10">
						
							</div>
						</div>

						<div class="col-sm-2">
							<div class="form-group">
								<label>Bank Code</label> <select id="bankcode"
									class="form-control">
									<option value="PCCSL">PCCSL</option>
								</select>

							</div>
						</div> --%>

						<div class="row">
							<div class="form-group">

								<table border="0" class="align-right">
									<table border="5" align="right">

										<tr>
											<th align="center" class="abcd">Denomination</th>
											<th align="center" class="abcd">Qty</th>
											<th align="center" class="abcd">Amount</th>
										</tr>
										<tr>
											<td align="right" class="abcd">2000</td>
											<td><input type="text" name="thousand" id="thousand"
												class="abcd" value="0" onkeyup="cal_1000_Amount();" /></td>
											<td><input type="text" name="thousand_amount"
												class="abcd" id="thousand_amount" readonly="readonly"
												value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">500</td>
											<td><input type="text" name="fivehundered"
												id="fivehundered" class="abcd" value="0"
												onkeyup="cal_500_Amount();" /></td>
											<td><input type="text" name="fivehundered_amount"
												id="fivehundered_amount" class="abcd" readonly="readonly"
												value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">100</td>
											<td><input type="text" name="hundered" id="hundered"
												class="abcd" value="0" onkeyup="cal_100_Amount();" /></td>
											<td><input type="text" name="hundered_amount"
												class="abcd" id="hundered_amount" readonly="readonly"
												value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">50</td>
											<td><input type="text" name="fifty" id="fifty" value="0"
												class="abcd" onkeyup="cal_50_Amount();" /></td>
											<td><input type="text" name="fifty_amount" class="abcd"
												id="fifty_amount" class="abcd" readonly="readonly"
												value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">20</td>
											<td><input type="text" name="twenty" id="twenty"
												value="0" class="abcd" onkeyup="cal_20_Amount();" /></td>
											<td><input type="text" name="twenty_amount"
												id="twenty_amount" class="abcd" readonly="readonly"
												value="0.00" class="abcd" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">10</td>
											<td><input type="text" name="ten" id="ten" value="0"
												class="abcd" onkeyup="cal_10_Amount();" /></td>
											<td><input type="text" name="ten_amount" id="ten_amount"
												class="abcd" readonly="readonly" class="abcd" value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">5</td>
											<td><input type="text" name="five" id="five" value="0"
												class="abcd" onkeyup="cal_5_Amount();" /></td>
											<td><input type="text" name="five_amount"
												id="five_amount" readonly="readonly" class="abcd"
												value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">2</td>
											<td><input type="text" name="two" id="two" value="0"
												class="abcd" onkeyup="cal_2_Amount();" /></td>
											<td><input type="text" name="two_amount" id="two_amount"
												class="abcd" readonly="readonly" class="abcd" value="0.00" /></td>
										</tr>
										<tr>
											<td align="right" class="abcd">1</td>
											<td><input type="text" name="one" id="one" value="0"
												class="abcd" onkeyup="cal_1_Amount();" /></td>
											<td><input type="text" name="one_amount" id="one_amount"
												class="abcd" readonly="readonly" class="abcd" value="0.00" /></td>
										</tr>
										<tr>
											<td align="left">Coins</td>
											<td>&nbsp;</td>
											<td><input type="text" name="coins" id="coins" value="0"
												class="abcd" onkeyup="cal_total_Amount();"></td>

										</tr>
										<tr>

											<td align="left">Total</td>
											<td>&nbsp;</td>
											<td><input type="text" name="total" id="total"
												class="abcd" readonly="readonly" /></td>
										</tr>
									</table>
								</table>

								<div class="col-sm-2">
									<div class="form-group">
										<label>Branch Name</label> <select id="branchname"
											class="form-control">
											<option value="PCCSL Main Branch">PCCSL Main Branch</option>
										</select>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Branch Code</label> <select id="branchcode"
											class="form-control">
											<option value="PCCSLMB">PCCSLMB</option>
										</select>
									</div>
								</div>

								<div class="col-sm-2">
									<div class="form-group">
										<label>User Name</label> <input type="text" id="userName"
											value="${userName}" autocomplete="off" class="form-control" />

									</div>
								</div>

								<div class="col-sm-2">
									<div class="form-group">
										<label>Member Id</label> <input type="text" id="memberid"
											autocomplete="off" class="form-control" />
									</div>
								</div>


								<div class="col-sm-2">
									<div class="form-group">
										<label>Withdraw No</label> <input type="text" id="withdrawno"
											autocomplete="off" class="form-control" />
									</div>

								</div>
								<div class="col-xs-2">
									<div class="form-group">
										<div class='input-group date' data-provide="datepicker"
											data-date-autoclose="true" data-date-today-btn="linked"
											data-date-today-highlight="true"
											data-date-format="dd.mm.yyyy">
											<label> Date </label><input id="withdrawdate"
												class="form-control date"
												value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
											<span class="input-group-addon"><span
												class="icon icon-calendar"></span> </span>
										</div>
									</div>
								</div>

								<div class="col-sm-2">
									<div class="form-group">
										<label>Account Type</label> <select id="accoounttype"
											class="form-control">
											<option value="Select">Select</option>
											<option value="Savings Account">Savings Account</option>
											<option value="Current Account">Current Account</option>
											<option value="Fixed Deposit">Fixed Deposit</option>
											<option value="Loan">Loan</option>
											<option value="AShare">AShare</option>
											<option value="RShare">RShare</option>
										</select>
									</div>
								</div>

								<div class="col-sm-2">
									<div class="form-group">
										<label>Account No</label> <input type="text" id="accountno"
											class="form-control" />
									</div>
								</div>



								<div class="col-sm-2">
									<div class="form-group">
										<label>Account Name</label> <input type="text" id="name"
											class="form-control" />
									</div>
								</div>


								<div class="col-sm-2">
									<div class="form-group">
										<label>Amount</label> <input type="text" id="amount"
											class="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="col-sm-2">
										<div class="form-group">
											<label>Contact No</label> <input type="text" id="cell"
												autocomplete="off" class="form-control" />
										</div>
									</div>


									<div class="col-sm-2">
										<div class="form-group">
											<label>Remarks</label> <input type="text" id="remarks"
												autocomplete="off" class="form-control" />
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<br> <br>

					<div class="modal-footer">

						<button type="button" id="submit" data-type='Submit'
							class="btn btn-primary">Submit</button>

						<button type="button" id="reset" data-type='Reset'
							class="btn btn-primary">Reset</button>
					</div>
				</div>


			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<br />
	
	<button type="button" data-toggle="modal" data-target="#basicModal" data-backdrop="static" data-keyboard="false">
	AddNewWithdraw
	</button>
	
	<!-- <input type="button" class="rs-links" id="addwithdraw"
		value="AddNewWithdraw" /> -->
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
						<!-- <th class="abc">Bank Name</th>
						<th class="abc">Bank Code</th> -->
						<th class="abc">Branch Name</th>
						<th class="abc">Branch Code</th>
						<th class="abc">User Name</th>
						<th>Receipt No</th>
						<th>MemberID</th>
						<th>Account NO</th>
						<th>Receipt Date</th>
						<th>name</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator id="withdrawbean" value="#session.withdrawlist"
						status="i">
						<tr>

							<td>${withdrawbean.slno}<input type="hidden"
								value="${withdrawbean.slno}" /></td>

							

							<td class="abc">${withdrawbean.branchname}<input
								type="hidden" value="${receiptbean.branchname}" /></td>

							<td class="abc">${withdrawbean.branchcode}<input
								type="hidden" value="${withdrawbean.branchcode}" /></td>

							<td class="abc">${withdrawbean.userName}<input type="hidden"
								value="${withdrawbean.userName}" /></td>

							<td>${withdrawbean.withdrawno}<input type="hidden"
								value="${withdrawbean.withdrawno}" /></td>

							<td>${withdrawbean.memberid}<input type="hidden"
								value="${withdrawbean.memberid}" /></td>

							<td>${withdrawbean.accountno}<input type="hidden"
								value="${withdrawbean.accountno}" /></td>

							<td>${withdrawbean.date}<input type="hidden"
								value="${withdrawbean.date}" /></td>

							<td>${withdrawbean.name}<input type="hidden"
								value="${withdrawbean.name}" /></td>

							<td>${withdrawbean.amount}<input type="hidden"
								value="${withdrawbean.amount}" /></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>


	<input type="hidden" id="accountname"
		value="<%=session.getAttribute("accountname")%>" />



	<script type="text/javascript">
		$(document).ready(function() {
			$(".rs-links").click(function() {
				$("#basicModal").modal('show');
			});

			$("#submit").click(function() {

				
				var branchname = $('#branchname').val();
				var branchcode = $('#`branchcode').val();
				var userName = $('#userName').val();
				var memberid = $('#memberid').val();
				var withdrawno = $('#withdrawno').val();
				var withdrawdate = $('#withdrawdate').val();
				var accountno = $('#accountno').val();
				var name = $('#name').val();
				var cell = $('#cell').val();
				var amount = $('#amount').val();
				var accoounttype = $('#accoounttype').val();
				var remarks = $('#remarks').val();
				var thousand = $('#thousand').val();
				var fivehundered = $('#fivehundered').val();
				var hundered = $('#hundered').val();
				var fifty = $('#fifty').val();
				var twenty = $('#twenty').val();
				var ten = $('#ten').val();
				var five = $('#five').val();
				var two = $('#two').val();
				var one = $('#one').val();
				var coins = $('#coins').val();
				
				 if($.trim(branchname).length == 0) {
				    	alert("Provide branchname");
				    }
					else if($.trim(branchcode).length == 0) {
				    	alert("Provide branchcode");
				    }
					else if($.trim(userName).length == 0) {
				    	alert("Provide userName");
				    }
					else if($.trim(memberid).length == 0) {
				    	alert("Provide memberid");
				    }
					else if($.trim(withdrawno).length == 0) {
				    	alert("Provide withdrawno");
				    }
					else if($.trim(accountno).length == 0) {
				    	alert("Provide accountno");
				    }
					else if($.trim(name).length == 0) {
				    	alert("Provide name");
				    }
					else if($.trim(cell).length == 0) {
				    	alert("Provide cell");
				    }
					else if($.trim(accoounttype).length == 0) {
				    	alert("Provide accoounttype");
				    }
					else if($.trim(amount).length == 0) {
				    	alert("Provide amount");
				    }
					
					else {
				
				var parms = {
					
					branchname : branchname,
					branchcode : branchcode,
					userName : userName,
					memberid : memberid,
					date : withdrawdate,
					withdrawno : withdrawno,
					accountno : accountno,
					name : name,
					cell : cell,
					amount : amount,
					accoounttype : accoounttype,
					remarks : remarks,
					thousand : thousand,
					fivehundered : fivehundered,
					hundered : hundered,
					fifty : fifty,
					twenty : twenty,
					ten : ten,
					five : five,
					two : two,
					one : one,
					coins : coins,
				};
				$.ajax({
					type : "POST",
					url : "addwithdraws.action",
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
							window.location.href = "index.jsp";
							//alert("success");
						}
					}
				});
					}
			});
			$("#submit").click(function() {

				
				var branchname = $('#branchname').val();
				var branchcode = $('#branchcode').val();
				var userName = $('#userName').val();
				var memberid = $('#memberid').val();
				var withdrawno = $('#withdrawno').val();
				var withdrawdate = $('#withdrawdate').val();
				var accountno = $('#accountno').val();
				var name = $('#name').val();
				var cell = $('#cell').val();
				var amount = $('#amount').val();
				var accoounttype = $('#accoounttype').val();
				var remarks = $('#remarks').val();
				var thousand = $('#thousand').val();
				var fivehundered = $('#fivehundered').val();
				var hundered = $('#hundered').val();
				var fifty = $('#fifty').val();
				var twenty = $('#twenty').val();
				var ten = $('#ten').val();
				var five = $('#five').val();
				var two = $('#two').val();
				var one = $('#one').val();
				var coins = $('#coins').val();
				
				 if($.trim(branchname).length == 0) {
			    	alert("Provide branchname");
			    }
				else if($.trim(branchcode).length == 0) {
			    	alert("Provide branchcode");
			    }
				else if($.trim(userName).length == 0) {
			    	alert("Provide userName");
			    }
				else if($.trim(memberid).length == 0) {
			    	alert("Provide memberid");
			    }
				else if($.trim(withdrawno).length == 0) {
			    	alert("Provide withdrawno");
			    }
				else if($.trim(accountno).length == 0) {
			    	alert("Provide accountno");
			    }
				else if($.trim(name).length == 0) {
			    	alert("Provide name");
			    }
				else if($.trim(cell).length == 0) {
			    	alert("Provide cell");
			    }
				else if($.trim(accoounttype).length == 0) {
			    	alert("Provide accoounttype");
			    }
				else if($.trim(amount).length == 0) {
			    	alert("Provide amount");
			    }
				
				else {
				
				var parms = {
					
					branchname : branchname,
					branchcode : branchcode,
					userName : userName,
					memberid : memberid,
					date : withdrawdate,
					withdrawno : withdrawno,
					accountno : accountno,
					name : name,
					cell : cell,
					amount : amount,
					accoounttype : accoounttype,
					remarks : remarks,
					thousand : thousand,
					fivehundered : fivehundered,
					hundered : hundered,
					fifty : fifty,
					twenty : twenty,
					ten : ten,
					five : five,
					two : two,
					one : one,
					coins : coins,
				};
				$.ajax({
					type : "POST",
					url : "draftwithdraw.action",
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
							window.location.href = "index.jsp";
							//alert("success");
						}
					}
				});
				}
			});

			$('#accountno').keyup(function() {

				timer = setTimeout(function() {
					var accountno = $("#accountno").val();
					var name = $("#name").val();

					$.ajax({
						url : 'getname.action',
						dataType : "json",
						data : {
							accountno : $("#accountno").val()
						},
						success : function(data) {
							var str = data.name.replace(/\"/g, "");
							$("#name").val(str);

						}
					});
				}, 1000);
			});
		});

		$('#accountno').keyup(function() {

			timer = setTimeout(function() {
				var accountno = $("#accountno").val();

				$.ajax({
					url : 'getcell.action',
					dataType : "json",
					data : {
						accountno : $("#accountno").val()
					},
					success : function(data) {
						//var str = data.name.replace(/\"/g, "");
						alert(data.cell);
						$("#cell").val(data.cell);

					}
				});
			}, 1000);
		});

		$('#accountno').keyup(function() {
			var accountno = $("#accountno").val();
			$("#memberid").val(accountno);
		});
		$('#accountno').keyup(
				function() {
					$.ajax({
						url : 'withdrawnumber.action',
						dataType : "json",
						success : function(data) {
							var abc = "Wd";

							var d = new Date();
							var today_date = ("0" + d.getDate()).slice(-2)
									+ ("0" + (d.getMonth() + "/")).slice(-2)
									+ d.getFullYear();
							var number = '${withdrawnumber}';
							$("#withdrawno").val(
									abc + "-" + today_date + "-" + number);

						}
					});
				});

		function cal_1000_Amount() {
			var qty = $('#thousand').val();
			var amount = qty * 2000;
			amount = document.getElementById("thousand_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();
			if ($('#fivehundered').val() == "")
				$('#fivehundered').focus();
			else
				cal_total_Amount();
		}

		function cal_500_Amount() {
			var qty = $('#fivehundered').val();
			var amount = qty * 500;
			amount = document.getElementById("fivehundered_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#hundered').val() == "")
				$('#hundered').focus();
			else
				cal_total_Amount();
		}

		function cal_100_Amount() {
			var qty = $('#hundered').val();
			var amount = qty * 100;
			amount = document.getElementById("hundered_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#fifty').val() == "")
				$('#fifty').focus();
			else
				cal_total_Amount();
		}

		function cal_50_Amount() {

			var qty = $('#fifty').val();
			var amount = qty * 50;
			amount = document.getElementById("fifty_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#twenty').val() == "")
				$('#twenty').focus();
			else
				cal_total_Amount();
		}
		function cal_20_Amount() {
			var qty = $('#twenty').val();
			var amount = qty * 20;
			amount = document.getElementById("twenty_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#ten').val() == "")
				$('#ten').focus();
			else
				cal_total_Amount();
		}

		function cal_10_Amount() {
			var qty = $('#ten').val();
			var amount = qty * 10;
			amount = document.getElementById("ten_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#five').val() == "")
				$('#five').focus();
			else
				cal_total_Amount();

		}

		function cal_5_Amount() {
			var qty = $('#five').val();
			var amount = qty * 5;
			amount = document.getElementById("five_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#two').val() == "")
				$('#two').focus();
			else
				cal_total_Amount();

		}

		function cal_2_Amount() {
			var qty = $('#two').val();
			var amount = qty * 2;
			amount = document.getElementById("two_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#one').val() == "")
				$('#one').focus();
			else
				cal_total_Amount();
		}

		function cal_1_Amount() {
			var qty = $("#one").val();
			var amount = qty * 1;
			amount = document.getElementById("one_amount").value = parseFloat(amount * 100) / 100;
			cal_total_Amount();

			if ($('#coins').val() == 0)
				$('#coins').focus();

			else
				cal_total_Amount();
		}

		function cal_total_Amount() {
			var one_amount = document.getElementById("ss").value;
			var two_amount = document.getElementById("two_amount").value
			var five_amount = document.getElementById("five_amount").value;
			var ten_amount = document.getElementById("ten_amount").value
			var twenty_amount = document.getElementById("twenty_amount").value;
			var fifty_amount = document.getElementById("fifty_amount").value
			var hundered_amount = document.getElementById("hundered_amount").value;
			var fivehundered_amount = document
					.getElementById("fivehundered_amount").value
			var thousand_amount = document.getElementById("thousand_amount").value;
			var coins_amount = document.getElementById("coins").value
			var total = parseFloat(one_amount) + parseFloat(two_amount)
					+ parseFloat(five_amount) + parseFloat(ten_amount)
					+ parseFloat(twenty_amount) + parseFloat(fifty_amount)
					+ parseFloat(hundered_amount)
					+ parseFloat(fivehundered_amount)
					+ parseFloat(thousand_amount);
			var totalAmount = parseFloat(total) + parseFloat(coins_amount);
			document.getElementById("total").value = parseFloat(totalAmount * 100) / 100;
			document.getElementById("amount").value = parseFloat(totalAmount * 100) / 100;
		}
		
		
		
	</script>
</body>
</html>
