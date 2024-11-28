<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Quản lý đặt sân</title>
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

.nav-link.active {
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
							<a class="nav-link text-white" href="/employee/index">
								<i class="bi bi-house-door"></i> Trang chủ
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" href="/employee/badmintonManager"> 
								<i class="bi bi-building"></i> Quản lý sân
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="/employee/courtOrderManager"> 
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
		<div class="col-md-10 ms-sm-auto col-lg-10 px-4 w-80">
			<h1 class="mt-4">Quản lý đặt sân</h1>
			<hr>
			<!-- Tìm kiếm -->
			<div class="row px-5 my-3">
					<h3>Tìm kiếm</h3>
				<form action="/employee/courtOrderManager" onsubmit="disableEmptyInputs(this)" id="searchForm">
					<div class="row mb-2">
						<div class="col-6">
							<div class="row">
								<label for="searchCustomer"
									class="col-3 col-form-label fw-bold py-0">Tên người đặt</label>
								<div class="col-9">
									<input type="text" class="form-control"
										name="searchCustomer" value="${searchCustomer}" />
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="row">
								<label for="searchCourt"
									class="col-2 col-form-label fw-bold">Sân</label>
								<div class="col-10">
									<input type="text" class="form-control"
										name="searchCourt" value="${searchCourt}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-6">
							<div class="row">
								<label for="status" class="col-3 col-form-label fw-bold" style="font-size: 15px">Tình trạng</label>
								<div class="col-9">
									<select class="form-select" aria-label="Type" name="status">
										<option value="tatca">Tất cả</option>
										<c:forEach var="tinhTrangItem" items="${tinhTrang}">
											<option value="${tinhTrangItem.key}"
												<c:if test="${searchStatus == tinhTrangItem.key}">selected</c:if>>${tinhTrangItem.value}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="row">
								<label class="col-2 col-form-label fw-bold">Thời gian</label>
						        <div class="col-10 text-center">
						            <div class="d-flex justify-content-between px-1" style="font-size: 14px; margin-bottom: -11px">
						                <span id="minTimeText"><fmt:formatNumber type="number" maxFractionDigits="3" value="${minTime}"/></span>
						                <span id="maxTimeText"><fmt:formatNumber type="number" maxFractionDigits="3" value="${maxTime}"/></span>
						            </div>
						            
						            <div class="row">
						                <div class="col">
						                    <input type="range" class="form-range" style="height: 0 !important" id="minSlider" name="minTime"
						                           min="6" max="22" value="${minTime}" step="1">
						                </div>
						                <div class="col">
						                    <input type="range" class="form-range" style="height: 0 !important" id="maxSlider" name="maxTime"
						                           min="6" max="22" value="${maxTime}" step="1">
						                </div>
						            </div>
						        </div>
							</div>
					        
						    <script>
							    const minSlider = document.getElementById('minSlider');
							    const maxSlider = document.getElementById('maxSlider');
							    const minTimeText = document.getElementById('minTimeText');
							    const maxTimeText = document.getElementById('maxTimeText');
							    
							    function updateMin() {
							        let minVal = parseInt(minSlider.value);
							        let maxVal = parseInt(maxSlider.value);
	
							        if (minVal >= maxVal) {
							            minSlider.value = maxVal - 1;
							            minVal = maxVal - 1;
							        }
	
							        minTimeText.textContent = minVal.toLocaleString('it-IT');
							    }
							    
							    function updateMax() {
							        let minVal = parseInt(minSlider.value);
							        let maxVal = parseInt(maxSlider.value);
	
							        if (maxVal <= minVal) {
							            maxSlider.value = minVal + 1;
							            maxVal = minVal + 1;
							        }
	
							        maxTimeText.textContent = maxVal.toLocaleString('it-IT');
							    }

							    minSlider.addEventListener('input', updateMin);
							    maxSlider.addEventListener('input', updateMax);
							</script>
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<div class="mx-2">
							<button class="w-100 btn btn-success">Search</button>
						</div>
						<div class="">
							<a href="/employee/courtOrderManager" class="w-100 btn btn-danger">Clear</a>
						</div>
					</div>
				</form>
			</div>
			<hr>
			<!-- Danh sách -->
			<div class="px-5">
				<table class="table align-middle mb-0 bg-white mb-3">
					<thead class="bg-light">
						<tr>
							<th>Mã đặt sân</th>
							<th>Tên người đặt</th>
							<th>Tên sân</th>
							<th>Ngày đặt</th>
							<th>Thời gian</th>
							<th>Tình trạng</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="courtOrderItem" items="${courtOrders.content}">
							<tr onclick="window.location='/employee/courtOrderManager/${courtOrderItem.id}';" style="cursor: pointer;">
								<td>${courtOrderItem.id}</td>
								<td>${courtOrderItem.customer.name}</td>
								<td>${courtOrderItem.badmintoncourt.name}</td>
								<td><fmt:formatDate type="date" pattern="dd/MM" value="${courtOrderItem.date}"/></td>
								<td>
									<fmt:formatDate type="time" pattern="HH:mm" value="${courtOrderItem.start}"/>
									 - 
									<fmt:formatDate type="time" pattern="HH:mm" value="${courtOrderItem.end}"/>
								</td>
								<td>
									<c:if test="${courtOrderItem.status == 'Đã thanh toán'}">
										<span class="badge text-bg-success rounded-pill">Đã thanh toán</span>
									</c:if>
									<c:if test="${courtOrderItem.status == 'Đang xử lý'}">
										<span class="badge text-bg-warning rounded-pill text-white">Đang xử lý</span>
									</c:if>
								</td>
								<td>
									<a href="/employee/courtOrderManager/${courtOrderItem.id}" class="btn btn-primary border-0 btn-sm">
										<i class="fa-solid fa-eye"></i>
									</a>
									<a href="/employee/courtOrderChecked/${courtOrderItem.id}" onclick="return confirm('Are you sure?') ? true : false;"
										class="btn
										<c:choose>
											<c:when test="${courtOrderItem.status == 'Đã thanh toán'}">
												btn-success disabled
											</c:when>
											<c:otherwise>
												btn-warning
											</c:otherwise>
										</c:choose> 
										border-0 btn-sm text-white">
										<i class="fa-solid fa-check"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	            <c:set var="delta" value="2" />
	            <c:set var="startPage" value="${currentPage - delta < 1 ? 1 : currentPage - delta}" />
	            <c:set var="endPage" value="${currentPage + delta > courtOrders.totalPages ? courtOrders.totalPages : currentPage + delta}" />
				<c:if test="${courtOrders.totalPages > 1}">
		            <nav aria-label="Phân Trang" class="mb-3">
		                <ul class="pagination justify-content-end">
		                    <li class="page-item <c:if test='${courtOrders.first}'>disabled</c:if>">
		                        <a class="page-link" href="${urlString}&page=${courtOrders.first ? 1 : currentPage - 1}">Trước</a>
		                    </li>
		
		                    <c:if test="${startPage > 1}">
		                        <li class="page-item">
		                            <a class="page-link" href="${urlString}&page=1">1</a>
		                        </li>
		                        <c:if test="${startPage > 2}">
		                            <li class="page-item disabled"><span class="page-link">...</span></li>
		                        </c:if>
		                    </c:if>
		
		                    <c:forEach var="page" begin="${startPage}" end="${endPage}">
		                        <li class="page-item <c:if test='${page == currentPage}'>active</c:if>">
		                            <a class="page-link" href="${urlString}&page=${page}">${page}</a>
		                        </li>
		                    </c:forEach>
		
		                    <c:if test="${endPage < courtOrders.totalPages}">
		                        <c:if test="${endPage < courtOrders.totalPages - 1}">
		                            <li class="page-item disabled"><span class="page-link">...</span></li>
		                        </c:if>
		                        <li class="page-item">
		                            <a class="page-link" href="${urlString}&page=${courtOrders.totalPages}">${courtOrders.totalPages}</a>
		                        </li>
		                    </c:if>
		
		                    <li class="page-item <c:if test='${courtOrders.last}'>disabled</c:if>">
		                        <a class="page-link" href="${urlString}&page=${courtOrders.last ? courtOrders.totalPages : currentPage + 1}">Sau</a>
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