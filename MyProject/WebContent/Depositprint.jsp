<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% Integer number= (Integer)session.getAttribute("membersize"); %>
 
<%@ page import="com.entities.*, java.util.*,java.text.*" %>
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
       .form-control1 {
    	border: 0;
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


</style>


</head>
<body>

	
			<div class="row">
					<fieldset  class="scheduler-border">
						<legend  class="scheduler-border">Deposit</legend>
						
							<div class="ui-widget">
						<div class="col-xs-3">
							<div class="form-group" align="center">
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
				
				<!-- <div class="col-xs-2">
						<br/>
				<button type="button" id="print" data-type='Print'
							class="btn btn-primary">Print</button>
				</div> -->
				</fieldset>
			</div>
						
	
	<div class="table-responsive" id="tableDiv" >
		<div class="wraper">
			<!-- Begining -->
			<table border="1"  id="jsonTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						
						<th>Sl No</th>
						<th>Deposit No</th>
						<th>Member Id</th>
						<th>Account No</th>
						<th>Name</th>
						<th>Amount</th>
						
					</tr>
				</thead>
				<tbody>
				
				
				</tbody>
			</table>
					
			
		</div>
	</div>
	</div><br/>
	 <div class="row">
								<div class="col-sm-4">
										<div class="form-group" align="right">
											<label>Total</label> 
										</div>
								</div>
								 <div class="col-sm-4">
									<div class="form-group">
												 <input type="text" id="dbt" class="form-control1 no-border"
													class="form-control" value="Rs.00"/>
									</div>
								</div>
								
							</div>
							

					<div class="modal-footer">

						<button type="button" id="print" data-type='Print'
							class="btn btn-primary">Print</button>
	               </div>

</body>
</html> 