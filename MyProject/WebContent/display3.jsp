<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<!-- <div class="container">
        <h2 style="text-align: center;"></h2>
        <div class="row text-center">
            <h3>The Basic Modal</h3>
            <a href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#basicModal">Click to open Modal</a>
        </div>
        <hr>
       
        <hr>

    </div> -->

	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<fieldset>
					<legend>Roles</legend>
					<div class="modal-body">

						<div class="row">
							<fieldset>

								<div class="col-md-3">
									<div class="form-group">
										<label>Functions</label> <input type="text" id="login"
											class="form-control" />
									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">
										<label>operations</label> <input type="text" id="firstName"
											class="form-control" />
									</div>
								</div>


							</fieldset>
						</div>

					</div>
				</fieldset>



				<div class="modal-footer">

					<button type="button" class="btn btn-primary">Save</button>
					<button type="button" class="btn btn-primary">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>