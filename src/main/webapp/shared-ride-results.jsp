
<%@page import="model.Ride"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ride Results | CarPooling</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'DM Sans', sans-serif;
        background-color: #121212;
        color: #fff;
    }
    .results-container {
        max-width: 900px;
        margin: 60px auto;
    }
    h2 {
        text-align: center;
        color: #ffc107;
        margin-bottom: 40px;
        font-weight: 600;
    }
    .ride-card {
        background-color: #1c1c1c;
        border: 1px solid #333;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 25px;
        transition: 0.3s;
        box-shadow: 0 0 10px rgba(255, 193, 7, 0.1);
    }
    .ride-card:hover {
        box-shadow: 0 0 20px rgba(255, 193, 7, 0.3);
    }
    .ride-details h5 {
        color: #ffc107;
        font-weight: 600;
        margin-bottom: 10px;
    }
    .ride-details p {
        margin: 0;
        color: #ddd;
        font-size: 15px;
    }
    .btn-book {
        background-color: #ffc107;
        color: #000;
        font-weight: bold;
        border: none;
        padding: 10px 18px;
        border-radius: 8px;
        transition: background-color 0.3s;
    }
    .btn-book:hover {
        background-color: #e0a800;
    }
    .no-results {
        text-align: center;
        margin-top: 60px;
        color: #bbb;
        font-size: 18px;
    }
</style>
</head>
<body>

<div class="container results-container">
    <h2>Available Rides</h2>

    <%
        List<Ride> rides = (List<Ride>) request.getAttribute("data");
        if (rides == null ) {
    %>
        <div class="no-results">🚗 No rides found for your search. Try adjusting your pickup, drop, or time.</div>
    <%
        } else {
            for (Ride r : rides) {
    %>
        <div class="ride-card">
            <div class="ride-details">
                <h5><%= r.getPickupLocation() %> → <%= r.getDropLocation() %></h5>
                <p><strong>Date:</strong> <%= r.getTravelDate() %> | <strong>Pickup Time:</strong> <%= r.getPickupTime() %></p>
                <p><strong>Car Type:</strong> <%= r.getCarType() == null ? "N/A" : r.getCarType() %></p>
                <p><strong>Fare:</strong> ₹<%= r.getFare() %></p>
            </div>
            <form action="BookRide" method="post" class="mt-3">
                <input type="hidden" name="action" value="book">
                <input type="hidden" name="rideId" value="<%= r.getId() %>">
                <input type="hidden" name="travelerId" value="<%= ((model.Traveler)session.getAttribute("data")).getId() %>">
                <button type="submit" class="btn-book w-100" name="action" value="bookride">Book Now</button>
            </form>
        </div>
    <%
            }
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
