<%@ page import="model.Ride" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ride Confirmation | CarPooling</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
body {
    font-family: 'DM Sans', sans-serif;
    background-color: #121212;
    color: #fff;
    min-height: 100vh;
}

.confirm-container {
    max-width: 800px;
    margin: 80px auto;
    padding: 40px;
    background: #1c1c1c;
    border-radius: 16px;
    border: 1px solid #333;
    box-shadow: 0 0 25px rgba(255, 193, 7, 0.5);
    text-align: center;
}

.confirm-container h2 {
    color: #00ffea;
    text-shadow: 0 0 10px #00ffea, 0 0 20px #00ffea;
    margin-bottom: 15px;
    font-weight: 700;
}

.confirm-container p {
    color: #ffc107;
    font-weight: 500;
    margin-bottom: 30px;
}

.ride-details {
    text-align: left;
    margin-top: 20px;
}

.ride-details .detail-item {
    display: flex;
    justify-content: space-between;
    padding: 12px 15px;
    background: #222;
    margin-bottom: 10px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 255, 234, 0.3);
    transition: transform 0.2s;
}

.ride-details .detail-item:hover {
    transform: scale(1.02);
}

.ride-details i {
    color: #00ffea;
    margin-right: 10px;
    width: 25px;
    text-align: center;
}

.btn-neon {
    display: inline-block;
    padding: 12px 30px;
    margin: 10px;
    font-weight: bold;
    color: #000;
    background: #00ffea;
    border: none;
    border-radius: 10px;
    text-decoration: none;
    text-shadow: 0 0 5px #fff;
    box-shadow: 0 0 20px #00ffea, 0 0 40px #00ffea, 0 0 60px #00ffea;
    transition: 0.3s;
}

.btn-neon:hover {
    box-shadow: 0 0 40px #00ffea, 0 0 80px #00ffea, 0 0 100px #00ffea;
    color: #fff;
    text-decoration: none;
}
</style>
</head>
<body>


<%
    Ride ride = (Ride) request.getAttribute("data");
    if(ride == null){
        response.sendRedirect("services.jsp");
        return;
    }
%>

<div class="container mt-5">
    <h2 class="mb-4 text-success">Your ride has been successfully booked!</h2>
    <p>Drive safe and enjoy your journey.</p>

    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h5 class="card-title mb-3"><i class="fas fa-car"></i> Ride Details</h5>
            <div class="row mb-2">
                <div class="col-md-6"><strong>Pickup:</strong> <%= ride.getPickupLocation() %></div>
                <div class="col-md-6"><strong>Drop:</strong> <%= ride.getDropLocation() %></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-6"><strong>Pickup Time:</strong> <%= ride.getPickupTime() %></div>
                <div class="col-md-6"><strong>Return Time:</strong> <%= ride.getReturnTime() != null ? ride.getReturnTime() : "-" %></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-6"><strong>Date:</strong> <%= ride.getTravelDate() %></div>
                <div class="col-md-6"><strong>Days:</strong> <%= ride.getDays() != null ? ride.getDays() : "-" %></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-6"><strong>Car Type:</strong> <%= ride.getCarType() %></div>
                <div class="col-md-6"><strong>Seats:</strong> <%= ride.getSeats() %></div>
            </div>
        
            <div class="row mb-2">
                <div class="col-md-6"><strong>Payment:</strong> <%= ride.getPaymentMethod() %></div>
                <div class="col-md-6"><strong>Fare:</strong> ₹<%= ride.getFare() %></div>
            </div>
            <div class="row">
                <div class="col-12"><strong>Notes:</strong> <%= ride.getNotes() != null ? ride.getNotes() : "-" %></div>
            </div>
        </div>
    </div>

    <div class="d-flex gap-3">
        <a href="traveler-home.jsp" class="btn btn-primary">Home</a>
        <a href="services.jsp" class="btn btn-success">Book Another Ride</a>
        <a href="printReceipt.jsp?rideId=<%= ride.getId() %>" class="btn btn-warning">Print Receipt</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>
