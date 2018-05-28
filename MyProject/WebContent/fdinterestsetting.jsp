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


	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"> Interest Setting</h4>
				</div>


				<div class="modal-body">



					<div class="row">

						<fieldset class="scheduler-border">
							<legend class="scheduler-border">Interest Setting</legend>


							<!-- <div class="ui-widget"> -->
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<label>Effected Date From</label> <input type="text"
											id="effectdate" autocomplete="off" class="form-control" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label>Type</label> <input type="text"
											id="Type" autocomplete="off" class="form-control" />
									</div>
								</div>


								<div class="col-xs-3">
									<div class="form-group">
										<div class='input-group date' data-provide="datepicker"
											data-date-autoclose="true" data-date-today-btn="linked"
											data-date-today-highlight="true"
											data-date-format="dd.mm.yyyy">
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
											data-date-today-highlight="true"
											data-date-format="dd.mm.yyyy">
											<label>To Date </label><input id="toDate"
												class="form-control date"
												value="<fmt:formatDate pattern='dd.MM.yyyy' value='<%=new java.util.Date()%>' />">
											<span class="input-group-addon"><span
												class="icon icon-calendar"></span> </span>
										</div>
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

								<div class="col-sm-3">
									<div class="form-group">
										<label>Women and above 60 Years+</label> <input type="text"
											id="womenabove" autocomplete="off" class="form-control" />
									</div>
								</div>
							</div>

							<div class="modal-footer">
								<input type="button" id="submit" class="btn btn-primary"
									value="Submit" />
							</div>

						</fieldset>
					</div>

				</div>



			</div>
		</div>

	</div>
	<!-- /.modal -->

	<fieldset>
		<legend> Interest Setting </legend>
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
						<th>Sl No</th>
						<th>From</th>
						<th>To</th>
						<th>Rate Of Interest</th>
						<th>Women and above 60 Years+</th>
					</tr>
				</thead>

			</table>
		</div>
	</div>


	<button type="button" data-toggle="modal" data-target="#basicModal"
		data-backdrop="static" data-keyboard="false">NEW</button>
</body>
</html>




















