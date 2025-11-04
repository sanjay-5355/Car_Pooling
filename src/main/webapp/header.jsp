<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CarRent | Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">

<style>
  body {
    font-family: 'DM Sans', sans-serif;
    margin: 0;
    padding: 0;
  }
  header.site-navbar {
    background: #0d6efd;
    padding: 15px 0;
    color: #fff;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }
  .site-logo a {
    font-size: 26px;
    font-weight: 700;
    text-decoration: none;
    color: #fff;
  }
  .site-navigation .site-menu {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    gap: 25px;
  }
  .site-navigation .site-menu li {
    position: relative;
  }
  .site-navigation .site-menu li a {
    text-decoration: none;
    color: #fff;
    font-weight: 500;
    transition: color 0.3s;
  }
  .site-navigation .site-menu li a:hover {
    color: #ffc107;
  }
  /* Dropdown */
  .site-navigation .site-menu li ul {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background: #0d6efd;
    padding: 10px 0;
    min-width: 150px;
    border-radius: 0 0 5px 5px;
    z-index: 100;
  }
  .site-navigation .site-menu li:hover ul {
    display: block;
  }
  .site-navigation .site-menu li ul li {
    padding: 0;
    margin: 0;
  }
  .site-navigation .site-menu li ul li a {
    display: block;
    padding: 10px 20px;
    color: #fff;
  }
  .site-navigation .site-menu li ul li a:hover {
    background: #ffc107;
    color: #000;
  }
</style>
</head>

<body>

<header class="site-navbar">
  <div class="container d-flex justify-content-between align-items-center">
    <div class="site-logo">
      <a href="index.jsp">CarRent</a>
    </div>

    <nav class="site-navigation">
      <ul class="site-menu main-menu d-flex mb-0">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="services.jsp">Services</a></li>
        <li><a href="cars.jsp">Cars</a></li>

        <li>
          <a href="#">Car Owner</a>
          <ul>
            <li><a href="owner-register.jsp">Register</a></li>
            <li><a href="owner-login.jsp">Login</a></li>
          </ul>
        </li>

        <li>
          <a href="#">Traveler</a>
          <ul>
            <li><a href="traveler-register.jsp">Register</a></li>
            <li><a href="traveler-login.jsp">Login</a></li>
          </ul>
        </li>

        <li><a href="admin-login.jsp">Admin</a></li>
      </ul>
    </nav>
  </div>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
