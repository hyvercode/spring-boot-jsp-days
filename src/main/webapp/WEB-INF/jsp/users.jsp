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
					<th scope="col">#</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}" varStatus="loop">
					<tr onclick="alert(${user.userId})">
						<th scope="row">${loop.index+1}</th>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td><a href="/users/edit/${user.userId}">Edit |</a><a
							href="/users/delete/${user.userId}">Delete</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>


	</div>
</div>
