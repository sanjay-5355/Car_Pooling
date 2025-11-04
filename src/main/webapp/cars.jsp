<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dao.CarDao,model.Car" %>
<%@ include file="traveler-header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Cars</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'DM Sans', sans-serif;
        background-color: #f8f9fa;
    }
    .car-card {
        border-radius: 12px;
        overflow: hidden;
        transition: 0.3s;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .car-card:hover {
        transform: translateY(-5px);
    }
    .car-img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
</style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Available Cars</h2>

    <div class="row">
        <%
            List<Car> cars = CarDao.getAllCars();
            if (cars != null && !cars.isEmpty()) {
                for (Car c : cars) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card car-card">
                <img src="imagess/<%= c.getImage() %>" class="car-img" alt="Car Image">
                <div class="card-body">
                    <h5 class="card-title"><%= c.getModel() %></h5>
                    <p class="card-text">
                        <b>Car No:</b> <%= c.getNumber() %><br>
                        <b>Seats:</b> <%= c.getSeats() %><br>
                        <b>Age:</b> <%= c.getAge() %> years<br>
                        <b>Amount:</b> ₹<%= c.getAmount() %><br>
                        <b>Registration Date:</b> <%= c.getRegistrationDate() %>
                    </p>
                    <a href="services.jsp?carId=<%= c.getId() %>" class="btn btn-success">Book This Car</a>
                </div>
            </div>
        </div>
        <% 
                }
            } else {
        %>
        <div class="col-12 text-center">
            <p>No cars available right now.</p>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
