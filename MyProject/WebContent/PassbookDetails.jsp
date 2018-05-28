<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <% Integer number= (Integer)session.getAttribute("membersize"); %> --%>
<%-- <% Integer autoincrement=number+2 ;%> --%>
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


	<br />
	<!-- h3 align="center">Passbook Details</h3><br/> -->
	<div class="row">
		<fieldset class="scheduler-border">
			<legend class="scheduler-border">Passbook Details</legend>


			<div class="col-sm-3">
				<div class="form-group">
					<label>Bank Name</label> <select id="bankname" class="form-control">
						<option value="Padmashree Credit Co-operative Society Limited">Padmashree
							Credit Co-operative Society Limited</option>
					</select>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label>Bank Code</label> <select id="bankcode" class="form-control">
						<option value="PCCSL">PCCSL</option>
					</select>
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

			<div class="col-sm-3">
				<div class="form-group">
					<label>Account Number</label> <select id="accounttype"
						class="form-control">
					</select>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Member Id</label> <input type="text"
							id="memberid" readonly="readonly" autocomplete="off"
							class="form-control" />
					</div>
				</div>
			</div>
			
			
			<div class="col-sm-3">
				<div class="form-group">
					<label>Account Name</label> <input type="text" id="accountname"
						autocomplete="off" class="form-control" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label>Contact Number</label> <input type="text" id="cell"
						autocomplete="off" class="form-control" />
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<label>Address</label>
					<textarea class="form-control" id="address"></textarea>
				</div>
			</div>
		</fieldset>
	</div>

	<div>
		<button type="button" id="passbook" data-type='Statement'
			class="btn btn-primary">Statement</button>
	</div>

	<script type="text/javascript">
$("#passbook").click(function() {
			var rowinfo = $(this).closest('tr').find('td').map(function () {
					return $(this).text();
					}).get();
						
						
					/* 	$(".deletee").attr('data-id',rowinfo[0]); */


			$.ajax({
					url : '',
					method : "post",
					success : function(data) {
					var page = $(this).attr('data-page');
					var address = "Passbook.jsp?Time="+ (new Date()).getTime();
							$.ajax({
								url : address,
								success : function(data) {
										$('#workarea').html(data);
										$('#jsonTable1').dataTable();
										
										
								
									}
								});
							}
					});
		});
</script>

</body>
</html>