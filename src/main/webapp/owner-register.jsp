<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Owner Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'DM Sans', sans-serif;
        background-color: #121212; 
    }
    .form-container {
        max-width: 700px;
        margin: 50px auto;
        padding: 30px;
        background: #1c1c1c; 
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0,0,0,0.5);
        color: #fff; 
    }
    .form-container h2 {
        margin-bottom: 25px;
        color: #ffc107; 
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
        background-color: #2c2c2c;
        color: #fff;
        border-color: #ffc107;
        box-shadow: none;
    }
    .btn-primary {
        background-color: #ffc107;
        border: none;
        color: #000;
    }
    .btn-primary:hover {
        background-color: #e0a800;
        color: #000;
    }
</style>
</head>
<body>
<%  String msg= (String) request.getAttribute("msg"); %>

<% if(msg!=null){ %>

<h3>

       <% out.print(msg); %>
</h3>

<% } %>


<div class="container">
    <div class="form-container">
        <h2>Car Owner Registration</h2>
        <form action="Owner" method="post" >
            <div class="mb-3">
                <label for="name" class="form-label">Owner Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter owner name" required>
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">E mail</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter e mail" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>

            <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <input type="text" class="form-control" id="" name="contact" required>
            </div>


            <button class="btn btn-primary w-100" name="action" type="submit" value="register" >Register</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
