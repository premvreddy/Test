<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <%@ page import="com.actions.*,com.entities.*,java.text.*,java.util.*"  %>  
<s:set name="userName" value="#session.userName"/>
<s:set name="receiptlist" value="#session.receiptlist"/> 
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
padding:32px;
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
						<th class="abc">Bank Name</th>
						<th class="abc">Bank Code</th>
						<th class="abc"	>User Name</th>
						<th>Receipt No</th>
						<th>MemberID</th>
						<th>Account NO</th>
						<th>Receipt Date</th>
						<th>Name</th>
						<th>Amount</th>
						<th>Actions</th>

					</tr>
				</thead>
				<tbody>
				 <s:iterator id="withdrawbean" value="#session.wdrawlist" status="i">
						<tr>
							
							<td>${withdrawbean.slno}<input type="hidden"
								value="${withdrawbean.slno}" /></td>
								
							  <td class="abc">${withdrawbean.bankname}<input type="hidden"
								value="${withdrawbean.bankname}" /></td>
								
								<td class="abc">${withdrawbean.bankcode}<input type="hidden"
								value="${withdrawbean.bankcode}" /></td>
								
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
								
										
								<td>  	<s:url id="myActionUrl" action="validation1" />
                      					 <form action="<s:property value="%{myActionUrl}" />">
                                <input type="hidden" name="withdrawNo" value="${withdrawbean.withdrawno}"/>
                               <input type="submit" name="button" value="Validate"/>
	                           <input type="submit" name="button" value="Reject"/>
								         </form>
								</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>
	
				
</body>
</html>














