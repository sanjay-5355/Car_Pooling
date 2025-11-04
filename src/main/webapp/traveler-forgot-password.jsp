<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="traveler-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Traveler Forgot Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: 'DM Sans', sans-serif;
    background: linear-gradient(135deg, #1f1f1f, #121212);
    color: #fff;
    margin: 0;
    padding: 0;
}

.forgot-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 80px); 
    padding: 20px;
}

.forgot-box {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    padding: 40px 30px;
    border-radius: 15px;
    max-width: 400px;
    width: 100%;
    box-shadow: 0 10px 30px rgba(0,0,0,0.5);
    text-align: center;
    border: 1px solid rgba(255,255,255,0.2);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.forgot-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 40px rgba(255,193,7,0.4);
}

.forgot-box h2 {
    color: #ffc107;
    margin-bottom: 20px;
    font-weight: 700;
    letter-spacing: 1px;
}

.form-control {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    color: #fff;
    border-radius: 10px;
    padding: 12px;
    margin-bottom: 15px;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #ffc107;
    box-shadow: 0 0 10px rgba(255, 193, 7, 0.5);
    background-color: rgba(255, 255, 255, 0.15);
    color: #fff;
}

.btn-main {
    background-color: #ffc107;
    color: #000;
    border-radius: 10px;
    font-weight: 600;
    padding: 12px 25px;
    width: 100%;
    transition: all 0.3s ease;
}

.btn-main:hover {
    background-color: #e0a800;
    color: #000;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255,193,7,0.4);
}

a {
    color: #ffc107;
    text-decoration: none;
    font-weight: 500;
}

a:hover {
    color: #e0a800;
    text-decoration: underline;
}

.links {
    margin-top: 15px;
}
</style>
</head>
<body>

<div class="forgot-container">
    <div class="forgot-box">
        <h2>Forgot Password</h2>
        
        <form method="post" action="Traveler">
            <input name="email" type="email" class="form-control" placeholder="Enter your email" required>
            <input class="btn btn-main" name="action" type="submit" value="Send OTP">
        </form>
        
        <div class="links">
            <a href="traveler-login.jsp">Back to Login</a> <br>
            <a href="traveler-register.jsp">Don't have an account?</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
