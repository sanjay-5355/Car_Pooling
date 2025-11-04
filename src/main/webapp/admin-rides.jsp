<%@page import="dao.RideDao"%>
<%@page import="java.util.*,model.Ride"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ride List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
    color: #fff;
    font-family: 'Poppins', sans-serif;
    min-height: 100vh;
    padding: 40px;
}
.container {
    max-width: 1000px;
    margin: auto;
}
h4 {
    color: #00ffff;
    text-shadow: 0 0 15px #00ffff;
    text-align: center;
    font-weight: 700;
    margin-bottom: 30px;
}
.table {
    background: rgba(0, 0, 0, 0.5);
    box-shadow: 0 0 25px #00ffff44;
    border-radius: 12px;
    overflow: hidden;
}
.table thead {
    background: linear-gradient(90deg, #00ffff55, #0077ff55);
    color: #00ffff;
}
.table-hover tbody tr:hover {
    background-color: rgba(0, 255, 255, 0.1);
}
</style>
</head>

<body>
<div class="container">
	<h4><i class="fa-solid fa-car-side me-2"></i>Ride List</h4>

	<table class="table table-dark table-hover text-center align-middle">
		<thead>
			<tr>
				<th>ID</th>
				<th>Pickup</th>
				<th>Drop</th>
				<th>Fare</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<Ride> rides = RideDao.getAllRides();
				if (rides != null) {
					for (Ride r : rides) {
			%>
			<tr>
				<td><%= r.getId() %></td>
				<td><%= r.getPickupLocation() %></td>
				<td><%= r.getDropLocation() %></td>
				<td><%= r.getFare() %></td>
			</tr>
			<%
					}
				} else {
			%>
			<tr>
				<td colspan="5">🚗 No rides found.</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>
