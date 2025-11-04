<%@ page import="model.Traveler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Daily Commute Ride | CarPooling</title>
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
    .day-checkbox {
        accent-color: #ffc107;
        margin-right: 5px;
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
        <h2>Book Your Daily Commute Ride</h2>

        <form action="BookRide" method="post">
            <input type="hidden" name="serviceType" value="daily_commute">
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
                <div class="col-md-6">
                    <label for="returnTime" class="form-label">Return Time</label>
                    <input type="time" class="form-control" id="returnTime" name="returnTime">
                </div>
            </div>
            
            <!-- Travel Date -->
            <div class="form-section">
                <label for="travelDate" class="form-label">Commute Date</label>
                <input type="date" class="form-control" id="travelDate" name="travelDate" required>
            </div>

            <!-- Days of the Week -->
            <div class="form-section">
                <label class="form-label">Days of Commute</label><br>
                <div class="d-flex flex-wrap gap-2">
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Monday"> Mon</label>
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Tuesday"> Tue</label>
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Wednesday"> Wed</label>
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Thursday"> Thu</label>
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Friday"> Fri</label>
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Saturday"> Sat</label>
                    <label><input type="checkbox" class="day-checkbox" name="days" value="Sunday"> Sun</label>
                </div>
            </div>

            <!-- Vehicle and Seats -->
            <div class="form-section row">
                <div class="col-md-6">
                    <label for="carType" class="form-label">Car Type</label>
                    <select id="carType" name="carType" class="form-select" required>
                        <option value="">Select Car Type</option>
                        <option value="Hatchback">Hatchback</option>
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="Electric">Electric</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="seats" class="form-label">Available Seats</label>
                    <select id="seats" name="seats" class="form-select" required>
                        <option value="">Select</option>
                        <option value="2">2 Seats</option>
                        <option value="3">3 Seats</option>
                        <option value="4">4 Seats</option>
                    </select>
                </div>
            </div>

            <!-- Payment -->
            <div class="form-section">
                <label for="paymentMethod" class="form-label">Payment Method</label>
                <select id="paymentMethod" name="paymentMethod" class="form-select" required>
                    <option value="">Select Payment Method</option>
                    <option value="Cash">Cash</option>
                    <option value="Online">Online</option>
                    <option value="Split Fare">Split Fare</option>
                </select>
            </div>

            <!-- Notes -->
            <div class="form-section">
                <label for="notes" class="form-label">Additional Notes (optional)</label>
                <textarea id="notes" name="notes" class="form-control" rows="3" placeholder="Anything you'd like to add..."></textarea>
            </div>

            <!-- Submit -->
            <button class="btn-submit" type="submit"  name="action" value="book">Submit Ride Details</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
