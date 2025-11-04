<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="owner-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner Dashboard | CarPooling</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<style>
body {
    background-color: #121212;
    color: #fff;
    font-family: 'DM Sans', sans-serif;
}
.card {
    background-color: #1e1e1e;
    border: 1px solid #333;
    transition: transform 0.2s, box-shadow 0.2s;
    border-radius: 12px;
}
.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 0 20px rgba(255,193,7,0.2);
}
.card i {
    font-size: 2.2rem;
    color: #ffc107;
    margin-bottom: 15px;
}
.card h5 {
    color: #ffc107;
    font-weight: 600;
}
</style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4 text-warning fw-bold">Welcome, Owner Dashboard</h2>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <!-- Offer Ride -->
        <div class="col">
            <a href="owner-offer-sharedride.jsp" style="text-decoration: none;">
                <div class="card p-4 text-center">
                    <i class="fa-solid fa-car-side"></i>
                    <h5>Offer Shared Ride</h5>
                    <p>Post a new ride for travelers to book</p>
                </div>
            </a>
        </div>

        <!-- My Rides -->
        <div class="col">
            <a href="owner-my-rides.jsp" style="text-decoration: none;">
                <div class="card p-4 text-center">
                    <i class="fa-solid fa-list"></i>
                    <h5>My Rides</h5>
                    <p>View or manage all your offered rides</p>
                </div>
            </a>
        </div>

        <!-- Notifications -->
        <div class="col">
            <a href="owner-profile.jsp" style="text-decoration: none;">
                <div class="card p-4 text-center">
                    <i class="fa-solid fa-bell"></i>
                    <h5>Update Profile </h5>
                    <p>Update Name,E mail,Contact and Password</p>
                </div>
            </a>
        </div>
    </div>
</div>

</body>
</html>
