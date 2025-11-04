<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Services</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    body {
        font-family: 'DM Sans', sans-serif;
        background-color: #121212;
        color: #fff;
    }
    .container {
        margin-top: 50px;
    }
    .service-card {
        background-color: #1c1c1c;
        padding: 30px;
        border-radius: 10px;
        text-align: center;
        transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
        height: 100%;
        color: #fff;
        cursor: pointer;
        text-decoration: none; 
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .service-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.6);
        background-color: #ffc107;
        color: #000;
    }
    .service-card:hover .service-icon,
    .service-card:hover h3,
    .service-card:hover p {
        color: #000;
    }
    .service-icon {
        font-size: 50px;
        margin-bottom: 20px;
        color: #ffc107;
    }
    .service-card h3 {
        margin-bottom: 15px;
        color: #ffc107;
    }
    .service-card p {
        font-size: 15px;
        line-height: 1.6;
    }
</style>
</head>
<body>

<div class="container">
    <h1 class="text-center mb-5">Our Services</h1>
    <div class="row g-4">

        <!-- Daily Commute Rides -->
        <div class="col-md-6 col-lg-3">
            <div class="service-card" onclick="location.href='service-dailycommute.jsp'">
                <i class="fas fa-road service-icon"></i>
                <h3>Daily Commute Rides</h3>
                <p>Share rides for your daily work or college commute, save money and reduce traffic.</p>
            </div>
        </div>

        <!-- Outstation Rides -->
        <div class="col-md-6 col-lg-3">
            <div class="service-card" onclick="location.href='service-outstation.jsp'">
                <i class="fas fa-map-marked-alt service-icon"></i>
                <h3>Outstation Rides</h3>
                <p>Travel to other cities comfortably and affordably with our long-distance ride options.</p>
            </div>
        </div>

        <!-- One-Time Rides -->
        <div class="col-md-6 col-lg-3">
            <div class="service-card" onclick="location.href='service-one-time-rides.jsp'">
                <i class="fas fa-car-side service-icon"></i>
                <h3>One-Time Rides</h3>
                <p>Book rides for occasional trips or events without committing to regular schedules.</p>
            </div>
        </div>

        <!-- Shared Trip -->
        <div class="col-md-6 col-lg-3">
            <div class="service-card" onclick="location.href='service-sharedtrip.jsp'">
                <i class="fas fa-users service-icon"></i>
                <h3>Shared Trip</h3>
                <p>Pool multiple customers in one car, split costs, and enjoy eco-friendly travel.</p>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
