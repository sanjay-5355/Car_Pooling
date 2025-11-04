<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Your Car</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'DM Sans', sans-serif;
        background-color: #121212;
        color: #fff;
    }
    .form-container {
        max-width: 700px;
        margin: 50px auto;
        padding: 30px;
        background: #1c1c1c;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.6);
    }
    .form-container h2 {
        color: #ffc107;
        margin-bottom: 25px;
        text-align: center;
    }
    .form-label {
        color: #fff;
    }
    .form-control {
        background-color: #2c2c2c;
        color: #fff;
        border: 1px solid #444;
    }
    .form-control:focus {
        border-color: #ffc107;
        box-shadow: none;
        background-color: #2c2c2c;
        color: #fff;
    }
    .btn-primary {
        background-color: #ffc107;
        color: #000;
        border: none;
    }
    .btn-primary:hover {
        background-color: #e0a800;
        color: #000;
    }
    .file-input-wrapper {
        position: relative;
        overflow: hidden;
        display: inline-block;
        width: 100%;
    }
    .file-input-wrapper input[type=file] {
        font-size: 100px;
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
    }
</style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2>Register Your Car</h2>

        <% String msg = (String) request.getAttribute("msg"); %>
        <% if (msg != null) { %>
        
            <div class="alert alert-warning text-center"><%= msg %></div>
        <% } %>

        <form action="Car" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Car Model</label>
                <input type="text" class="form-control" name="model" placeholder="Enter car model" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Car Number</label>
                <input type="text" class="form-control" name="number" placeholder="Enter car number" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Date of Registration</label>
                <input type="date" class="form-control" name="registrationDate" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Car Age (years)</label>
                <input type="number" min="0" class="form-control" name="age" placeholder="Enter car age" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Seats</label>
                <input type="number" min="1" class="form-control" name="seats" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Car Image</label>
                 <input type="file" class="form-control" name="image" accept="image/*" required>
                <div class="form-text text-secondary">Upload a clear image of your car (JPG, PNG).</div>
            </div>

            <div class="mb-3">
                <label class="form-label">Per Day Amount</label>
                <input type="number" min="0" class="form-control" name="amount" placeholder="Enter rental amount per day" required>
            </div>

            <input type="hidden" name="ownerId" value="${sessionScope.data.ownerId}">

            <button type="submit" class="btn btn-primary w-100" name="action" value="addCar">Register Car</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
