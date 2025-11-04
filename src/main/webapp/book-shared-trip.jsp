<%@ page import="model.Traveler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Ride | CarPooling</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'DM Sans', sans-serif;
        background-color: #121212;
        color: #fff;
    }
    .form-container {
        max-width: 700px;
        margin: 60px auto;
        background-color: #1c1c1c;
        padding: 40px;
        border-radius: 12px;
        border: 1px solid #333;
        box-shadow: 0 0 15px rgba(255, 193, 7, 0.2);
    }
    h2 {
        text-align: center;
        color: #ffc107;
        margin-bottom: 30px;
        font-weight: 600;
    }
    label {
        color: #ffc107;
        font-weight: 500;
    }
    .form-control, .form-select {
        background-color: #2a2a2a;
        border: 1px solid #444;
        color: #fff;
    }
    .form-control:focus, .form-select:focus {
        border-color: #ffc107;
        box-shadow: none;
    }
    .btn-submit {
        width: 100%;
        background-color: #ffc107;
        color: #000;
        font-weight: bold;
        border: none;
        padding: 12px;
        border-radius: 8px;
        transition: background-color 0.3s;
    }
    .btn-submit:hover {
        background-color: #e0a800;
        color: #000;
    }
    .form-section {
        margin-bottom: 25px;
    }
</style>
</head>
<body>

<%
    Traveler traveler = (Traveler) session.getAttribute("data");
    if(traveler == null){
        response.sendRedirect("traveler-login.jsp");
        return;
    }
%>

<div class="container">
    <div class="form-container">
        <h2>Book Your Ride</h2>

        <form action="BookRide" method="post">
            <input type="hidden" name="serviceType" value="shared_ride">
            <input type="hidden" name="userId" value="<%= traveler.getId() %>">

            <!-- Pickup & Drop -->
            <div class="form-section">
                <label for="pickupLocation" class="form-label">Pickup Location</label>
                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>

                <label for="dropLocation" class="form-label mt-3">Drop Location</label>
                <input type="text" class="form-control" id="dropLocation" name="dropLocation" required>
            </div>

            <!-- Time Selection -->
            <div class="form-section row">
                <div class="col-md-6">
                    <label for="pickupTime" class="form-label">Pickup Time</label>
                    <input type="time" class="form-control" id="pickupTime" name="pickupTime" required>
                </div>
            
            <!-- Travel Date -->
            <div class="form-section">
                <label for="travelDate" class="form-label">Travel Date</label>
                <input type="date" class="form-control" id="travelDate" name="travelDate" required>
            </div>

            <!-- Submit -->
            <button class="btn-submit" type="submit" name="action" value="search">Search Ride</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
