<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            margin-bottom: 20px;
        }

        .product-card {
            transition: all 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-center {
            display: flex;
            justify-content: center;
        }

        .carousel-item img {
            height: 300px; /* Chiều cao hình ảnh */
            object-fit: cover; /* Đảm bảo hình ảnh được cắt cho vừa khung */
            width: 100%; /* Đảm bảo hình ảnh đầy đủ chiều rộng */
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item ms-4">
                        <a class="nav-link active" href="#">Trang chủ</a>
                    </li>
                    <li class="nav-item ms-4">
                        <a class="nav-link active" href="#">Danh Sách Sản Phẩm</a>
                    </li>
                    <li class="nav-item ms-4">
                        <a class="nav-link active" href="#">Thống Kê</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <form id="searchForm" action="/search" method="POST" class="row mb-4">
            <div class="col-md-4">
                <label for="productName" class="form-label">Tìm theo tên sản phẩm</label>
                <input type="text" name="productName" id="productName" class="form-control" placeholder="Nhập tên sản phẩm" value="${productName}">
            </div>
            <div class="col-md-3">
                <label for="priceFrom" class="form-label">Giá từ</label>
                <input type="number" name="priceFrom" id="priceFrom" class="form-control" placeholder="Giá từ" value="${priceFrom}">
            </div>
            <div class="col-md-3">
                <label for="priceTo" class="form-label">Giá đến</label>
                <input type="number" name="priceTo" id="priceTo" class="form-control" placeholder="Giá đến" value="${priceTo}">
            </div>
            <div class="col-md-2">
                <label for="sortOrder" class="form-label">Sắp xếp theo giá</label>
                <select name="sortOrder" id="sortOrder" class="form-select">
                    <option value="non" ${sortOrder == 'non' ? 'selected' : ''}>Không Sắp Xếp</option>
                    <option value="asc" ${sortOrder == 'asc' ? 'selected' : ''}>Tăng dần</option>
                    <option value="desc" ${sortOrder == 'desc' ? 'selected' : ''}>Giảm dần</option>
                </select>
            </div>
            <div class="col-md-12 mt-3">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                <a href="/reload" class="btn btn-danger ms-3">Tải Lại Trang</a>
            </div>
        </form>

        <!-- Danh sách sản phẩm -->
        <div class="row">
            <c:forEach var="product" items="${productList}">
                <div class="col-md-3 mb-4">
                    <div class="card product-card">
                        <!-- Carousel for images -->
                        <div id="carousel-${product.maSanPham}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:choose>
                                    <c:when test="${empty product.hinhAnhList}">
                                        <div class="carousel-item active">
                                            <img src="/Image/NullPic.jpg" class="d-block" alt="Hình ảnh mặc định">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="image" items="${product.hinhAnhList}" varStatus="status">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                                <img src="/Image/${image.hinhAnh}" class="d-block" alt="${product.tenSanPham}">
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${product.maSanPham}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel-${product.maSanPham}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><b>Tên Sản Phẩm:</b> ${product.tenSanPham}</h5>
                            <p class="card-text"><b>Giá:</b> $${product.donGia}</p>
                            <p class="card-text"><b>Mã Loại:</b> ${product.maLoai}</p>
                            <p class="card-text"><b>Mô Tả:</b> ${product.moTa}</p>
                            <div class="btn-center">
                                <a href="/edit/${product.maSanPham}" class="btn btn-success">Sửa</a>
                                <a href="/delete/${product.maSanPham}" class="btn btn-danger ms-3">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
