<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner New Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: 'DM Sans', sans-serif;
    background: linear-gradient(135deg, #1f1f1f, #121212);
    margin: 0;
    padding: 0;
    color: #fff;
}

.password-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 80px);
    padding: 20px;
}

.password-box {
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

.password-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 40px rgba(255,193,7,0.4);
}

.password-box.shake {
    animation: shake 0.5s;
}

@keyframes shake {
    0% { transform: translateX(0); }
    20% { transform: translateX(-10px); }
    40% { transform: translateX(10px); }
    60% { transform: translateX(-10px); }
    80% { transform: translateX(10px); }
    100% { transform: translateX(0); }
}

.password-box h2 {
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

.error-msg {
    color: #ff4d4d;
    margin-bottom: 15px;
    text-align: center;
    font-weight: 500;
    display: none; 
    opacity: 0;
    transition: opacity 0.5s ease, transform 0.3s ease;
}

.error-msg.show {
    display: block;
    opacity: 1;
    transform: translateY(0);
}
</style>
</head>
<body>

<div class="password-container">
    <div class="password-box" id="password-box">
        <h2>Owner New Password</h2>

        <form method="post" action="Owner" onsubmit="return validatePasswords()">
            <% String email = (String) request.getAttribute("email"); %>
            <input type="hidden" name="email" value="<%=email%>">

            <input id="np" name="np" type="password" class="form-control" placeholder="New Password" required>
            <input id="cnp" name="cnp" type="password" class="form-control" placeholder="Confirm New Password" required>

          
            <div id="error-msg" class="error-msg">New Password and Confirm Password do not match!</div>

            <input class="btn btn-main" name="action" type="submit" value="new password">
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function validatePasswords() {
    var np = document.getElementById("np").value;
    var cnp = document.getElementById("cnp").value;
    var errorMsg = document.getElementById("error-msg");
    var box = document.getElementById("password-box");

    if (np !== cnp) {
        errorMsg.classList.add("show");
        box.classList.add("shake");

        // Remove shake class after animation completes
        setTimeout(function() {
            box.classList.remove("shake");
        }, 500);

        return false; // Prevent form submission
    } else {
        errorMsg.classList.remove("show");
        return true; // Allow form submission
    }
}
</script>

</body>
</html>
