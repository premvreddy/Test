<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="scripts/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bs_leftnavi.css">
<script src="scripts/bs_leftnavi.js"></script>
<script src="scripts/jquery.dataTables.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css">
<%-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> --%>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="scripts/sha3.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="scripts/metisMenu.min.js"></script>
<script type="text/javascript" src="scripts/bootstrap-datepicker.js"></script>

<!-- Morris Charts JavaScript -->
<!-- Custom Theme JavaScript -->
<script src="scripts/sb-admin-2.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">

<%-- <jsp:include page="Share.jsp" /> --%>

<style type="text/css">
.submenu {
	left: 171px;
	background-color: #D0D0D0;
	position: absolute;
	list-style: none;
	text-indent: 0;
	top: 100px;
	border: 1px solid #eee;
	width: 161px;
	padding: 4px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-sizing: border-box;
	display: none;
	list-style: none;
}

.displaynone {
	display: none;
}

.coconutImage {
	align: center;
}

​
.workarea !important {
	left: 171px;
	background-color: #ffffff;
	position: absolute;
	list-style: none;
	text-indent: 0;
	top: 100px;
	border: 1px solid #eee;
	height: 24px;
	width: 161px;
	padding: 4px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-sizing: border-box;
	display: none;
	list-style: none;
}
</style>

<style type="text/css">
.navbar-default {
	background-color: #DAA520;
	border-color: #e7e7e7;
}

.dropdown-menu {
	display: block;
	padding: 20px 20px;
	clear: both;
	font-weight: 400;
	line-height: 1.42857143;
	color: #333;
	white-space: nowrap;
}
</style>


<style>
.custom-combobox {
	position: relative;
	display: inline-block;
}

.custom-combobox-toggle {
	position: absolute;
	top: 0;
	bottom: 0;
	margin-left: -1px;
	padding: 0;
}

.custom-combobox-input {
	margin: 0;
	padding: 5px 10px;
}
</style>


<style type="text/css">
.navbar-top-links {
	background-color: #E8E8E8;
	border-color: #33ff33;
}

.mainMenu {
	background-color: #ADD8E6;
	padding: 20px;
	border-color: #C3EEF9 display: none;
}
</style>

<style type="text/css">
fieldset.scheduler-border {
	border: 0.5px groove #fff !important;
	padding: 0 0.4em 0.4em 0.4em !important;
	margin: 0 0 0.5em 0 !important;
	-webkit-box-shadow: 0px 0px 0px 0px #000;
	box-shadow: 0px 0px 0px 0px #000;
}

legend.scheduler-border {
	font-size: 1.2em !important;
	font-weight: bold !important;
	text-align: left !important;
	width: auto;
	padding: 0 10px;
	border-bottom: none;
}
</style>

<style type="text/css">
.navbar-left {
	background-color: #DAA520;
	border-color: #33ff33;
}
</style>


<style type="text/css">
.nav {
	background-color: #FFE4E1;
	border-color: #33ff33;
}
</style>

<style type="text/css">
.wrapper {
	background-color: #ADD8E6;
	border-color: #33ff33;
}
</style>


<style type="text/css">
.navbar-static-top {
	background-color: #ADD8E6;
	border-color: #33ff33;
}
</style>
<style type="text/css">
.navbar-toggle {
	background-color: #ADD8E6;
	border-color: #33ff33;
}
</style>



<style type="text/css">
.navbar-header {
	background-color: #FFE4E1;
	border-color: #33ff33;
}

.modal {
	display: block;
}
</style>


<style type="text/css">
.navbar .navbar-default .navbar-static-top {
	background-color: #FFE4E1;
	border-color: #33ff33;
}

.dropdown {
	background-color: #ADD8E6;
	border-color: #33ff33;
}
</style>

<style type="text/css">
.nav .navbar-top-links .navbar-left {
	background-color: #FFE4E1;
	border-color: #33ff33;
}
</style>

<style type="text/css">
.navbar {
	background-color: #FFE4E1;
	border-color: #33ff33;
}

tbody {
	overflow-y: scroll;
}
</style>


<style type="text/css">
.navbar-collapse {
	background-color: #ADD8E6;
	border-color: #33ff33;
}
</style>
<style type="text/css">
.nav .navbar-top-links .navbar-right {
	background-color: #FFE4E1;
	border-color: #33ff33;
}
</style>
<title>new project - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">

<!-- Timeline CSS -->
<link href="css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<ul class="nav navbar-top-links navbar-left">


				<li class="active"><a href="#" data-submenu="Home"
					class=" dropdown-toggle" role="button" aria-haspopup="true"
					aria-expanded="false">Home <span class="caret"></span></a></li>



				<li><a href="#" data-submenu="Member" class=" dropdown-toggle"
					role="button" aria-haspopup="true" aria-expanded="false">Member<span
						class="caret"></span></a></li>



				<li><a href="#" data-submenu="Deposits"
					class=" dropdown-toggle" role="button" aria-haspopup="true"
					aria-expanded="false">Deposits<span class="caret"></span></a></li>



				<li><a href="#" data-submenu="Loans" class=" dropdown-toggle"
					role="button" aria-haspopup="true" aria-expanded="false">Loans<span
						class="caret"></span></a></li>



				<li><a href="#" data-submenu="Pigmi" class=" dropdown-toggle"
					role="button" aria-haspopup="true" aria-expanded="false">Pigmi
						<span class="caret"></span>
				</a></li>



				<li><a href="#" data-submenu="Accounts"
					class=" dropdown-toggle" role="button" aria-haspopup="true"
					aria-expanded="false">Accounts<span class="caret"></span></a></li>

				<li><a href="#" data-submenu="Bank"
					class=" dropdown-toggle" role="button" aria-haspopup="true"
					aria-expanded="false">Bank<span class="caret"></span></a></li>


			</ul>

			<ul class="nav navbar-top-links navbar-right">
				<li class="active" id="logout"><a href="#"
					data-submenu="companyinfo" class=" dropdown-toggle" role="button"
					aria-haspopup="true" aria-expanded="false">LOGOUT <span
						class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>
		</nav>
	</div>

	<div class="row">
		<div class="gw-sidebar">
			<div id="gw-sidebar" class="gw-sidebar">
				<div class="Home displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">User Roles</span> <b class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">

								<c:choose>
									<c:when test="${sessionScope.usertype=='ADMIN'}">
										<li id="roleuserinfo" data-page="UserRoles.jsp"><a
											href="javascript:void(0)">Role Management</a></li>
									</c:when>
								</c:choose>
							
							<li id="pwd" data-page="ChangePwd.jsp"><a
									href="javascript:void(0)">Change Password</a></li>
							</ul>
							</li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Profile</span> <b class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Bank Profile</a></li>
								<li id="bodprofile" data-page="BODProfile.jsp"><a
									href="javascript:void(0)">BOD Profile</a></li>
								<c:choose>
									<c:when test="${sessionScope.usertype=='ADMIN'}">
										<li id="userinformation" data-page="addUser.jsp"><a
											href="#">Employee Profile</a></li>
									</c:when>
								</c:choose>

								<li id="branchinfo" data-page="BranchInfo.jsp"><a
									href="javascript:void(0)">Branch Info</a></li>
								<li><a href="javascript:void(0)">Notifications</a></li>
							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Status</span> <b class="gw-arrow"></b>
						</a>
						
						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text"> Entries</span> <b
								class="gw-arrow icon-arrow-up8"></b>
						</a>
							<ul class="gw-submenu">
								<li id="fdinterestsetting" data-page="fdinterestsetting.jsp"><a href="javascript:void(0)"> Interest Setting </a></li>

							</ul></li>														
							


					</ul>
				</div>

				<div class="Member displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Member Creation</span> <b
								class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">

								<li id="regularshare" data-page="RegularShare.jsp"><a
									href="#">Regular Share Account</a></li>
								<li id="ashare" data-page="Ashare.jsp"><a href="#">A
										share Account</a></li>
								<li id="nominalshare" data-page="NominalShare.jsp"><a
									href="javascript:void(0)">Nominal Share Account</a></li>

							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Entries</span> <b
								class="gw-arrow icon-arrow-up8"></b>
						</a>
							<ul class="gw-submenu">
								<li id="withdraw" data-page="Withdraw.jsp"><a
									href="javascript:void(0)">Withdraw</a></li>
								<li id="deposit" data-page="Deposit.jsp"><a
									href="javascript:void(0)">Deposit</a></li>
								<!-- <li><a href="javascript:void(0)">Process</a></li> -->
							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Reports</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li id="withdrawprint" data-page="Withdrawprint.jsp"><a
									href="javascript:void(0)">Withdraw Report</a></li>
								<li id="depositprint" data-page="Depositprint.jsp"><a
									href="javascript:void(0)">Deposit Report</a></li>
								<li id="membersreport" data-page="Membersreport.jsp"><a
									href="javascript:void(0)">Members Report</a></li>
								<li id="passbookdetails" data-page="PassbookDetails.jsp"><a
									href="javascript:void(0)">Passbook</a></li>
								<li><a href="javascript:void(0)">DayOpening Report</a></li>
								<li><a href="javascript:void(0)">DayEnd Report</a></li>
							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text"> Pending Authorized</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li id="withdrawval" data-page="WithdrawValidate.jsp"><a
									href="javascript:void(0)">Withdraw </a></li>
								<li id="pending" data-page="PendingAuthorized.jsp"><a
									href="javascript:void(0)">Receipt </a></li>
							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text"> Fund Transfer</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Multiple Account </a></li>
							</ul></li>
							<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Status</span> <b
								class="gw-arrow icon-arrow-up8"></b>
						</a>
							<ul class="gw-submenu">
								<li id="memberstatus" data-page="MemberStatus.jsp"><a
									href="javascript:void(0)">Memberstatus</a></li>
							</ul></li>
					</ul>
				</div>

				<div class="Deposits displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Deposits</span> <b class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">
								
									<li id="fixeddeposit" data-page="FixedDeposit.jsp"><a href="#">Fixed Deposit</a></li>
								
								<li id="recurringdeposit" data-page="RecurringDeposit.jsp"><a href="#">Recurring Deposit</a></li>
							</ul></li>
						
					</ul>
				</div>

				<div class="Loans displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Personal Loan</span> <b
								class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">
								<li id="personalloan" data-page="PersonalLoan.jsp"><a
									href="javascript:void(0)">Personal Loan</a></li>
							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Vehicle Loan </span> <b
								class="gw-arrow icon-arrow-up8"></b>
						</a>
							<ul class="gw-submenu">
								<li id="vehicleloan" data-page="VehicleLoan.jsp"><a
									href="javascript:void(0)">Vehicle Loan</a></li>

							</ul></li>
							<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Home Loan </span> <b
								class="gw-arrow icon-arrow-up8"></b>
						</a>
							<ul class="gw-submenu">
								<li id="homeloan" data-page="HomeLoan.jsp"><a
									href="javascript:void(0)">Home Loan</a></li>
									</ul></li>
									
								<li class="init-arrow-down">
								<a href="javascript:void(0)">
								<span class="gw-menu-text">Loan</span> <b
								class="gw-arrow"></b>	
								</a>
								<ul class="gw-submenu">
						<li id="loanledger" data-page="LoanLedger.jsp"><a href="#">Loan Ledger </a></li>	
						<li id="loanpayment" data-page="LoanPayment.jsp"><a href="#">Loan Payment </a></li>
						<li id="loanreceipt" data-page="LoanReceipt.jsp"><a href="#">Loan Receipt </a></li>
					</ul>
							
					</ul>
				</div>
				<div class="Pigmi displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Master</span> <b class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">
								<li id="agent" data-page="Agent.jsp"><a
									href="javascript:void(0)">Agent</a></li>

							</ul>
							<ul class="gw-submenu">
								<li id="pholder" data-page="PigmiHolder.jsp"><a
									href="javascript:void(0)">PigmiHolder</a></li>
							</ul>

							<ul class="gw-submenu">
								<li id="precp" data-page="PigmiRecipt.jsp"><a
									href="javascript:void(0)">PigmiRecipt</a></li>
							</ul>
							<ul class="gw-submenu">
								<li id="ploan" data-page="PigmiLoan.jsp"><a
									href="javascript:void(0)">PigmiLoan</a></li>
							</ul></li>
					</ul>


				</div>
				<div class="Accounts displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Master</span> <b class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">
								<li id="ledgergroup" data-page="LedgerGroup.jsp"><a
									href="javascript:void(0)">Ledger Group</a></li>
								<li id="ledgeraccount" data-page="LedgerAccount.jsp"><a
									href="javascript:void(0)">Ledger Account</a></li>
								<li><a href="javascript:void(0)">Debtors</a></li>
								<li><a href="javascript:void(0)">Creditor</a></li>
								<li><a href="javascript:void(0)">Others</a></li>
								<li><a href="javascript:void(0)">Bank Account</a></li>
								<li><a href="javascript:void(0)">Loans and Advances</a></li>
								<li><a href="javascript:void(0)">Settings</a></li>


							</ul></li>
						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Entries</span> <b
								class="gw-arrow icon-arrow-up8"></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Receipts</a></li>
								<li><a href="javascript:void(0)">Payments</a></li>
								<li id="journal" data-page="Journal.jsp"><a
									href="javascript:void(0)">Journal</a></li>
								<li id="contra" data-page="Contra.jsp"><a
									href="javascript:void(0)">Contra</a></li>

							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Ledger</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Cash Book</a></li>
								<li id="ledgerdetails" data-page="LedgerDetails.jsp"><a
									href="javascript:void(0)">Ledger Accounts</a></li>
								<li id="memberdetails" data-page="MemberDetails.jsp"><a
									href="javascript:void(0)">Member Accounts</a></li>
								<li><a href="javascript:void(0)">New Cash Book</a></li>
							</ul></li>
						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Statements</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Receipts and Payments</a></li>
								<li id="trialbal" data-page="trialbalance.jsp"><a
									href="javascript:void(0)">Trial Balance</a></li>
								<li id="openingbal" data-page="openingbalance.jsp"><a
									href="javascript:void(0)">Opening Balance</a></li>
								<li><a href="javascript:void(0)">Profit and Loss
										Account</a></li>
								<li><a href="javascript:void(0)">Balance sheet</a></li>

							</ul></li>
						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Reports</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Reports</a></li>
							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Pending Authorized</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">WithDraw</a></li>
								<li><a href="javascript:void(0)">Deposit</a></li>
								<li><a href="javascript:void(0)">Members Account</a></li>
								<li><a href="javascript:void(0)">General</a></li>
								<li><a href="javascript:void(0)">Contra</a></li>
								<li><a href="javascript:void(0)">Journal</a></li>

							</ul></li>

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Close a Account</span> <b></b>
						</a>
							<ul class="gw-submenu">
								<li><a href="javascript:void(0)">Deposit Account</a></li>
								<li><a href="javascript:void(0)">FD Account</a></li>
								<li><a href="javascript:void(0)">Personal Loan Account</a></li>
								<li><a href="javascript:void(0)">vehicle Loan Account</a></li>
								<li><a href="javascript:void(0)">Home Loan Account</a></li>

							</ul></li>

					</ul>
				</div>
				
				
				<div class="Bank displaynone">
					<ul class="gw-nav gw-nav-list">

						<li class="init-arrow-down"><a href="javascript:void(0)">
								<span class="gw-menu-text">Accounts</span> <b class="gw-arrow"></b>
						</a>
							<ul class="gw-submenu">
								<li id="saccount" data-page="Savings.jsp"><a
									href="javascript:void(0)">SavingsAcount</a></li>

							</ul>
							<ul class="gw-submenu">
								<li id="paccount" data-page="Personal.jsp"><a
									href="javascript:void(0)">PersonalAccount</a></li>
							</ul>

							
					</ul>


				</div>
				
				
				
			</div>
		</div>
		<!-- /#wrapper -->
		<div id="workarea"
			class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"></div>
		<%-- 	<img class="coconutImage" src="<%=request.getContextPath()%>/images/0117-plain-color-floor-tiles-grey-grout-line-cm-50x50-texture-seamless-hr.jpg"/> --%>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#gw-sidebar').toggle(function() {
				$('#gw-sidebar').hide();
			}, function() {
				$('#gw-sidebar').show();
			});
			$("a.mainMenu").mouseenter(function() {
				$(this).closest('ul').find('.submenu').hide();
				$(this).siblings('ul.submenu').show();
			})/* .mouseleave(function(){
							$(this).siblings('ul.submenu').hide();
						}) */;
			$(".submenu").mouseenter(function() {
				$(this).show();
			}).mouseleave(function() {
				$(this).hide();
			});

			$(".dropdown-toggle").click(function() {
				var className = $(this).attr('data-submenu');
				$("." + className).siblings().hide();
				$("." + className).show();
			});

			$("#openingbalance_id").click(function() {
				$.ajax({
					success : function(data) {
						$('#jsonTable').dataTable();
					}

				});
			});

		});

		$("#roleuserinfo").click(function() {
			$.ajax({
				url : 'getUserList.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "UserRoles.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);

						}
					});
				}
			});

		});

		$("#regularshare")
				.click(
						function() {
							$
									.ajax({
										url : 'regular.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "RegularShare.jsp";
											$.ajax({
														url : address,
														success : function(data) {
															$('#workarea').html(data);
															$('#jsonTable').dataTable();
															
															$("#show").click(function() {
																var parms = {
																			fromDate : $('#fromDate').val(),
																					toDate : $('#toDate').val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "rsEdit.action",
																							dataType : "json",
																							data : parms,
																							success : function(data) {
																								$('#workarea').html(data);
																								$('#jsonTable').dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$("#loading").hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													$(
																															"#regularshare")
																															.trigger(
																																	'click');
																												}
																											});
																								}

																							}
																						});
																			});

														}
													});
										}
									});

						});

		$("#ashare")
				.click(
						function() {
							$
									.ajax({
										url : 'asmember.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "Ashare.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();
															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "asEdit.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													$(
																															"#ashare")
																															.trigger(
																																	'click');
																												}
																											});
																								}

																							}
																						});
																			});

														}
													});
										}
									});

						});

		$("#nominalshare").click(function() {
							$.ajax({
								url : 'nsmember.action',
								method : "post",
								success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "NominalShare.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();
															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val()
																						};
																				$
																						.ajax({
																							method : "post",
																							url : "nsEdit.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													$(
																															"#nominalshare")
																															.trigger(
																																	'click');
																												}
																											});
																								}

																							}
																						});
																			});

														}
													});
										}
									});

						});

		$("#newcontra").click(function() {
			$.ajax({
				url : 'newcontra1.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "NewContra.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});

		/* $("#ashare").click(function(){
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Ashare.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').DataTable();
						}
					});
				}
			});

		}); */

		$("#nominalshare").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "NominalShare.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);

						}
					});
				}
			});

		});

		$("#pending").click(function() {
			$.ajax({
				url : 'pendinglist.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "PendingAuthorized.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});

		$("#withdrawval").click(function() {
			$.ajax({
				url : 'wdrawlist.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "WithdrawValidate.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});

		$("#ledgergroup").click(function() {
			$.ajax({
				url : 'ledgergrouplist.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "LedgerGroup.jsp";

					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();
							$("#subgroupname").autocomplete({

								source : JSON.parse(data.groupnameList),

							});

						}
					});
				}
			});

		});
		$("#ledgeraccount").click(function() {
			$.ajax({
				url : 'ledgeraccoutlist.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "LedgerAccount.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});

		$("#ledgerdetails")
				.click(
						function() {
							$
									.ajax({
										url : 'ledgerdetillist.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "LedgerDetails.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();

															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val(),
																					accountno : $(
																							'#combobox')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "Ldgdetaillist.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								var abcd = data.accountnameaccountname
																										.replace(
																												/\"/g,
																												"");
																								var efgh = data.accountnumberaccountnumbers
																										.replace(
																												/\"/g,
																												"");
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													$(
																															"#accountname")
																															.val(
																																	abcd);
																													$(
																															'.custom-combobox-input')
																															.val(
																																	efgh);
																													setTimeout(
																															function() {
																																$(
																																		'#ledgerdetails')
																																		.trigger(
																																				'click');
																															},
																															30000);
																												}
																											});
																								}
																							}
																						});

																			});

														}

													});
										}
									});

							$.ajax({
								method : "post",
								url : 'clearledgerdetails.action',
								success : function(data) {

								}
							});
						});

		$("#memberdetails")
				.click(
						function() {
							$
									.ajax({
										url : "memberdetiallist.action",
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "MemberDetails.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();
															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val(),
																					accountno : $(
																							'#combobox')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "memberdlist.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								var abcd = data.memberaccountname
																										.replace(
																												/\"/g,
																												"");
																								var efgh = data.memberaccountnumber
																										.replace(
																												/\"/g,
																												"");
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													$(
																															"#accountname")
																															.val(
																																	abcd);
																													$(
																															'.custom-combobox-input')
																															.val(
																																	efgh);
																													setTimeout(
																															function() {
																																$(
																																		'#memberdetails')
																																		.trigger(
																																				'click');
																															},
																															30000);

																												}
																											});
																								}

																							}
																						});
																			});
														}
													});
										}
									});
							$.ajax({
								method : "post",
								url : 'clearledgerdetails.action',
								success : function(data) {

								}
							});
						});

		$("#bodprofile").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "BODProfile.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});
		
		
		$("#fdinterestsetting").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "fdinterestsetting.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});
		
	
		
		$("#memberstatus").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "MemberStatus.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});
		
		
		$("#loanledger").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "LoanLedger.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});
		
		$("#loanpayment").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "LoanPayment.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});
		
		$("#loanreceipt").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "LoanReceipt.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});

		});
		
		
		$("#journal").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Journal.jsp?Time=" + (new Date()).getTime();
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		$("#contra").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Contra.jsp?Time=" + (new Date()).getTime();
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		$("#branchinfo").click(
				function() {
					$.ajax({
						url : 'branchlist.action',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "BranchInfo.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		$("#openingbal").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "openingbalance.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		$("#withdrawprint").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "Withdrawprint.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		$("#depositprint").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "Depositprint.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		$("#membersreport").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "Membersreport.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		$("#passbookdetails").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "PassbookDetails.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});
		
	
		$("#fixeddeposit")
				.click(
						function() {
							$
									.ajax({
										url : 'personalnominallist.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "FixedDeposit.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();
															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "fdEdit.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													$(
																															"#fixeddeposit")
																															.trigger(
																																	'click');
																												}
																											});
																								}

																							}
																						});
																			});

														}
													});
										}
									});

						});

		$("#recurringdeposit")
				.click(
						function() {
							$
									.ajax({
										url : 'personalnominallist.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "RecurringDeposit.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();
															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val(),
																					memberid : $(
																							'#combobox')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "rdEdit.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {

																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();
																													setTimeout(
																															function() {

																																$(
																																		'#recurringdeposit')
																																		.trigger(
																																				'click');
																															},
																															100);
																												}
																											});
																								}

																							}
																						});
																			});

														}
													});
											$
													.ajax({
														url : 'rdmember.action',
														method : "post",
														success : function(data) {
															var page = $(this)
																	.attr(
																			'data-page');
															var address = "RecurringDeposit.jsp";

														}
													});
										}
									});

						});
		/* $("#recurringdeposit").click(function() {
			$.ajax({
				url : 'memrecurring.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "RecurringDeposit.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();
							$("#show").click(function() {
								var parms = {fromDate : $('#fromDate').val(),
											 toDate : $('#toDate').val()
						};
							});
						}
					});
				}
			});

		}); */

		$("#personalloan").click(function() {
			$.ajax({
				url : 'personalmember.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "	PersonalLoan.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

							$.ajax({
								url : 'personalnominallist.action',
								method : "post",
								success : function(data) {
									var page = $(this).attr('data-page');
									var address = "PersonalLoan.jsp";
									$.ajax({
										url : address,
										success : function(data) {
											$('#workarea').html(data);
											$('#jsonTable').dataTable();
										}
									});
								}

							});

						}
					});
				}
			});

		});

		$("#vehicleloan")
				.click(
						function() {
							$
									.ajax({
										url : 'vehiclemember.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "VehicleLoan.jsp";
											$
													.ajax({
														url : address,
														success : function(data) {

															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();

															$
																	.ajax({
																		url : 'getvehiclelist.action',
																		method : "post",
																		success : function(
																				data) {
																			var page = $(
																					this)
																					.attr(
																							'data-page');
																			var address = "VehicleLoan.jsp";
																			$
																					.ajax({
																						url : address,
																						success : function(
																								data) {
																							$(
																									'#workarea')
																									.html(
																											data);
																							$(
																									'#jsonTable')
																									.dataTable();
																							$(
																									"#show")
																									.click(
																											function() {
																												var parms = {
																													fromDate : $(
																															'#fromDate')
																															.val(),
																													toDate : $(
																															'#toDate')
																															.val()
																												};
																												$
																														.ajax({
																															method : "post",
																															url : "vehicledate.action",
																															dataType : "json",
																															data : parms,
																															success : function(
																																	data) {
																																$(
																																		'#workarea')
																																		.html(
																																				data);
																																$(
																																		'#jsonTable')
																																		.dataTable();
																																var errorString = data.errorString;
																																var resultString = data.resultString;
																																if (resultstring == "error") {
																																	$(
																																			"#loading")
																																			.hide();
																																	alert(errorString);
																																	return;
																																} else {
																																	$
																																			.ajax({
																																				method : "post",
																																				url : address,
																																				success : function(
																																						data) {
																																					$(
																																							'#workarea')
																																							.html(
																																									data);
																																					$(
																																							'#jsonTable')
																																							.dataTable();

																																				}
																																			});
																																}

																															}
																														});
																											});

																						}
																					});
																		}

																	});

														}
													});
										}
									});

						});

		$("#homeloan").click(function() {
			$.ajax({
				url : 'personalnominallist.action',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "HomeLoan.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		$("#agent").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Agent.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		
		$("#saccount").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Savings.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});
		
		
		$("#paccount").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Personal.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});
		
		
		
		
		$("#pholder").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "PigmiHolder.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		$("#precp").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "PigmiRecipt.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		$("#ploan").click(function() {
			$.ajax({
				url : '',
				method : "post",
				success : function(data) {
					var page = $(this).attr('data-page');
					var address = "PigmiLoan.jsp";
					$.ajax({
						url : address,
						success : function(data) {
							$('#workarea').html(data);
							$('#jsonTable').dataTable();

						}
					});
				}
			});
		});

		$("#trialbal").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "trialbalance.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		$("#userinformation")
				.click(
						function() {
							$
									.ajax({
										url : 'adduserslist.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "addUser.jsp?Time="
													+ (new Date()).getTime();
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();

															$("#addNewUser")
																	.click(
																			function() {

																				var userName = $
																						.trim($(
																								'#userName')
																								.val());
																				var password = $
																						.trim($(
																								'#password')
																								.val());
																				password = CryptoJS
																						.SHA3(password);
																				var userType = $(
																						'#userType')
																						.val();
																				var employeeName = $
																						.trim($(
																								'#employeeName')
																								.val());
																				var designation = $
																						.trim($(
																								'#designation')
																								.val());
																				var mobilenumber = $
																						.trim($(
																								'#mobilenumber')
																								.val());
																				var age = $
																						.trim($(
																								'#age')
																								.val());
																				var bankname = $
																						.trim($(
																								'#bankname')
																								.val());
																				var branchname = $
																						.trim($(
																								'#branchname')
																								.val());
																				var employeeId = $
																						.trim($(
																								'#employeeId')
																								.val());
																				var dateofbirth = $
																						.trim($(
																								'#dateofbirth')
																								.val());
																				var dateofjoining = $
																						.trim($(
																								'#dateofjoining')
																								.val());
																				var gender = $
																						.trim($(
																								'#gender')
																								.val());
																				var hobbies = $
																						.trim($(
																								'#hobbies')
																								.val());
																				var reqto = $
																						.trim($(
																								'#reqto')
																								.val());
																				var fathername = $
																						.trim($(
																								'#fathername')
																								.val());
																				var raddress = $
																						.trim($(
																								'#raddress')
																								.val());
																				var caddress = $
																						.trim($(
																								'#caddress')
																								.val());
																				var bloodgroup = $
																						.trim($(
																								'#bloodgroup')
																								.val());
																				var resno = $
																						.trim($(
																								'#resno')
																								.val());
																				var apname = $
																						.trim($(
																								'#apname')
																								.val());
																				var apnumber = $
																						.trim($(
																								'#apnumber')
																								.val());
																				var otherdetails = $
																						.trim($(
																								'#otherdetails')
																								.val());

																				if ($
																						.trim(userName).length == 0) {
																					alert("Provide username");
																				} else if ($
																						.trim(password).length == 0) {
																					alert("Provide password");
																				} else if ($
																						.trim(userType).length == 0) {
																					alert("Provide Type of User");
																				} else if ($
																						.trim(employeeName).length == 0) {
																					alert("Provide Employee Name");
																				} else if ($
																						.trim(designation).length == 0) {
																					alert("Provide Desination");
																				} else if ($
																						.trim(mobilenumber).length == 0) {
																					alert("Provide Mobile Number");
																				} else if ($
																						.trim(age).length == 0) {
																					alert("Provide Age");
																				} else if ($
																						.trim(bankname).length == 0) {
																					alert("Provide Bank Name");
																				} else if ($
																						.trim(branchname).length == 0) {
																					alert("Provide Branch Name");
																				} else if ($
																						.trim(employeeId).length == 0) {
																					alert("Provide Employee Id");
																				} else if ($
																						.trim(dateofbirth).length == 0) {
																					alert("provide Date Of Birth");
																				} else if ($
																						.trim(dateofjoining).length == 0) {
																					alert("Provide Date of Joining");
																				} else if ($
																						.trim(gender).length == 0) {
																					alert("Provide gender");
																				} else if ($
																						.trim(hobbies).length == 0) {
																					alert("Provide Hobbies");
																				} else if ($
																						.trim(reqto).length == 0) {
																					alert("Provide Req To");
																				} else if ($
																						.trim(fathername).length == 0) {
																					alert("Provide Father Name");
																				} else if ($
																						.trim(raddress).length == 0) {
																					alert("Provide Residenace Address");
																				} else if ($
																						.trim(caddress).length == 0) {
																					alert("Provide Current Address");
																				} else if ($
																						.trim(bloodgroup).length == 0) {
																					alert("Provide Blood Group");
																				} else if ($
																						.trim(resno).length == 0) {
																					alert("Provide Res No");
																				} else if ($
																						.trim(apname).length == 0) {
																					alert("Provide Alternate Person Name");
																				} else if ($
																						.trim(apnumber).length == 0) {
																					alert("Provide Alternate Person Number");
																				} else if ($
																						.trim(otherdetails).length == 0) {
																					alert("Provide Other Details");
																				} else {
																					var parms = {
																						userName : userName,
																						password : password
																								.toString(),
																						userType : userType,
																						employeeName : employeeName,
																						designation : designation,
																						mobilenumber : mobilenumber,
																						age : age,
																						bankname : bankname,
																						branchname : branchname,
																						employeeId : employeeId,
																						dateofbirth : dateofbirth,
																						dateofjoining : dateofjoining,
																						gender : gender,
																						hobbies : hobbies,
																						reqto : reqto,
																						fathername : fathername,
																						raddress : raddress,
																						caddress : caddress,
																						bloodgroup : bloodgroup,
																						resno : resno,
																						apname : apname,
																						apnumber : apnumber,
																						otherdetails : otherdetails,

																					};
																					$
																							.ajax({
																								type : "POST",
																								url : "addusers.action",
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
																			});
														}
													});
										}
									});
						});

		$(".dw-links").click(function() {
			var page = $(this).attr('data-page');
			var address = page + "?Time=" + (new Date()).getTime();
			$.ajax({
				url : address,
				success : function(data) {
					$('#workarea').html(data);

					$("#new").click(function() {
						$("#basicModal").modal('show');
					});

				},
				async : false

			});
		});

		$(".rs-links").click(function() {
			var page = $(this).attr('data-page');
			var address = page + "?Time=" + (new Date()).getTime();
			$.ajax({
				url : address,
				success : function(data) {
					$('#workarea').html(data);

					$("#new1,#new2,#new3,#new4").click(function() {

						$('#basicModal').modal('show');

					});

				},
				async : false

			});

		});

		$(".as-links").click(function() {
			var page = $(this).attr('data-page');
			var address = page + "?Time=" + (new Date()).getTime();
			$.ajax({
				url : address,
				success : function(data) {
					$('#workarea').html(data);

					$("#new1,#new2,#new3,#new4").click(function() {

						$('#basicModal').modal('show');

					});

				},
				async : false

			});

		});
		
		
		$("#pwd").click(
				function() {
					$.ajax({
						url : '',
						method : "post",
						success : function(data) {
							var page = $(this).attr('data-page');
							var address = "ChangePwd.jsp?Time="
									+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
									$('#workarea').html(data);
									$('#jsonTable').dataTable();

								}
							});
						}
					});
				});

		/* $(".rs-links1").click(function() {
			var page = $(this).attr('data-page');
			var address = page + "?Time=" + (new Date()).getTime();
			$.ajax({
				url : address,
				success : function(data) {
					$('#workarea').html(data);
					
							
							$("#new1").click(function() {
								$("#basicModal1").modal('show');
							});
						
						
				},
				async : false
					
				});
			
			
		});
		 */

		$("#deposit")
				.click(
						function() {
							$
									.ajax({
										url : 'receiptnumber.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "Deposit.jsp?Time="
													+ (new Date()).getTime();
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();
															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "addreceiptlist.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();

																												}
																											});
																								}
																							}
																						});
																			});

														}
													});
										}
									});
						});

		$("#withdraw")
				.click(
						function() {
							$
									.ajax({
										url : 'withdrawnumber.action',
										method : "post",
										success : function(data) {
											var page = $(this)
													.attr('data-page');
											var address = "Withdraw.jsp?Time="
													+ (new Date()).getTime();
											$
													.ajax({
														url : address,
														success : function(data) {
															$('#workarea')
																	.html(data);
															$('#jsonTable')
																	.dataTable();

															$("#show")
																	.click(
																			function() {
																				var parms = {
																					fromDate : $(
																							'#fromDate')
																							.val(),
																					toDate : $(
																							'#toDate')
																							.val()
																				};
																				$
																						.ajax({
																							method : "post",
																							url : "addwithdrawlist.action",
																							dataType : "json",
																							data : parms,
																							success : function(
																									data) {
																								$(
																										'#workarea')
																										.html(
																												data);
																								$(
																										'#jsonTable')
																										.dataTable();
																								var errorString = data.errorString;
																								var resultString = data.resultString;
																								if (resultString == "error") {
																									$(
																											"#loading")
																											.hide();
																									alert(errorString);
																									return;
																								} else {
																									$
																											.ajax({
																												method : "post",
																												url : address,
																												success : function(
																														data) {
																													$(
																															'#workarea')
																															.html(
																																	data);
																													$(
																															'#jsonTable')
																															.dataTable();

																												}
																											});
																								}

																							}
																						});
																			});

														}
													});
										}
									});
						});

		$("#logout").click(function() {
			window.location.href = "login.jsp";
		});
	</script>
</body>
</html>