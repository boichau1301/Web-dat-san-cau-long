<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Đăng ký</title>
</head>

<body>
    <div class="container w-50 py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100 shadow p-3 bg-body-tertiary rounded">
            <div class="col-12">
                <a href="/" class="text-decoration-none pt-1">Về lại trang chủ</a>
            </div>
            <div class="col-5">
                <img src="https://png.pngtree.com/png-clipart/20230817/original/pngtree-vector-illustration-of-badminton-rackets-and-shuttlecocks-in-a-fun-doodle-style-with-the-playful-lettering-play-with-me-vector-picture-image_11009468.png" alt="" class="img-fluid">
            </div>
            <div class="col-7 container py-auto">
                <h4 class="text-center mb-4">Đăng ký</h4>
                <form:form action="/signup" method="post" modelAttribute="customer">
                    <div class="row mb-4">
                        <label for="hoTen" class="col-3 col-form-label fw-bold">Họ tên</label>
                        <div class="col-9">
                            <form:input path="name" type="text" class="form-control" id="hoTen" />
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="dienThoai" class="col-3 col-form-label fw-bold">Điện thoại</label>
                        <div class="col-9">
                            <form:input path="phoneNumber" type="text" class="form-control" id="dienThoai" />
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="email" class="col-3 col-form-label fw-bold">Email</label>
                        <div class="col-9">
                            <form:input path="email" type="email" class="form-control" id="email" />
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="diaChi" class="col-3 col-form-label fw-bold">Địa chỉ</label>
                        <div class="col-9">
                            <form:input path="address" type="text" class="form-control" id="diaChi" />
                        </div>
                    </div>
                     <div class="row mb-4">
                        <label for="TenDangNhap" class="col-3 col-form-label fw-bold">Tên Đăng Nhập</label>
                        <div class="col-9">
                            <form:input path="username" type="text" class="form-control" id="username" />
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="matKhau" class="col-3 col-form-label fw-bold">Mật khẩu</label>
                        <div class="col-9">
                            <form:input path="password" type="password" class="form-control" id="matKhau" />
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary btn-lg px-5 fw-bold">Đăng ký</button>
                    </div>
                    <div class="d-flex justify-content-center">
                        <h1 class="text-center mb-4">${Message}</h4>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
