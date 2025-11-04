<%@page import="dao.OwnerDao"%>
<%@ page language="java" import="java.util.*,model.Owner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<style>
body {
  background: linear-gradient(135deg, #0a0f1e, #1a1f3b);
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
  box-shadow: 0 0 20px rgba(255, 0, 200, 0.3);
  padding: 25px;
}

h4 {
  color: #ff00ff;
  text-shadow: 0 0 10px #ff00ff;
  font-weight: 600;
}

.table thead {
  background-color: rgba(255, 0, 255, 0.2);
}

.table tbody tr:hover {
  background: rgba(255, 0, 255, 0.15);
  transition: 0.3s;
}
</style>
</head>
<body>
<div class="container">
  <h4><i class="fa-solid fa-user-tie me-2"></i>Owner List</h4>
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
        List<Owner> owners = OwnerDao.getAllOwners();
        if (owners != null) {
            for (Owner o : owners) {
      %>
        <tr>
          <td><%= o.getOwnerId()%></td>
          <td><%= o.getName() %></td>
          <td><%= o.getEmail() %></td>
          <td><%= o.getContact()%></td>
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
