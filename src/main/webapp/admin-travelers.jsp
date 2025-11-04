<%@page import="dao.RideDao"%>
<%@page import="dao.TravelerDao"%>
<%@ page language="java" import="java.util.*,model.Traveler" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Traveler List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<style>
body {
  background: radial-gradient(circle, #010f1a, #0a1a33, #13284d);
  color: #fff;
  font-family: 'Poppins', sans-serif;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding-top: 60px;
}

.container {
  width: 85%;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 15px;
  backdrop-filter: blur(10px);
  box-shadow: 0 0 20px rgba(0, 255, 100, 0.3);
  padding: 25px;
}

h4 {
  color: #00ff88;
  text-shadow: 0 0 10px #00ff88;
  font-weight: 600;
}

.table thead {
  background-color: rgba(0, 255, 100, 0.2);
}

.table tbody tr:hover {
  background: rgba(0, 255, 100, 0.15);
  transition: 0.3s;
}
</style>
</head>
<body>
<div class="container">
  <h4><i class="fa-solid fa-users me-2"></i>Traveler List</h4>
  <table class="table table-hover mt-4">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
      </tr>
    </thead>
    <tbody>
      <%
        List<Traveler> travelers = TravelerDao.getAllTravelers();
        if (travelers != null) {
            for (Traveler t : travelers) {
      %>
        <tr>
          <td><%= t.getId() %></td>
          <td><%= t.getName() %></td>
          <td><%= t.getEmail() %></td>
          <td><%= t.getContact()%></td>
        </tr>
      <%
            }
        }
      %>
    </tbody>
  </table>
</div>
</body>
</html>
