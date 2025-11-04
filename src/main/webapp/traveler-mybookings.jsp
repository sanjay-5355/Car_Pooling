<%@page import="dao.RideDao"%>
<%@page import="model.Ride"%>
<%@page import="model.Traveler"%>
<%@page import="java.util.List"%>
<%@include file="traveler-header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>My Bookings</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #0d1117;
	color: white;
}

.table {
	color: white;
}
</style>
</head>
<body>

	<%
	Traveler t = (Traveler) session.getAttribute("data");
	if (t == null) {
		response.sendRedirect("traveler-login.jsp");
		return;
	}

	List<Ride> list = RideDao.getRidesBookedByTraveler(t.getId());
	%>

	<div class="container mt-5">
		<h3 class="text-center text-warning mb-4">My Bookings</h3>

		<table class="table table-bordered text-center">
			<thead class="table-dark">
				<tr>
					<th>Pickup</th>
					<th>Drop</th>
					<th>Date</th>
					<th>Time</th>
					<th>Fare (₹)</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				if (list != null ) {
					for (Ride r : list) {
				%>
				<tr>
					<td><%=r.getPickupLocation()%></td>
					<td><%=r.getDropLocation()%></td>
					<td><%=r.getTravelDate()%></td>
					<td><%=r.getPickupTime()%></td>
					<td><%=r.getFare()%></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6" class="text-muted">No bookings found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
