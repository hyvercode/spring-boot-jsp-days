<%@ include file="layout/navigation.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<h5 class="panel-heading mt-2">Create User</h5>
				<div class="panel-body mt-3">
					<form method="post" action="/users/user">
						<div class="form-group mb-3">
							<label class="label-control">Name</label> <input id="name"
								name="name" type="text" class="form-control" placeholder="Input your name" required="required" />
						</div>
						<div class="form-group mb-3">
							<label class="label-control">Email</label> <input id="email" placeholder="Input youe email"
								name="email" type="email" class="form-control"
								required="required" />
						</div>

						<button type="submit" class="btn btn-success">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
