<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Chi tiết sản phẩm</title>

    <style>
        .carousel-item img {
             max-height: 400px;
            max-width: 100%; 
            object-fit: contain;
            object-position: center;
        }
    </style>
</head>

<body class="bg-light">
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-primary">Chi tiết sản phẩm</h1>
            <a href="/" class="btn btn-outline-secondary">Quay về màn hình chính</a>
        </div>

        <!-- Carousel hình ảnh sản phẩm -->
        <div id="productCarousel" class="carousel slide shadow-sm rounded mb-4" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach var="image" items="${product.productImages}">
                    <div class="carousel-item active">
                        <img src="/image/${image.duongDanHinh}" class="d-block w-100 rounded" alt="Hình ảnh sản phẩm">
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Thông tin chi tiết sản phẩm -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h5 class="card-title text-center mb-3">Thông tin sản phẩm</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Mã sản phẩm:</b> ${product.maSanPham}</li>
                    <li class="list-group-item"><b>Tên sản phẩm:</b> ${product.tenSanPham}</li>
                    <li class="list-group-item"><b>Danh mục:</b> ${product.loaiSanPham.tenLoai}</li>
                    <li class="list-group-item"><b>Giá:</b> ${product.donGia} VND</li>
                    <li class="list-group-item"><b>Mô tả:</b> ${product.moTa}</li>
                    <li class="list-group-item"><b>Trạng thái:</b>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Nút Mua Ngay -->
        <div class="text-center">
            <form action="/order" method="post">
                <input type="hidden" name="productId" value="${product.maSanPham}" />
                <button type="submit" class="btn btn-primary btn-lg">Mua Ngay</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
