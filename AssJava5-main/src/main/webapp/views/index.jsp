<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>Trang chủ</title>
<style>
nav .nav-link {
	color: rgba(255, 255, 255, 0.8) !important;
}

nav .nav-link:hover {
	color: rgba(255, 255, 255) !important;
}

.btn.rounded-circle {
	width: 2.3125rem;
	line-height: 2.3125rem;
}

.btn.rounded-circle:hover {
	box-shadow: 0 8px 9px -4px rgba(0, 0, 0, 0.15), 0 4px 18px 0
		rgba(0, 0, 0, 0.1);
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark navbar-expand-md bg-faded justify-content-center sticky-top mb-4"
		style="background-color: #597a94;">
		<div class="container-fluid px-4">
			<a href="/" class="navbar-brand d-flex w-50 me-auto">Java 5</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsingNavbar3">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
				<ul class="navbar-nav w-100 justify-content-evenly">
					<li class="nav-item active"><a class="nav-link" href="/">Trang
							chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="/DanhSachSanTheoLoaiSan">Sân</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Shop</a></li>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/employeeManager">Dành cho chủ sân</a></li>
				</ul>
				<ul
					class="nav navbar-nav ms-auto w-100 justify-content-end align-items-center">
					<li class="nav-item pe-4"><a
						class="nav-link position-relative" href="/customer/giohang"> <i
							class="fa-solid fa-cart-shopping fa-xl"></i> <span
							class="position-absolute top-10 start-100 translate-middle badge rounded-pill bg-danger">99
								<span class="visually-hidden">số lượng</span>
						</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="signup">Đăng
							ký</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<span class="btn btn-danger rounded-4 flex-grow-1">Đăng
								nhập</span>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="employee/loginEmployee">Nhân
									viên</a></li>
							<li><a class="dropdown-item" href="customer/login">Khách hàng</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="w-100 mb-4 position-relative overflow-none"
		style="height: 690px;">
		<div
			class="position-absolute w-100 h-75 d-flex align-items-center justify-content-center">
			<div class="row text-center m-0">
				<div class="col-12 text-white pb-5">
					<h1
						style="-webkit-text-stroke-color: black; -webkit-text-stroke-width: 1px;">
						Sân của bạn, niềm vui của bạn</h1>
					<h2
						style="-webkit-text-stroke-color: black; -webkit-text-stroke-width: 1px;">
						Trải nghiệm đặt sân cầu lông tiện lợi, dành thời gian cho những
						trận đấu hấp dẫn cùng bạn bè!</h2>
				</div>
				<div class="col-12 d-flex justify-content-center">
					<form action="/SortByAddress" method="post"  class="row bg-secondary-subtle rounded-4 px-2 py-3"
						style="width: 40%;">
						<div class="col-5 d-flex flex-column">
							<label for="timKhuVuc" class="form-label text-start ps-1 mb-1">
								<i class="fa-solid fa-location-dot text-danger"></i> Khu vực
							</label> <input type="text" name="timKhuVuc" id="timKhuVuc" class="form-control" placeholder="Nhập khu vực">
						</div>
						<div class="col-5 d-flex flex-column">
							<label for="timThoiGian" class="form-label text-start ps-1 mb-1">
								<i class="fa-solid fa-clock text-danger"></i> Thời gian
							</label> <input type="datetime-local" name="timThoiGian" id="timThoiGian" class="form-control">
						</div>
						<div
							class="col-2 d-flex justify-content-center align-items-center p-0">
							<button class="btn">
								<i class="fa-solid fa-magnifying-glass fa-2xl text-danger"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<img
			src="https://www.racquetpoint.com/cdn/shop/articles/what-is-badminton-racquet-point.jpg?v=1654120169"
			alt="" class="w-100 h-100" style="object-fit: cover;">
	</div>

	<!-- Body -->
	<div class="container">
<div class="mb-4">
    <h3>Chọn sân của bạn</h3>
    <button class="btn btn-danger rounded-pill">Hồ Chí Minh</button>
    <button class="btn btn-outline-danger rounded-pill ms-2">Hà Nội</button>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

    <div class="row flex-nowrap overflow-auto mt-2">
        <form:form method="post">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header">Danh sách sân cầu lông</div>
                    <div id="sancauCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <c:forEach var="sancau" items="${cacsancau}" varStatus="status">
                                <div class="carousel-item ${status.first ? 'active' : ''}">
                                    <div class="text-center">
                                        <img src="/image/${sancau.badmintonCourtPics[0].linkAnh}" 
                                             alt="${sancau.name}" 
                                             class="img-fluid rounded-4" 
                                             style="width: 100%; max-height: 500px; object-fit: cover;">
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">${sancau.name}</h5>
                                        <p class="card-text"><strong>Giá: ${sancau.price} VND</strong></p>
                                        <div class="d-flex justify-content-center">
                                            <a href="datNgay/${sancau.id}" class="btn btn-primary me-2">Đặt ngay</a>
                                            <a href="/badmintonDetail/${sancau.id}" class="btn btn-secondary">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <button class="carousel-control-prev" type="button" data-bs-target="#sancauCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#sancauCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>



<div class="mb-4">
    <h3>Ưu đãi cuối tuần</h3>
    <div class="row">
        <c:forEach var="sancau" items="${cacsancau}">
            <div class="col-md-3 mt-4">
                <a href="chiTiet/${sancau.id}" class="text-decoration-none  text-dark">
                    <div class="card shadow">
                        <div id="carousel-${sancau.id}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:choose>
                                    <c:when test="${empty sancau.badmintonCourtPics}">
                                        <div class="carousel-item active">
                                            <img src="/image/NullPic.jpg" class="d-block" alt="Default Image" style="width: 304px; height: 200px; object-fit: cover;">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="pic" items="${sancau.badmintonCourtPics}" varStatus="status">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                                <img src="/image/${pic.linkAnh}" class="d-block" alt="${sancau.name}" style="width: 304px; height: 200px; object-fit: cover;">
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${sancau.id}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel-${sancau.id}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${sancau.name}</h5>
                            <p class="card-text fs-5">
                                Giá: <span class="text-decoration-line-through">${sancau.price}đ</span>
                                <span>${sancau.price}đ</span>
                            </p>
                            <div class="d-flex justify-content-evenly">
                                <a href="datNgay/${sancau.id}" class="btn btn-outline-danger">Đặt ngay</a>
                                <a href="/badmintonDetail/${sancau.id}" class="btn btn-danger">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>





<div class="mb-4">
    <h3>Phụ kiện</h3>
    <div class="row">
        <c:forEach var="sanpham" items="${cacSanPham}">
            <div class="col-md-3 mt-4">
                <a href="/productDetail/${sanpham.maSanPham}" class="text-decoration-none text-dark">
                    <div class="card shadow">
                        <div id="carousel-${sanpham.maSanPham}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:choose>
                                    <c:when test="${empty sanpham.productImages}">
                                        <div class="carousel-item active">
                                            <img src="/image/NullPic.jpg" class="d-block" alt="Default Image" style="width: 304px; height: 200px; object-fit: cover;">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="image" items="${sanpham.productImages}" varStatus="status">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                                <img src="/image/${image.duongDanHinh}" class="d-block" alt="${sanpham.tenSanPham}" style="width: 304px; height: 200px; object-fit: cover;">
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${sanpham.maSanPham}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel-${sanpham.maSanPham}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${sanpham.tenSanPham}</h5>
                            <p class="card-text fs-5">
                                Giá: <span>${sanpham.donGia}đ</span>
                            </p>
                            <div class="d-flex justify-content-evenly">
                                <a href="themGioHang/${sanpham.maSanPham}" class="btn btn-outline-danger me-2">Thêm vào giỏ hàng</a>
                                <a href="/productDetail/${sanpham.maSanPham}" class="btn btn-danger">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>


	</div>

	<!-- Footer -->
	<div class="mt-4">
		<footer class="text-center text-lg-start text-white"
			style="background-color: #597a94;">
			<div class="container pt-4 pb-2">
				<div class="row mt-4">
					<div class="col-6">
						<div class="d-flex align-items-center justify-content-center my-4">
							<img
								src="https://t3.ftcdn.net/jpg/00/54/89/08/360_F_54890802_j6XIBBYEpMf9D5mTZsSrqmXmJCtT3X0d.jpg"
								height="70" alt="" class="rounded-circle">
							<h1 class="px-2">Java 5</h1>
						</div>
						<ul
							class="list-unstyled d-flex flex-row justify-content-center mb-5 mt-4">
							<li class="px-2"><a
								class="btn text-white btn-floating m-1 d-flex justify-content-center align-items-center"
								style="background-color: #3b5998; width: 35px; height: 35px;"
								href="#!" role="button"> <i class="fab fa-facebook-f"></i>
							</a></li>
							<li class="px-2"><a
								class="btn text-white btn-floating m-1 d-flex justify-content-center align-items-center"
								style="background-color: #55acee; width: 35px; height: 35px;"
								href="#!" role="button"> <i class="fab fa-twitter"></i>
							</a></li>
							<li class="px-2"><a
								class="btn text-white btn-floating m-1 d-flex justify-content-center align-items-center"
								style="background-color: #ac2bac; width: 35px; height: 35px;"
								href="#!" role="button"> <i class="fab fa-instagram"></i>
							</a></li>
						</ul>
						<div class="text-white-50 text-center">
							<span>©2024 FPT Polytechnic</span>
						</div>
					</div>

					<div class="col-3">
						<h5 class="text-uppercase mb-4 fw-bold">Liên kết</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Sân</a></li>
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Phụ kiện</a></li>
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Tin tức</a></li>
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Dành cho chủ sân</a></li>
						</ul>
					</div>

					<div class="col-3">
						<h5 class="text-uppercase mb-4 fw-bold">Liên hệ</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Về chúng tôi</a></li>
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Chính sách bảo mật</a></li>
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Điều khoản sử dụng</a></li>
							<li class="mb-2"><a href="#!"
								class="text-white text-decoration-none">Hướng dẫn sử dụng</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>