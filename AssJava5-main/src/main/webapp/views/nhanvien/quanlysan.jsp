<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

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
<title>Quản lý sân</title>
<style type="text/css">
/* Showing badminton court */
img.hinhSan {
	max-width: none;
	max-height: none;
	object-fit: cover;
	width: 100%;
	height: 100%;
}


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
			<nav class="col-md-2 sidebar d-none d-md-block">
				<div class="sidebar-sticky">
					<h4 class="sidebar-title">Java5 - Nhóm 7</h4>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/index"> <i class="bi bi-house-door"></i>
								Trang chủ
						</a></li>
						<li class="nav-item"><a class="nav-link active"
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
						<li class="nav-item"><a class="nav-link text-white"
							href="/employee/report"> <i class="bi bi-bar-chart"></i> Báo
								cáo thống kê
						</a></li>
					</ul>
				</div>
			</nav>
			<div class="col-md-9 ms-sm-auto col-lg-10 px-4 w-80">
				<h1 class="mt-4">Quản lý sân</h1>
				<hr>
				<c:if test="${not empty errorNotFound}">
					<div class="rounded-4 bg-danger-subtle p-3 mt-1 mb-3 text-danger">${errorNotFound}</div>
				</c:if>
				<!-- Thông tin sân -->
				<div class="rounded px-5 mt-2">
					<div class="row">
						<div class="col-4">
							<!-- Ảnh sân -->
							<c:if test="${empty sanChiTiet.badmintonCourtPics}">
								<div class="row">
									<div class="col-8 ps-0">
										<img
											src="https://media.architecturaldigest.com/photos/60d5eb352990a3040500dc40/16:9/w_5455,h_3068,c_limit/Waterfalling%20Estate%2006-30-2020%20002.jpg"
											alt="" class="hinhSan">
									</div>
									<div class="col-4 px-0">
										<div class="row mb-2">
											<img
												src="https://cdn.speedsize.com/360481fb-1d0c-442f-ad69-87be324bfa71/https://www.neilson.co.uk/sites/default/files/styles/hub_article_info_block_focal_point_mobile/public/2017-08/grass-court_1_1.jpg?h=f4c57e75&ss_h=dfa52849&itok=70__Q7d9"
												alt="" class="hinhSan">
										</div>
										<div class="row">
											<img
												src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ89aac80RhRN2a0D0WIoIFkURunMcNim7IQw&s"
												alt="" class="hinhSan">
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${not empty sanChiTiet.badmintonCourtPics}">
								<div id="carouselExampleAutoplaying" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-inner">
										<c:forEach var="pic" items="${sanChiTiet.badmintonCourtPics}"
											varStatus="num">
											<div
												class="carousel-item <c:if test="${num.index == 0}">active</c:if>">
												<img src="${pic.linkAnh}" class="d-block w-100" alt="Image">
											</div>
										</c:forEach>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleAutoplaying"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleAutoplaying"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</c:if>
						</div>
						<div class="col-8 px-5">
							<!-- maSan tenSan loaiSan giaSan thoiGianSan diaChiSan moTaSan -->
							<form:form action="/employee/badmintonUpdate" method="post" class="row"
								modelAttribute="sanChiTiet">
								<div class="col-6">
									<div class="row mb-3">
										<label for="id" class="col-3 col-form-label fw-bold">Mã
											sân</label>
										<div class="col-9">
											<form:input path="id" class="form-control" id="id"
												readonly="true" />
										</div>
									</div>
									<div class="row mb-3">
										<label for="name" class="col-3 col-form-label fw-bold">Tên
											sân</label>
										<div class="col-9">
											<form:input path="name" class="form-control" id="name" />
										</div>
									</div>
									<div class="row mb-3">
										<label for="type" class="col-3 col-form-label fw-bold">Loại
											sân</label>
										<div class="col-9">
											<form:input path="type" class="form-control" id="type" />
											</select>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row mb-3">
										<label for="price" class="col-3 col-form-label fw-bold">Giá
											sân</label>
										<div class="col-9">
											<form:input path="price" class="form-control" id="price"
												type="number" />
										</div>
									</div>
									<div class="row mb-3">
										<label for="address" class="col-3 col-form-label fw-bold">Địa
											chỉ</label>
										<div class="col-9">
											<form:input path="address" class="form-control" id="address" />
										</div>
									</div>
									<div class="row mb-3">
										<label for="description" class="col-3 col-form-label fw-bold">Mô
											tả</label>
										<div class="col-9">
											<form:textarea path="description" class="form-control"
												id="description" rows="3" />
										</div>
									</div>
								</div>
								<div class="d-flex justify-content-end">
									<div class="">
										<a href="/employee/badmintonAdd"
											class="btn btn-success text-white fw-bold rounded-3">Thêm
											mới</a>
										<button class="btn btn-warning text-white fw-bold rounded-3">Cập
											nhật</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<hr>
				<!-- Tìm kiếm -->
				<div class="px-5 my-3 mx-auto">
					<h3>Tìm kiếm</h3>
					<form action="/employee/badmintonManager"
						onsubmit="disableEmptyInputs(this)" id="searchForm">
						<div class="row mb-2">
							<div class="col-6">
								<div class="row">
									<label for="searchName" class="col-2 col-form-label fw-bold">Tên</label>
									<div class="col-10">
										<input type="text" class="form-control" name="searchName"
											value="${searchName}" />
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-6">
								<div class="row">
									<label for="searchType" class="col-2 col-form-label fw-bold">Loại</label>
									<div class="col-10">
										<select class="form-select" aria-label="Type"
											name="searchType">
											<option value="tatca">Tất cả</option>
											<c:forEach var="loaiSanItem" items="${loaiSan}">
												<option value="${loaiSanItem.key}"
													<c:if test="${searchType == loaiSanItem.key}">selected</c:if>>${loaiSanItem.value}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-6">
								<div class="row">
									<label for="searchCountry" class="col-2 col-form-label fw-bold">Khu
										vực</label>
									<div class="col-10">
										<select class="form-select" aria-label="Country"
											name="searchCountry">
											<c:forEach var="khuVucItem" items="${khuvuc}">
												<option value="${khuVucItem.key}"
													<c:if test="${searchCountry == khuVucItem.key}">selected</c:if>>${khuVucItem.value}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-6">
								<div class="row">
									<label class="col-2 col-form-label fw-bold">Giá</label>
									<div class="col-10 text-center">
										<div class="d-flex justify-content-between px-1"
											style="font-size: 14px; margin-bottom: -11px">
											<span id="minPriceText"><fmt:formatNumber
													type="number" maxFractionDigits="3" value="${minPrice}" /></span>
											<span id="maxPriceText"><fmt:formatNumber
													type="number" maxFractionDigits="3" value="${maxPrice}" /></span>
										</div>

										<div class="row">
											<div class="col">
												<input type="range" class="form-range"
													style="height: 0 !important" id="minSlider" name="minPrice"
													min="0" max="1000000" value="${minPrice}" step="100000">
											</div>
											<div class="col">
												<input type="range" class="form-range"
													style="height: 0 !important" id="maxSlider" name="maxPrice"
													min="0" max="1000000" value="${maxPrice}" step="100000">
											</div>
										</div>
									</div>
								</div>

								<script>
									const minSlider = document
											.getElementById('minSlider');
									const maxSlider = document
											.getElementById('maxSlider');
									const minPriceText = document
											.getElementById('minPriceText');
									const maxPriceText = document
											.getElementById('maxPriceText');

									function updateMinPrice() {
										let minVal = parseInt(minSlider.value);
										let maxVal = parseInt(maxSlider.value);

										if (minVal >= maxVal) {
											minSlider.value = maxVal - 100000;
											minVal = maxVal - 100000;
										}

										minPriceText.textContent = minVal
												.toLocaleString('it-IT');
									}

									function updateMaxPrice() {
										let minVal = parseInt(minSlider.value);
										let maxVal = parseInt(maxSlider.value);

										if (maxVal <= minVal) {
											maxSlider.value = minVal + 100000;
											maxVal = minVal + 100000;
										}

										maxPriceText.textContent = maxVal
												.toLocaleString('it-IT');
									}

									minSlider.addEventListener('input',
											updateMinPrice);
									maxSlider.addEventListener('input',
											updateMaxPrice);
								</script>
							</div>
							<div class="col-6">
								<div class="btn-group w-100 h-100" role="group">
									<input type="radio" class="btn-check" name="sort" id="sort1"
										autocomplete="off" value="asc"
										<c:if test="${sort == 'asc'}">checked</c:if>
										onchange="submitForm()" /> <label
										class="h-100 btn btn-outline-danger px-2 pt-1" for="sort1">
										<i class="fa-solid fa-arrow-down-wide-short"></i> Giá cao-thấp
									</label> <input type="radio" class="btn-check" name="sort" id="sort2"
										autocomplete="off" value="desc"
										<c:if test="${sort == 'desc'}">checked</c:if>
										onchange="submitForm()" /> <label
										class="h-100 btn btn-outline-danger px-2 pt-1" for="sort2">
										<i class="fa-solid fa-arrow-down-short-wide"></i> Giá thấp-cao
									</label>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<div class="mx-2">
								<button class="w-100 btn btn-success">Search</button>
							</div>
							<div class="">
								<a href="/employee/badmintonManager" class="w-100 btn btn-danger">Clear</a>
							</div>
						</div>
					</form>
				</div>
				<hr>
				<!-- Danh sách -->
				<div class="px-5 overflow-auto">
					<table class="table align-middle mb-0 bg-white table-sticky mb-3">
						<thead class="bg-light">
							<tr>
								<th>Mã sân</th>
								<th>Tên sân</th>
								<th>Loại sân</th>
								<th>Giá sân</th>
								<th>Địa chỉ</th>
								<th>Trạng thái</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="san" items="${sans.content}">
								<tr
									onclick="window.location='/employee/badmintonManager/${san.id}${urlString}';"
									style="cursor: pointer;">
									<td>${san.id}</td>
									<td>${san.name}</td>
									<td>${san.type}</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${san.price}" /></td>
									<td>${san.address}</td>
									<td><c:if test="${san.availability}">
											<span class="badge text-bg-success rounded-pill">Hoạt
												động</span>
										</c:if> <c:if test="${not san.availability}">
											<span class="badge text-bg-danger rounded-pill">Chưa
												đặt</span>
										</c:if></td>
									<td><a href="/employee/badmintonManager/${san.id}"
										class="btn btn-primary border-0 btn-sm"> <i
											class="fa-regular fa-pen-to-square"></i>
									</a> <a href="/employee/badmintonRemove/${san.id}"
										class="btn btn-danger border-0 btn-sm"
										onclick="return confirm('Are you sure?') ? true : false;">
											<i class="fa-regular fa-trash-can"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:set var="delta" value="2" />
					<c:set var="startPage"
						value="${currentPage - delta < 1 ? 1 : currentPage - delta}" />
					<c:set var="endPage"
						value="${currentPage + delta > sans.totalPages ? sans.totalPages : currentPage + delta}" />
					<c:if test="${sans.totalPages > 1}">
						<nav aria-label="Phân Trang" class="mb-3">
							<ul class="pagination justify-content-end">
								<li class="page-item <c:if test='${sans.first}'>disabled</c:if>">
									<a class="page-link"
									href="${urlString}&page=${sans.first ? 1 : currentPage - 1}">Trước</a>
								</li>

								<c:if test="${startPage > 1}">
									<li class="page-item"><a class="page-link"
										href="${urlString}&page=1">1</a></li>
									<c:if test="${startPage > 2}">
										<li class="page-item disabled"><span class="page-link">...</span></li>
									</c:if>
								</c:if>

								<c:forEach var="page" begin="${startPage}" end="${endPage}">
									<li
										class="page-item <c:if test='${page == currentPage}'>active</c:if>">
										<a class="page-link" href="${urlString}&page=${page}">${page}</a>
									</li>
								</c:forEach>

								<c:if test="${endPage < sans.totalPages}">
									<c:if test="${endPage < sans.totalPages - 1}">
										<li class="page-item disabled"><span class="page-link">...</span></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="${urlString}&page=${sans.totalPages}">${sans.totalPages}</a>
									</li>
								</c:if>

								<li class="page-item <c:if test='${sans.last}'>disabled</c:if>">
									<a class="page-link"
									href="${urlString}&page=${sans.last ? sans.totalPages : currentPage + 1}">Sau</a>
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