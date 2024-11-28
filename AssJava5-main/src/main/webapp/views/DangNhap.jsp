<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
    <title>Đăng nhập</title>
</head>

<body>
    <div class="container w-50 p-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100 shadow p-3 bg-body-tertiary rounded">
            <div class="col-12">
                <a href="/" class="text-decoration-none pt-1">Về lại trang chủ</a>
            </div>
            <div class="col-6">
                <img src="https://png.pngtree.com/png-clipart/20230817/original/pngtree-vector-illustration-of-badminton-rackets-and-shuttlecocks-in-a-fun-doodle-style-with-the-playful-lettering-play-with-me-vector-picture-image_11009468.png" alt="" class="img-fluid">
            </div>
            <div class="col-6 container px-3 py-auto">
                <h4 class="text-center mb-4">Đăng nhập</h4>

                <!-- Sử dụng Spring form với modelAttribute 'loginForm' -->
                <form:form action="${pageContext.request.contextPath}/customer/login" method="post" modelAttribute="user">
                    <div class="row mb-4">
                        <label for="username" class="col-3 col-form-label fw-bold">Username</label>
                        <div class="col-9">
                            <!-- Sử dụng Spring form input path tới thuộc tính 'username' -->
                            <form:input type="text" path="username" class="form-control" id="username" />
                        </div>
                    </div>

                    <div class="row mb-4">
                        <label for="password" class="col-3 col-form-label fw-bold">Password</label>
                        <div class="col-9">
                            <!-- Sử dụng Spring form input path tới thuộc tính 'password' -->
                            <form:input type="password" path="password" class="form-control" id="password" />
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary btn-lg fw-bold px-4">Đăng nhập</button>
                    </div>
                    <div class="d-flex justify-content-center">
                        <h4 class="text-center mb-4">${Message}</h4>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>
