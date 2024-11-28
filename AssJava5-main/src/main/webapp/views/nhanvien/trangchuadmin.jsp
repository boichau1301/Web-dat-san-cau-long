<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Chủ</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>
body {
	background-color: #f8f9fa;
}

.sidebar {
	background: linear-gradient(135deg, #343a40, #007bff);
	/* Gradient chuyển màu */
	padding: 20px 12px 20px 12px;
	min-height: 100vh;
	transition: all 0.4s ease; /* Hiệu ứng chuyển động nhẹ */
}

.sidebar-title {
	color: #fff;
	margin-bottom: 30px;
	font-size: 1.5rem;
	font-weight: bold;
	letter-spacing: 2px; /* Giãn khoảng cách giữa các chữ */
	text-align: center;
}

.nav-link {
	color: #adb5bd;
	font-size: 1.1rem;
	padding: 12px 20px;
	transition: all 0.4s ease;
	position: relative;
	overflow: hidden; /* Để hiệu ứng tràn ra ngoài */
	display: flex;
	align-items: center;
	z-index: 1;
}

.nav-link i {
	font-size: 1.2rem;
	margin-right: 10px;
	transition: transform 0.4s ease; /* Hiệu ứng xoay icon */
}

.nav-link:before {
	content: '';
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.1);
	z-index: 0;
	transition: all 0.4s ease;
}

.nav-link:not(.active):hover:before {
	left: 0; /* Tạo hiệu ứng tràn từ trái sang phải */
}

.nav-link:not(.active):hover {
	background: none;
}

.nav-link:hover i {
	transform: rotate(20deg); /* Hiệu ứng xoay nhẹ biểu tượng */
}

.nav.flex-column .nav-link.active {
	color: #fff;
	background-color: #007bff;
	border-radius: 10px;
}

.nav-item {
	margin-bottom: 15px;
}

.sidebar-sticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
}

.dashboard-card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.dashboard-card:hover {
	transform: scale(1.05);
}

.icon-container {
	flex: 0 0 40%; /* Đặt icon chiếm 80% thẻ div */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100px; /* Đặt chiều cao container */
	margin-right: 20px; /* Khoảng cách với nội dung */
	background-color: #f8f9fa;
	border-radius: 10px;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.icon-container i {
	font-size: 80px; /* Kích thước icon */
	color: #007bff; /* Màu sắc của icon */
	transition: color 0.3s ease, transform 0.3s ease;
}

.icon-container:hover {
	background-color: #007bff; /* Thay đổi màu nền khi hover */
	transform: rotate(15deg); /* Hiệu ứng xoay nhẹ */
}

.icon-container:hover i {
	color: #fff; /* Thay đổi màu icon khi hover */
	transform: scale(1.2); /* Phóng to icon khi hover */
}

.content {
	flex: 1; /* Nội dung chiếm không gian còn lại */
}

.card-title {
	font-weight: bold;
	margin-bottom: 10px;
}

.card-text {
	font-size: 1.5rem;
	font-weight: bold;
}

.chart-container {
	position: relative;
	margin: auto;
	height: 400px; /* Tăng chiều cao nếu cần */
	width: 80%; /* Đặt chiều rộng phù hợp */
	max-width: 1000px; /* Giới hạn chiều rộng tối đa */
}
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<nav class="col-md-2 sidebar d-none d-md-block">
				<div class="sidebar-sticky">
					<h4 class="sidebar-title">Java5 - Nhóm 7</h4>
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link active" href="/employee/index">
								<i class="bi bi-house-door"></i> Trang chủ
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" href="/employee/badmintonManager"> 
								<i class="bi bi-building"></i> Quản lý sân
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" href="/employee/courtOrderManager"> 
								<i class="bi bi-book"></i> Quản lý đặt sân
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" href="/employee/customerManager"> 
								<i class="bi bi-gift"></i> Quản lý khách hàng
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" href="/employee/employeeManager"> 
								<i class="bi bi-person"></i> Quản lý nhân viên
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" href="/employee/report"> 
								<i class="bi bi-bar-chart"></i> Báo cáo thống kê
							</a>
						</li>
					</ul>
				</div>
			</nav>

			<!-- Main content -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-4 w-80">
				<h1 class="mt-4">Trang chủ</h1>
				<hr>
				<div class="row mt-4">
					<div class="col-4">
						<div class="card dashboard-card mb-4">
							<div class="card-body d-flex align-items-center">
								<div class="icon-container">
									<i class="bi bi-currency-dollar"></i>
								</div>
								<div class="content">
									<h5 class="card-title">Doanh thu</h5>
									<h2 class="card-text">${income}VNĐ</h2>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card dashboard-card mb-4">
							<div class="card-body d-flex align-items-center">
								<div class="icon-container">
									<i class="bi bi-people"></i>
								</div>
								<div class="content">
									<h2 class="card-text">${customerCount}</h2>
									<h5 class="card-title">Khách hàng</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card dashboard-card mb-4">
							<div class="card-body d-flex align-items-center">
								<div class="icon-container">
									<i class="bi bi-house"></i>
								</div>
								<div class="content">
									<h2 class="card-text">${bookingCount}</h2>
									<h5 class="card-title">Lượt đặt sân</h5>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Doanh thu theo sân cầu lông -->
				<div>
					<h2>Doanh thu theo sân cầu lông</h2>
					<div class="chart-container">
						<canvas id="revenueChart"></canvas>
					</div>
				</div>
			</main>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
        // Tạo mảng courtNames từ revenueData
        var courtNames = [
            <c:forEach var="item" items="${revenueData}" varStatus="status">
                "${item.courtName}"<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        // Tạo mảng totalRevenues từ revenueData
        var totalRevenues = [
            <c:forEach var="item" items="${revenueData}" varStatus="status">
                ${item.totalRevenue}<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        console.log("Court Names:", courtNames);
        console.log("Total Revenues:", totalRevenues);

        // Tạo biểu đồ với Chart.js
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: courtNames,
                datasets: [{
                    label: 'Doanh thu',
                    data: totalRevenues,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    hoverBackgroundColor: 'rgba(54, 162, 235, 0.5)', // Màu nền khi hover
                    hoverBorderColor: 'rgba(54, 162, 235, 1)', // Màu viền khi hover
                    fill: true // Đổ màu
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Doanh thu (VNĐ)',
                            font: {
                                size: 16
                            }
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Sân cầu lông',
                            font: {
                                size: 16
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.dataset.label + ': ' + tooltipItem.raw + ' VNĐ';
                            }
                        }
                    }
                }
            }
        });
    </script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
