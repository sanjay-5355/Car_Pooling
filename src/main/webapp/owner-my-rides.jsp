<%@page import="dao.RideDao"%>
<%@page import="dao.OwnerDao"%>
<%@page import="model.Ride"%>
<%@page import="model.Owner"%>
<%@page import="java.util.List"%>
<%@include file="owner-header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Rides</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #121212;
	color: #fff;
}

.table {
	color: #fff;
}
</style>
</head>

<body>

	<div class="container mt-5">
		<h3 class="text-center mb-4 text-warning">My Rides</h3>

		<table class="table table-bordered table-hover text-center">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Pickup</th>
					<th>Drop</th>
					<th>Date</th>
					<th>Time</th>
				</tr>
			</thead>
			<tbody>

				<%
				Owner o = (Owner) session.getAttribute("data");

				if (o != null) {
					List<Ride> list = RideDao.getRidesByOwnerId(o.getOwnerId());

					for (Ride r : list) {
				%>

				<tr>
					<td><%=r.getId()%></td>
					<td><%=r.getPickupLocation()%></td>
					<td><%=r.getDropLocation()%></td>
					<td><%=r.getTravelDate()%></td>
					<td><%=r.getPickupTime()%></td>
				</tr>

				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6" class="text-muted">No rides found.</td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>

</body>
</html>
