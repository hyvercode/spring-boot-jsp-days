<%@ include file="layout/navigation.jsp"%>

<div class="container">
	<div class="warning mt-4">
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
	<div class="d-flex justify-content-between mt-5">
		<h5>Users</h5>
		<div>
			<a href="/users?page=${page.number+1}&size=${page.size}"
				class="btn btn-primary">Refresh</a> <a href="/users/user"
				class="btn btn-primary">Create</a>
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
				<c:forEach var="user" items="${page.content}" varStatus="loop">
					<tr onclick="alert(${user.userId})">
						<th scope="row">${(page.number) * page.size + loop.index + 1}</th>
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
		<div class="mb-1">
			<form method="GET" action="/users?"
				class="d-flex justify-content-between">
				<input type="text" id="page" name="page" value="1" hidden>
				<nav>
					<ul class="pagination">
						<c:if test="${page.hasPrevious()}">
							<li class="page-item"><a class="page-link"
								href="/users?page=${page.number}&size=${page.size}">Prev</a></li>
						</c:if>
						<li class="page-item"><a class="page-link">${page.number +1}</a></li>
						<li class="page-item active" aria-current="page"><a
							class="page-link">/</a></li>
						<li class="page-item"><a class="page-link">${page.totalPages}</a></li>
						<c:if test="${!page.last}">
							<li class="page-item"><a class="page-link"
								href="/users?page=${page.number + 2}&size=${page.size}">Next</a></li>
						</c:if>
					</ul>
				</nav>
				<div class="d-flex p-1">
					<label class="p-2">Rows: </label> <select id="size" name="size"
						class="form-select form-select-sm" value="{$page.size}"
						onchange="this.form.submit()">
						<option value="5" ${page.size==5?'selected':''}>5</option>
						<option value="10" ${page.size==10?'selected':''}>10</option>
						<option value="100" ${page.size==100?'selected':''}>100</option>
						<option value="${page.totalElements}"
							${page.size==page.totalElements?'selected':''}>All</option>
					</select>
				</div>
			</form>
		</div>
	</div>
</div>
