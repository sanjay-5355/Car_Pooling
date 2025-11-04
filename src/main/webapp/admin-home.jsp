<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | CarRent</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

body {
  background: radial-gradient(circle at top left, #0f172a, #1e293b);
  color: #fff;
  font-family: "Poppins", sans-serif;
  overflow-x: hidden;
}

.sidebar {
  width: 250px;
  background: rgba(17, 24, 39, 0.6);
  backdrop-filter: blur(15px);
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  padding-top: 1rem;
  border-right: 1px solid rgba(255,255,255,0.1);
  box-shadow: 0 0 20px rgba(0,0,0,0.5);
}

.sidebar h4 {
  text-align: center;
  color: #38bdf8;
  margin-bottom: 2rem;
  text-shadow: 0 0 10px #0ea5e9;
}

.sidebar a {
  color: #d1d5db;
  text-decoration: none;
  display: block;
  padding: 12px 20px;
  font-size: 15px;
  border-radius: 6px;
  margin: 4px 10px;
  transition: all 0.2s;
}

.sidebar a:hover, .sidebar a.active {
  background: rgba(56,189,248,0.15);
  color: #38bdf8;
  box-shadow: 0 0 8px rgba(56,189,248,0.3);
}

.content {
  margin-left: 260px;
  padding: 2rem;
}

.navbar {
  background: rgba(30,41,59,0.6) !important;
  backdrop-filter: blur(10px);
  border-radius: 10px;
  border: 1px solid rgba(255,255,255,0.1);
  box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

.navbar-brand {
  color: #38bdf8 !important;
  font-weight: 600;
  letter-spacing: 1px;
  text-shadow: 0 0 10px #0ea5e9;
}

.card {
  background: rgba(30,41,59,0.5);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: 16px;
  color: #fff;
  transition: all 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 20px rgba(56,189,248,0.3);
}

.card i {
  font-size: 2rem;
  color: #38bdf8;
}

.chart-card {
  background: rgba(30,41,59,0.4);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 0 25px rgba(56,189,248,0.1);
}
</style>
</head>

<body>
<!-- Sidebar -->
<div class="sidebar">
  <h4><i class="fa-solid fa-car"></i> CarRent Admin</h4>
  <a href="admin-home.jsp" class="active"><i class="fa-solid fa-gauge-high me-2"></i>Dashboard</a>
  <a href="admin-travelers.jsp"><i class="fa-solid fa-users me-2"></i>Travelers</a>
  <a href="admin-owners.jsp"><i class="fa-solid fa-user-tie me-2"></i>Owners</a>
  <a href="admin-rides.jsp"><i class="fa-solid fa-car-side me-2"></i>Rides</a>
  <a href="#"><i class="fa-solid fa-credit-card me-2"></i>Payments</a>
  <a href="#"><i class="fa-solid fa-gear me-2"></i>Settings</a>
  <form action="Admin" method="post" style="margin: 0;">
  <input type="hidden" name="action" value="logout">
  <button type="submit" class="btn btn-link text-start w-100" style="color:#d1d5db; text-decoration:none;">
    <i class="fa-solid fa-right-from-bracket me-2"></i>Logout
  </button>
</form>
</div>

<!-- Main Content -->
<div class="content">
  <nav class="navbar navbar-expand-lg navbar-dark mb-4 shadow-sm rounded-3">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Admin Dashboard</a>
      <div class="ms-auto">
        <span class="text-white"><i class="fa-solid fa-user-shield me-2"></i>Welcome, Admin</span>
      </div>
    </div>
  </nav>

  <!-- Stats Cards Row -->
<div class="row g-4 mb-4">
  <div class="col-md-3">
    <div class="card p-3 text-center">
      <i class="fa-solid fa-users mb-2"></i>
      <h6>Total Travelers</h6>
      <h3><%= request.getAttribute("travelerCount") %></h3>
    </div>
  </div>

  <div class="col-md-3">
    <div class="card p-3 text-center">
      <i class="fa-solid fa-user-tie mb-2"></i>
      <h6>Total Owners</h6>
      <h3><%= request.getAttribute("ownerCount") %></h3>
    </div>
  </div>

  <div class="col-md-3">
    <div class="card p-3 text-center">
      <i class="fa-solid fa-car-side mb-2"></i>
      <h6>Total Rides</h6>
      <h3><%= request.getAttribute("rideCount") %></h3>
    </div>
  </div>

  <div class="col-md-3">
    <div class="card p-3 text-center">
      <i class="fa-solid fa-indian-rupee-sign mb-2"></i>
      <h6>Total Earnings</h6>
      <h3>₹ 5000</h3>
    </div>
  </div>
</div>


  <!-- Chart Analytics Section -->
  <div class="row g-4 mb-4">
    <div class="col-md-8">
      <div class="chart-card">
        <h6 class="text-info mb-3"><i class="fa-solid fa-chart-line me-2"></i>Monthly Rides Overview</h6>
        <canvas id="ridesChart" height="150"></canvas>
      </div>
    </div>

    <div class="col-md-4">
      <div class="chart-card">
        <h6 class="text-info mb-3"><i class="fa-solid fa-chart-pie me-2"></i>Service Type Split</h6>
        <canvas id="serviceChart" height="200"></canvas>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
// ===== Chart.js Setup =====

// Line Chart – Monthly Rides
const ridesCtx = document.getElementById('ridesChart');
new Chart(ridesCtx, {
  type: 'line',
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
    datasets: [{
      label: 'Total Rides',
      data: [120, 150, 180, 130, 210, 260, 300, 280, 320, 400],
      borderColor: '#38bdf8',
      backgroundColor: 'rgba(56,189,248,0.2)',
      tension: 0.4,
      fill: true,
      pointRadius: 4,
      pointHoverRadius: 6,
      pointBackgroundColor: '#38bdf8',
    }]
  },
  options: {
    plugins: { legend: { labels: { color: '#fff' } } },
    scales: {
      x: { ticks: { color: '#ccc' }, grid: { color: 'rgba(255,255,255,0.1)' } },
      y: { ticks: { color: '#ccc' }, grid: { color: 'rgba(255,255,255,0.1)' } }
    },
    animation: { duration: 1500, easing: 'easeInOutQuart' }
  }
});

// Doughnut Chart – Service Type Split
const serviceCtx = document.getElementById('serviceChart');
new Chart(serviceCtx, {
  type: 'doughnut',
  data: {
    labels: ['Daily Commute', 'Airport', 'Outstation', 'Rental'],
    datasets: [{
      data: [40, 20, 25, 15],
      backgroundColor: ['#38bdf8', '#22d3ee', '#0ea5e9', '#3b82f6'],
      borderWidth: 0,
    }]
  },
  options: {
    plugins: { legend: { position: 'bottom', labels: { color: '#fff' } } },
    animation: { animateScale: true, animateRotate: true }
  }
});
</script>
<script>
function confirmLogout() {
    return confirm("Are you sure you want to log out?");
}
</script>
</body>
</html>
