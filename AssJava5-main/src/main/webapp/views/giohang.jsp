<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Giỏ hàng</title>
</head>

<body>
    <div class="container py-5">
        <h3 class="fw-normal mb-4">Giỏ hàng</h3>

        <table class="table align-middle bg-white">
            <thead class="bg-light">
                <tr>
                    <th>Mã Sản Phẩm</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Thời gian</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Tổng tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${listCart}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.time}</td>
                        <td class="d-flex">
                            <button class="btn btn-link px-2">
                                <i class="fas fa-minus"></i>
                            </button>
                            <input type="number" min="0" value="${product.quantity}" class="form-control text-center" style="width: 60px;">
                            <button class="btn btn-link px-2">
                                <i class="fas fa-plus"></i>
                            </button>
                        </td>
                        <td>${product.price} VND</td>
                        <td>${product.price * product.quantity} VND</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
