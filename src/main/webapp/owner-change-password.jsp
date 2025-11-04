<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Owner" %>
<%@ include file="owner-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
<style>
body {
    background: #121212;
    color: #fff;
    padding-top: 100px;
    font-family: 'DM Sans', sans-serif;
}

.section-title h2 {
    color: #ffc107;
    font-weight: 600;
}

.form-control {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    color: #fff;
    border-radius: 8px;
    margin-bottom: 15px;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #ffc107;
    box-shadow: 0 0 10px rgba(255, 193, 7, 0.5);
    background-color: rgba(255, 255, 255, 0.15);
    color: #fff;
}

.btn-change {
    background-color: #ffc107;
    color: #000;
    border-radius: 8px;
    padding: 10px 20px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.btn-change:hover {
    background-color: #e0a800;
}

.password-box {
    padding: 30px;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.5);
    transition: transform 0.3s ease;
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
<%
    Owner o = (Owner) session.getAttribute("data");
    if (o == null) {
        response.sendRedirect("owner-login.jsp");
        return;
    }

    String msg = (String) request.getAttribute("msg");
%>

<section class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="text-center mb-4">
                <h2 class="section-title">Change Password</h2>
                <div class="divider mx-auto my-3" style="height: 3px; width: 60px; background: #ffc107;"></div>
                <% if (msg != null) { %>
                    <h5 class="text-warning"><%= msg %></h5>
                <% } %>
            </div>

            <div class="password-box" id="password-box">
                <form method="post" action="Owner" onsubmit="return validatePasswords()">
                    <input type="hidden" name="email" value="<%= o.getEmail() %>">

                    <input id="op" type="password" name="op" class="form-control" placeholder="Old Password" required>
                    <input id="np" type="password" name="np" class="form-control" placeholder="New Password" required>
                    <input id="cnp" type="password" name="cnp" class="form-control" placeholder="Confirm New Password" required>

                    
                    <div id="error-msg" class="error-msg">New Password and Confirm Password do not match!</div>

                    <div class="text-center">
                        <input type="submit" name="action" value="change password" class="btn btn-change mt-3">
                    </div>
                    
                    <div class="text-center">
                        <a href="owner-forgot-password.jsp" class="forgot-link">Forgot Password?</a>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</section>

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
