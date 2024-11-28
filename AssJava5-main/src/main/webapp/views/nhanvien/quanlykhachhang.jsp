<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<title>Quản lý khách hàng</title>
<style type="text/css">
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
</style>
<script>
	window.onload = function() {
		const urlParams = new URLSearchParams(window.location.search);
		const page = parseInt(urlParams.get('page')) || 1;
		const totalPages = ${customers.totalPages};

		if (page < 1) {
			window.location.href = '?page=1';
		} else if (page > totalPages) {
			window.location.href = '?page=' + totalPages;
		}
	};
</script>
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
						<li class="nav-item"><a class="nav-link active"
							href="/employee/customerManager"> <i class="bi bi-gift"></i>
								Quản lý khách hàng
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/employeeManager"> <i class="bi bi-person"></i>
								Quản lý nhân viên
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/report"> <i class="bi bi-bar-chart"></i> Báo
								cáo thống kê
						</a></li>
					</ul>
				</div>
			</nav>
			<div class="col-md-9 ms-sm-auto col-lg-10 px-4 w-80">
				<h1 class="mt-4">Quản lý khách hàng</h1>
				<hr>
				<c:if test="${not empty errorNotFound}">
					<div class="rounded-4 bg-danger-subtle p-3 mt-1 mb-3 text-danger">${errorNotFound}</div>
				</c:if>

				<!-- Form thông tin nhân viên -->
				<div class="container bg-body-tertiary rounded p-4 shadow mb-4">
					<form:form method="POST" action="/employee/customerUpdate"
						modelAttribute="customer">
						<div class="row">
							<div class="col-6">
								<div class="row mb-3">
									<label for="id" class="col-3 col-form-label fw-bold">
										Mã khách hàng </label>
									<div class="col-9">
										<form:input path="id" class="form-control" readonly="true" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="name" class="col-3 col-form-label fw-bold">
										Họ tên </label>
									<div class="col-9">
										<form:input path="name" class="form-control" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="phoneNumber" class="col-3 col-form-label fw-bold">
										Số điện thoại </label>
									<div class="col-9">
										<form:input path="phoneNumber" class="form-control" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="address" class="col-3 col-form-label fw-bold">
										Địa chỉ </label>
									<div class="col-9">
										<form:input path="address" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-6">
								<div class="row mb-3">
									<label for="email" class="col-3 col-form-label fw-bold">
										Email </label>
									<div class="col-9">
										<form:input type="email" path="email" class="form-control" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="username" class="col-3 col-form-label fw-bold">
										Tên đăng nhập </label>
									<div class="col-9">
										<form:input path="username" class="form-control" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="password" class="col-3 col-form-label fw-bold">
										Mật khẩu </label>
									<div class="col-9">
										<form:input path="password" class="form-control"
											type="password" />
									</div>
								</div>
							</div>
						</div>
						<div class="mt-3 text-end">
							<button type="submit"
								class="btn btn-success text-white">Cập
								nhật thông tin</button>
							<a href="/employee/customerRemove/${customer.id}"
								class="btn btn-danger text-white"
								onclick="return confirm('Are you sure?') ? true : false;">Xóa
								tài khoản</a>
						</div>
					</form:form>
				</div>
				<hr>
				<!-- Tìm kiếm -->
				<div class="row px-5 my-3">
					<h3>Tìm kiếm</h3>
					<form action="/employee/customerManager" onsubmit="disableEmptyInputs(this)"
						id="searchForm">
						<div class="row mb-2">
							<div class="col-3">
								<div class="row">
									<label for="searchName" class="col-2 col-form-label fw-bold"
										style="font-size: 15px">Tên</label>
									<div class="col-10">
										<input type="text" class="form-control" name="searchName"
											value="${searchName}" />
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="row">
									<label for="searchPhone" class="col-4 col-form-label fw-bold">Số
										điện thoại</label>
									<div class="col-8">
										<input type="text" class="form-control" name="searchPhone"
											value="${searchPhone}" />
									</div>
								</div>
							</div>
							<div class="col-5">
								<div class="row">
									<label for="searchAddress" class="col-2 col-form-label fw-bold"
										style="font-size: 15px">Địa chỉ</label>
									<div class="col-10">
										<input type="text" class="form-control" name="searchAddress"
											value="${searchAddress}" />
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<div class="mx-2">
								<button class="w-100 btn btn-success">Search</button>
							</div>
							<div class="">
								<a href="/employee/customerManager" class="w-100 btn btn-danger">Clear</a>
							</div>
						</div>
					</form>
				</div>
				<hr>

				<!-- Danh sách nhân viên -->
				<div class="px-5 overflow-auto">
					<table class="table align-middle mb-0 bg-white mb-3">
						<thead class="bg-light">
							<tr>
								<th>Mã</th>
								<th>Họ tên</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th>Tên đăng nhập</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="customer" items="${customers.content}">
								<tr onclick="window.location='/employee/customerManager/${customer.id}';"
									style="cursor: pointer;">
									<td>${customer.id}</td>
									<td>${customer.name}</td>
									<td>${customer.phoneNumber}</td>
									<td>${customer.address}</td>
									<td>${customer.username}</td>
									<td><a href="/employee/customerManager/${customer.id}"
										class="btn btn-warning border-0 btn-sm"><i
											class="fa-solid fa-pen-to-square"></i></a> <a
										href="/employee/customerRemove/${customer.id}"
										class="btn btn-danger border-0 btn-sm"
										onclick="return confirm('Are you sure?') ? true : false;"><i
											class="fa-solid fa-ban"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:set var="delta" value="2" />
					<c:set var="startPage"
						value="${currentPage - delta < 1 ? 1 : currentPage - delta}" />
					<c:set var="endPage"
						value="${currentPage + delta > nhanViens.totalPages ? nhanViens.totalPages : currentPage + delta}" />
					<c:if test="${nhanViens.totalPages > 1}">
						<nav aria-label="Phân Trang" class="mb-3">
							<ul class="pagination justify-content-end">
								<li
									class="page-item <c:if test='${nhanViens.first}'>disabled</c:if>">
									<a class="page-link"
									href="?page=${nhanViens.first ? 1 : currentPage - 1}">Trước</a>
								</li>

								<c:if test="${startPage > 1}">
									<li class="page-item"><a class="page-link" href="?page=1">1</a>
									</li>
									<c:if test="${startPage > 2}">
										<li class="page-item disabled"><span class="page-link">...</span></li>
									</c:if>
								</c:if>

								<c:forEach var="page" begin="${startPage}" end="${endPage}">
									<li
										class="page-item <c:if test='${page == currentPage}'>active</c:if>">
										<a class="page-link" href="?page=${page}">${page}</a>
									</li>
								</c:forEach>

								<c:if test="${endPage < nhanViens.totalPages}">
									<c:if test="${endPage < nhanViens.totalPages - 1}">
										<li class="page-item disabled"><span class="page-link">...</span></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="?page=${nhanViens.totalPages}">${nhanViens.totalPages}</a>
									</li>
								</c:if>

								<li
									class="page-item <c:if test='${nhanViens.last}'>disabled</c:if>">
									<a class="page-link"
									href="?page=${nhanViens.last ? nhanViens.totalPages : currentPage + 1}">Sau</a>
								</li>
							</ul>
						</nav>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
