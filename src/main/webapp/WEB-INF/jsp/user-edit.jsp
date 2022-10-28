<%@ include file="layout/navigation.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<h5 class="panel-heading mt-2">Create Update</h5>
				<div class="panel-body mt-3">
					<form method="POST" action="/users/user/update">
						<div class="form-group mb-3">
							<label class="label-control">ID</label> <input id="userId"
								name="userId" type="text" class="form-control"
								placeholder="Input your name" required="required"
								value="${user.userId}" readonly />
						</div>
						<div class="form-group mb-3">
							<label class="label-control">Name</label> <input id="name"
								name="name" type="text" class="form-control"
								placeholder="Input your name" value="${user.name}"
								required="required" />
						</div>
						<div class="form-group mb-3">
							<label class="label-control">Email</label> <input id="email"
								placeholder="Input youe email" name="email" type="email"
								class="form-control" value="${user.email}" required="required" />
						</div>
						<div class="form-group mb-3">
							<label class="label-control">Birth Date</label> <input
								id="birthDate" name="birthDate" value="${user.birthDate}"
								type="date" class="form-control" required="required" />
						</div>
						<div class="form-group mb-3">
							<label class="label-control">Active</label> <select id="isActive"
								name="isActive" class="form-select" value="${user.isActive}"
								required="required">
								<option value="true" ${user.isActive?'selected':''}>Yes</option>
								<option value="false" ${user.isActive?'':'selected'}>No</option>
							</select>
						</div>
						<button class="btn btn-warning mr-2" onclick="history.back()">Cancel</button>
						<button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
