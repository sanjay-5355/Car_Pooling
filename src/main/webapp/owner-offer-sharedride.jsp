<%@ page import="model.Owner" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offer a Ride | CarPooling</title>
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
    Owner owner = (Owner) session.getAttribute("data");
    if (owner == null) {
        response.sendRedirect("owner-login.jsp");
        return;
    }
%>

<div class="container">
    <div class="form-container">
        <h2>Offer a Ride</h2>

        <form action="BookRide" method="post">
            <!-- Action value for owner -->
            <input type="hidden" name="action" value="book">
            <input type="hidden" name="serviceType" value="shared_ride">
            <input type="hidden" name="userId" value="<%= owner.getOwnerId() %>">

            <!-- Pickup & Drop -->
            <div class="form-section">
                <label for="pickupLocation" class="form-label">Pickup Location</label>
                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>

                <label for="dropLocation" class="form-label mt-3">Drop Location</label>
                <input type="text" class="form-control" id="dropLocation" name="dropLocation" required>
            </div>

            <!-- Travel Date & Time -->
            <div class="form-section row">
                <div class="col-md-6">
                    <label for="travelDate" class="form-label">Travel Date</label>
                    <input type="date" class="form-control" id="travelDate" name="travelDate" required>
                </div>
                <div class="col-md-6">
                    <label for="pickupTime" class="form-label">Pickup Time</label>
                    <input type="time" class="form-control" id="pickupTime" name="pickupTime" required>
                </div>
            </div>

            <!-- Seats & Car Type -->
            <div class="form-section row">
                <div class="col-md-6">
                    <label for="seats" class="form-label">Available Seats</label>
                    <input type="number" class="form-control" id="seats" name="seats" min="1" required>
                </div>
                <div class="col-md-6">
                    <label for="carType" class="form-label">Car Type</label>
                    <select class="form-select" id="carType" name="carType" required>
                        <option value="">Select Type</option>
                        <option value="Hatchback">Hatchback</option>
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                    </select>
                </div>
            </div>

            <!-- Payment Method -->
            <div class="form-section">
                <label for="paymentMethod" class="form-label">Payment Method</label>
                <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                    <option value="">Select Payment Method</option>
                    <option value="Cash">Cash</option>
                    <option value="UPI">UPI</option>
                    <option value="Online">Online</option>
                </select>
            </div>

            <!-- Notes -->
            <div class="form-section">
                <label for="notes" class="form-label">Additional Notes</label>
                <textarea class="form-control" id="notes" name="notes" rows="3" placeholder="Any message for travelers..."></textarea>
            </div>

            <!-- Submit -->
            <button class="btn-submit" type="submit" name="action" value="offer" >Publish Ride</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
