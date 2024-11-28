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
    <title>Danh sách sân</title>
</head>

<body>
    <nav class="navbar navbar-dark navbar-expand-md bg-faded justify-content-center sticky-top mb-4"
        style="background-color: #597a94;">
        <div class="container-fluid px-4">
            <a href="/" class="navbar-brand d-flex w-50 me-auto">Java 5</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsingNavbar3">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
                <ul class="navbar-nav w-100 justify-content-evenly">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="san">Sân</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Tin tức</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="nhanvien/quanlydatsan">Dành cho chủ sân</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav ms-auto w-100 justify-content-end align-items-center">
                    <li class="nav-item pe-4">
                        <a class="nav-link position-relative" href="#">
                            <i class="fa-solid fa-cart-shopping fa-xl"></i>
                            <span class="position-absolute top-10 start-100 translate-middle badge rounded-pill bg-danger">99
                                <span class="visually-hidden">số lượng</span>
                            </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup">Đăng ký</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login">
                            <span class="btn btn-danger rounded-4 flex-grow-1">Đăng nhập</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <span>Sắp xếp theo:</span>
            <select class="form-select" aria-label="Default select example" style="width: auto;">
                <option value="1">Đề cử</option>
                <option value="2">Bán chạy nhất</option>
                <option value="3">Theo giá thấp đến cao</option>
                <option value="4">Theo giá cao đến thấp</option>
                <option value="5" selected>Thêm gần đây</option>
            </select>
        </div>
        <div class="row">
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-4">
                <div class="card shadow">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0TJzZCvbinhjb-e__BLBrRXITO9KdkoNlA&s"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Sân cầu lông</h5>
                        <p class="card-text fs-5">Giá:
                            <span class="text-decoration-line-through">500.000đ</span>
                            <span>200.000đ</span>
                        </p>
                        <div class="d-flex justify-content-evenly">
                            <a href="#" class="btn btn-outline-danger">Đặt ngay</a>
                            <a href="#" class="btn btn-danger">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <!-- Footer -->
    <div class="mt-4">
        <footer class="text-center text-lg-start text-white" style="background-color: #597a94;">
            <div class="container pt-4 pb-2">
                <div class="row mt-4">
                    <div class="col-6">
                        <div class="d-flex align-items-center justify-content-center my-4">
                            <img src="https://t3.ftcdn.net/jpg/00/54/89/08/360_F_54890802_j6XIBBYEpMf9D5mTZsSrqmXmJCtT3X0d.jpg" height="70" alt="" class="rounded-circle">
                            <h1 class="px-2">Java 5</h1>
                        </div>
                        <ul class="list-unstyled d-flex flex-row justify-content-center mb-5 mt-4">
                            <li class="px-2">
                                <a class="btn text-white btn-floating m-1 d-flex justify-content-center align-items-center" style="background-color: #3b5998; width: 35px; height: 35px;" href="#!" role="button">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                            </li>
                            <li class="px-2">
                                <a class="btn text-white btn-floating m-1 d-flex justify-content-center align-items-center" style="background-color: #55acee; width: 35px; height: 35px;" href="#!" role="button">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                            <li class="px-2">
                                <a class="btn text-white btn-floating m-1 d-flex justify-content-center align-items-center" style="background-color: #ac2bac; width: 35px; height: 35px;" href="#!" role="button">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                        <div class="text-white-50 text-center">
                            <span>©2024 FPT Polytechnic</span>
                        </div>
                    </div>

                    <div class="col-3">
                        <h5 class="text-uppercase mb-4 fw-bold">Liên kết</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Sân</a>
                            </li>
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Phụ kiện</a>
                            </li>
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Tin tức</a>
                            </li>
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Dành cho chủ sân</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-3">
                        <h5 class="text-uppercase mb-4 fw-bold">Liên hệ</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Về chúng tôi</a>
                            </li>
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Chính sách bảo mật</a>
                            </li>
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Điều khoản sử dụng</a>
                            </li>
                            <li class="mb-2">
                                <a href="#!" class="text-white text-decoration-none">Hướng dẫn sử dụng</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>