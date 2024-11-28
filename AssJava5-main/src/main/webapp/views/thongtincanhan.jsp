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
    <link rel="stylesheet" href="css/style.css">
    <title>Thông tin cá nhân</title>
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
                        <a class="nav-link" href="index">Trang chủ</a>
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
                        <a class="nav-link position-relative" href="giohang">
                            <i class="fa-solid fa-cart-shopping fa-xl"></i>
                            <span class="position-absolute top-10 start-100 translate-middle badge rounded-pill bg-danger">99
                                <span class="visually-hidden">số lượng</span>
                            </span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-center">
                            <a href="#"
                                class="d-flex align-items-center link-body-emphasis text-decoration-none"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2 img-fluid">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end text-small shadow">
                                <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                                <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="bg-body-tertiary rounded px-3 pb-5 pt-3 shadow mx-auto" style="width: 60%;">
            <a href="" class="d-block text-end w-100 text-decoration-none py-1">Chỉnh sửa thông tin</a>
            <form action="">
                <div class="row">
                    <div class="col-5 d-flex justify-content-center align-items-center">
                        <img src="https://img.freepik.com/premium-vector/badminton-player-match-illustration_9245-796.jpg" alt="" width="250" height="250" class="rounded-circle img-fluid">
                    </div>
                    <div class="col-7 my-auto">
                        <div class="row mb-3">
                            <label for="sdtUser" class="col-3 col-form-label fw-bold pe-0">Số điện thoại</label>
                            <div class="col-9">
                                <input type="text" class="form-control" id="sdtUser" name="sdtUser" value="0123456789" disabled>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="emailUser" class="col-3 col-form-label fw-bold pe-0">Email</label>
                            <div class="col-9">
                                <input type="email" class="form-control" id="emailUser" name="emailUser">
                            </div>
                        </div>
                        <div class="row">
                            <label for="diaChiUser" class="col-3 col-form-label fw-bold pe-0">Địa chỉ</label>
                            <div class="col-9">
                                <input type="email" class="form-control" id="diaChiUser" name="diaChiUser">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <h4 class="mt-5 mb-2">Lịch sử đặt sân</h4>
        <div class="overflow-auto table-responsive rounded" style="height: 376px; scrollbar-width: thin;">
            <table class="table align-middle mb-0 bg-white table-sticky">
                <thead class="bg-light">
                    <tr>
                        <th>STT</th>
                        <th>Tên sân</th>
                        <th>Địa chỉ</th>
                        <th>Ngày đặt</th>
                        <th>Giờ đặt</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Sân cầu lông</td>
                        <td>215 Nguyễn Văn Cừ, P4, Quận 1</td>
                        <td>25/09</td>
                        <td>18h00 - 19h00</td>
                        <td><span class="badge text-bg-success rounded-pill">Hoạt động</span></td>
                        <td>
                            <div class="d-flex justify-content-between" style="width: 90px;">
                                <button class="btn btn-outline-primary border-0 btn-icon-circle">
                                    <i class="fa-solid fa-eye"></i>
                                </button>
                                <button class="btn btn-outline-danger border-0 btn-icon-circle">
                                    <i class="fa-regular fa-trash-can"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
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