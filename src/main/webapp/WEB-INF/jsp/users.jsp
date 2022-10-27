<%@ include file="layout/navigation.jsp"%>

<div class="container">
	<div class="d-flex justify-content-between mt-5">
		<h5>Users</h5>
		<div>
			<a href="/users" class="btn btn-primary">Refresh</a> <a
				href="/users/user" class="btn btn-primary">Create</a>
		</div>
	</div>
	<div class="mt-2">
		<table class="table table-hover" aria-label="users">
			<thead>
				<tr class="table-active">
					<th scope="col">No.</th>
					<th scope="col">Fullname</th>
					<th scope="col">Email</th>
					<th scope="col">Birth Date</th>
					<th scope="col">Active</th>
					<th scope="col">#</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}" varStatus="loop">
					<tr onclick="alert(${user.userId})">
						<th scope="row">${loop.index+1}</th>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td>${user.birthDate}</td>
						<td>${user.isActive?'Yes':'No'}</td>
						<td><a href="/users/user/${user.userId}">Edit |</a><a
							href="/users/delete/${user.userId}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:if test="${!empty error}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<strong><%=response.getStatus()%></strong> Error: ${error}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>

		<c:if test="${empty error}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong><%=response.getStatus()%></strong> Success
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
	</div>
</div>
