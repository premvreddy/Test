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

.form-group .required .control-label:after {
	content: "*";
	color: red;
	content-size: 10px;
}
</style>
</head>
<body>
	<fieldset class="scheduler-border">

		<legend class="scheduler-border">PigmiRecipt</legend>
		
		
		
						<div class="col-xs-3">
							<div class="form-group">
								<div class="form-group required">
									<div class='input-group date'  data-provide="datepicker"
										data-date-autoclose="true" data-date-today-btn="linked"
											 	data-date-today-highlight="true" data-date-format="dd-mm-yyyy">
										<label class="control-label"> Date </label><input  id="dob" class="form-control date" 
										value="<fmt:formatDate pattern='dd-MM-yyyy' value='<%=new java.util.Date()%>' />">
										 <span class="input-group-addon"><span
												class="icon icon-calendar"></span> </span> 
										</div>
								</div>
							</div>
						</div>
						
			
			
			
			
			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Agent Name</label> <select id="agname"
						class="form-control">
						<option value=""></option>
						</select>
					</div>
				</div>
			</div>
			
						
			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Pigmi Recipt No</label> <input type="text"
							id="precpno" class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<div class="form-group required">
						<label class="control-label">Agent Code</label><input type="text"
							id="agentcode" class="form-control">
					</div>
				</div>
			</div>
			
				</fieldset>
			<fieldset class="scheduler-border">
			<div class="row">
			<div class="col-sm-3">
				<div class="form-group">	
					<label class="control-label">PigmiHolder Name</label> <select id="pgname"
						class="form-control">
						<option value=""></option>
						</select>
					</div>
				</div>
			
			
			
					<div class="col-sm-3">
				<div class="form-group">
					
						<label class="control-label"> Code</label><input type="text"
							id="code" class="form-control">
					</div>
				</div>
			
				<div class="col-sm-3">
				<div class="form-group">

					<label>Amount</label><input type="text" id="amt"
						class="form-control">
				</div>
			</div>
			
		

	<div class="modal-footer">
		<input type="button" id="submit" class="btn btn-primary"
			value="Insert" />
	</div>
	</div>
	
	<div class="table-responsive" id="tableDiv">
		<table border="1" id="jsonTable"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Sl no</th>
					<th>PigmiHolder Name</th>
					<th>PigmiHolder Code</th>
					<th>Amount</th>
				</tr>
			</thead>
			
		</table>
	</div>
	
	
                                         
	</fieldset>
	
	
				<div class="modal-footer">
					<input type="button" id="save" class="btn btn-primary" value="Save" />
					<input type="button" id="cancel" class="btn btn-primary"
						value="Cancel" />
						 <input type="button" id="exit"
						class="btn btn-primary" value="Exit" />
				</div>
			
		</body>
		
		</html>
