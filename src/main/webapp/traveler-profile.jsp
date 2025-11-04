<%@ page import="model.Traveler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="traveler-header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Traveler Profile</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    rel="stylesheet">

<style>
body {
    font-family: 'DM Sans', sans-serif;
    background: #121212;
    color: #fff;
    margin: 0;
    padding-top: 100px; 
}

.section-title h2 {
    color: #ffc107;
    font-weight: 600;
}

.profile-form {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    padding: 40px;
    box-shadow: 0 0 20px rgba(255, 193, 7, 0.2);
    transition: 0.3s;
}

.profile-form:hover {
    box-shadow: 0 0 30px rgba(255, 193, 7, 0.4);
}

.form-control {
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    color: #fff;
    border-radius: 8px;
    transition: all 0.3s;
}

.form-control:focus {
    background-color: rgba(255, 255, 255, 0.15);
    border-color: #ffc107;
    box-shadow: 0 0 10px rgba(255, 193, 7, 0.4);
}

.btn-update {
    background-color: #ffc107;
    color: #000;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    padding: 10px 20px;
    transition: all 0.3s ease;
}

.btn-update:hover {
    background-color: #e0a800;
    transform: translateY(-2px);
}

.btn-change {
    background: transparent;
    border: 2px solid #ffc107;
    color: #ffc107;
    border-radius: 8px;
    font-weight: 600;
    padding: 10px 20px;
    transition: all 0.3s ease;
}

.btn-change:hover {
    background: #ffc107;
    color: #000;
}
</style>
</head>

<body>

<%
Traveler t = (Traveler) session.getAttribute("data");
if (t == null) {
    response.sendRedirect("traveler-login.jsp");
    return;
}
%>

<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="text-center mb-4">
                <h2 class="text-md">Traveler Profile</h2>
                <div class="divider mx-auto my-3"
                    style="height: 3px; width: 60px; background: #ffc107;"></div>
            </div>

            <form class="profile-form" action="Traveler" method="post">
                <input type="hidden" name="id" value="<%=t.getId()%>">

                <div class="row g-3">
                    <div class="col-lg-6">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" name="name" id="name" class="form-control"
                            value="<%=t.getName()%>" required>
                    </div>

                    <div class="col-lg-6">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" id="email" class="form-control"
                            value="<%=t.getEmail()%>" required>
                    </div>

                    <div class="col-lg-6">
                        <label for="contact" class="form-label">Mobile Number</label>
                        <input type="text" name="contact" id="mobile" class="form-control"
                            value="<%=t.getContact()%>" required>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-update me-3" name="action" value="update">
                        Update Profile
                    </button>
                    <a href="traveler-change-password.jsp" class="btn btn-change">Change Password</a>
                </div>
            </form>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
