<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Báo cáo thống kê - doanh thu</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
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

.report-title {
	font-size: 2rem;
	font-weight: bold;
	color: blue;
}

h1, hr {
	margin-bottom: 20px;
}

.tab-content {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.table {
	background-color: #fff;
	border-radius: 8px;
	overflow: hidden;
}

.table thead {
	background-color: #007bff;
	color: #fff;
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.form-control {
	padding: 10px;
	border-radius: 6px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 6px;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 sidebar d-none d-md-block">
				<div class="sidebar-sticky">
					<h4 class="sidebar-title">Java5 - Nhóm 7</h4>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/index"> <i class="bi bi-house-door"></i>
								Trang chủ
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/badmintonManager"> <i class="bi bi-building"></i>
								Quản lý sân
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/courtOrderManager"> <i class="bi bi-book"></i>
								Quản lý đặt sân
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/customerManager"> <i class="bi bi-gift"></i>
								Quản lý khách hàng
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/employeeManager"> <i class="bi bi-person"></i>
								Quản lý nhân viên
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="/employee/report"> <i class="bi bi-bar-chart"></i> Báo
								cáo thống kê
						</a></li>
					</ul>
				</div>
			</nav>

			<!-- Nội dung chính -->
			<main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
				<h1 class="report-title mt-4">Báo cáo thống kê</h1>
				<hr>
				<ul class="nav nav-tabs">
					<li class="nav-item mb-0"><a
						href="/employee/report" class="nav-link">Doanh thu</a></li>
					<li class="nav-item mb-0"><a
						href="/employee/time" class="nav-link active">Khung giờ hot</a></li>
				</ul>
				<div class="tab-content mt-4" id="myTabContent">
					<a href="/admin/report" class="tab-pane fade show active"
						id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
						tabindex="0"> </a>
					<div class="tab-pane fade show active" id="profile-tab-pane"
						role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
						<div class="container">
							<h1>Báo cáo số lượng đặt sân theo khung giờ</h1>

							<!-- Form chọn tháng và năm -->
							<form method="post" action="/admin/time">
								<div class="row">
									<div class="col-md-3 mb-3">
										<label for="month">Tháng</label> <select class="form-control"
											id="month" name="month" required>
											<c:forEach items="${months}" var="monthOption">
												<option value="${monthOption}"
													${monthOption == month ? 'selected' : ''}>${monthOption}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-3 mb-3">
										<label for="year">Năm</label> <select class="form-control"
											id="year" name="year" required>
											<c:forEach items="${years}" var="yearOption">
												<option value="${yearOption}"
													${yearOption == year ? 'selected' : ''}>${yearOption}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-3 mb-3 align-self-end">
										<button type="submit" class="btn btn-primary">Xem báo
											cáo</button>
									</div>
								</div>
							</form>

							<!-- Bảng báo cáo -->
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Khung giờ</th>
										<th>Số lượt đặt</th>
										<th>Tổng số giờ đã đặt</th>
										<th>Doanh thu</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="report" items="${timeSlotReports}">
										<tr>
											<td>${report[0]}</td>
											<!-- Khung Giờ -->
											<td>${report[1]}</td>
											<!-- Số Lượt Đặt -->
											<td>${report[2]}</td>
											<!-- Tổng Số Giờ Đã Đặt -->
											<td><fmt:formatNumber value="${report[3]}"
													type="currency" currencySymbol="₫" /></td>
											<!-- Doanh Thu -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

