<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/ui.all.css" />
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
					<legend>Login Details</legend>
					<div class="modal-body">

						<div class="row">
							<fieldset>

								<div class="col-md-3">
									<div class="form-group">
										<label>userId</label> <input type="text" id="userid"
											class="form-control" />
									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">
										<label>FirstName</label> <input type="text" id="firstName"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>MiddleName</label> <input type="text" id="middleName"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>LastName</label> <input type="text" id="lastName"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>email</label> <input type="text" id="email"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>password</label> <input type="password" id="password"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>confirm password</label> <input type="password"
											id="confirmpassword" class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">

										<label>Locked</label><input type="checkbox" name="locked"
											value="Active"><br>
									</div>
								</div>
							</fieldset>
						</div>

					</div>
				</fieldset>
				<fieldset>
					<legend>Personal Details </legend>

					<div class="modal-body">

						<div class="row">
							<fieldset>

								<div class="col-md-3">
									<div class="form-group">
										<label>Address1</label> <input type="text" id="Adress1"
											class="form-control" />
									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">
										<label>Address2</label> <input type="text" id="Address2"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>city</label> <input type="text" id="city"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>State</label> <input type="text" id="State"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>ZipCode</label> <input type="text" id="ZipCode"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>gender</label> <input type="text" id="gender"
											class="form-control" />

									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Phone Number</label> <input type="text"
											id="MobileNumber" class="form-control" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">

										<label>Fax</label><input type="text" id="fax"
											class="form-control">
									</div>
								</div>

							</fieldset>
						</div>



					</div>
				</fieldset>

				<fieldset>
					<legend>Official Details</legend>

					<div class="modal-body">

						<div class="row">
							<fieldset>

								<div class="col-md-3">
									<div class="form-group">

										<label>place</label>
										<button class="btn btn-default dropdown-toggle" type="button"
											id="menu1" data-toggle="dropdown" class="col-mid-3">
											select <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">HTML</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">CSS</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">JavaScript</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">About Us</a></li>
										</ul>



									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">

										<label>Roles</label>
										<button class="btn btn-default dropdown-toggle" type="button"
											id="menu1" data-toggle="dropdown" class="col-mid-3">
											select <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">HTML</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">CSS</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">JavaScript</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">About Us</a></li>
										</ul>
									</div>
								</div>

							</fieldset>
						</div>

					</div>
				</fieldset>




				<div class="modal-footer">

					<button type="button" id="save" class="btn btn-primary">Save</button>
					<button type="button" id="cancel" class="btn btn-primary">Cancel</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>


