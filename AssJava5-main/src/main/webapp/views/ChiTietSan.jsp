<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Chi tiết sân</title>

    <style>
        /* Điều chỉnh kích thước carousel */
        .carousel-item img {
            max-height: 400px;
            object-fit: cover;
            object-position: center;
        }
    </style>
</head>

<body class="bg-light">
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-primary">Chi tiết sân</h1>
            <a href="/" class="btn btn-outline-secondary">Quay về màn hình chính</a>
        </div>

        <!-- Carousel hình ảnh -->
        <div id="carouselExample" class="carousel slide shadow-sm rounded mb-4" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach var="image" items="${san.badmintonCourtPics}">
                    <div class="carousel-item ${image eq san.badmintonCourtPics[0] ? 'active' : ''}">
                        <img src="/image/${image.linkAnh}" class="d-block w-100 rounded" alt="Hình ảnh sân">
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Thông tin chi tiết sân -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h5 class="card-title text-center mb-3">Thông tin chi tiết</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Mã sân:</b> ${san.id}</li>
                    <li class="list-group-item"><b>Tên sân:</b> ${san.name}</li>
                    <li class="list-group-item"><b>Loại sân:</b> ${san.type}</li>
                    <li class="list-group-item"><b>Giá sân:</b> ${san.price} VND</li>
                    <li class="list-group-item"><b>Địa chỉ:</b> ${san.address}</li>
                    <li class="list-group-item"><b>Mô tả:</b> ${san.description}</li>
                    <li class="list-group-item"><b>Trạng thái:</b>
                        <c:choose>
                            <c:when test="${san.availability}">
                                <span class="badge bg-success">Đang hoạt động</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger">Tạm dừng hoạt động</span>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Nút Đặt Ngay -->
        <div class="text-center">
            <form action="/booking" method="post">
                <input type="hidden" name="courtId" value="${san.id}" />
                <button type="submit" class="btn btn-primary btn-lg">Đặt Ngay</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
