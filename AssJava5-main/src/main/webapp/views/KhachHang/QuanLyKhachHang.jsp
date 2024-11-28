<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<title>Quản lý thông tin khách hàng</title>
	<style type="text/css">
		/* Các kiểu CSS giữ nguyên từ mã trước */
	</style>
</head>

<body>
	<div class="row w-100 h-100 min-vh-100">
		<div class="col-2 sticky-top">
			<!-- Menu bên trái giống như trang trước -->
			<!-- ... -->
		</div>
		<div class="col-10 py-3">
			<h3 class="ms-5">Quản lý thông tin khách hàng</h3>
			<hr>
			<!-- Thông tin chi tiết khách hàng -->
			<div class="rounded px-5 mt-2">
				<form action="" method="post" modelAttribute="khachHang" class="row">
					<div class="col-6">
						<div class="row mb-3">
							<label for="maKhachHang" class="col-3 col-form-label fw-bold">Mã khách hàng</label>
							<div class="col-9">
								<input type="text" class="form-control" id="maKhachHang" name="maKhachHang" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="tenKhachHang" class="col-3 col-form-label fw-bold">Tên khách hàng</label>
							<div class="col-9">
								<input type="text" class="form-control" id="tenKhachHang" name="tenKhachHang" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="diaChi" class="col-3 col-form-label fw-bold">Địa chỉ</label>
							<div class="col-9">
								<input type="text" class="form-control" id="diaChi" name="diaChi" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="soDienThoai" class="col-3 col-form-label fw-bold">Số điện thoại</label>
							<div class="col-9">
								<input type="text" class="form-control" id="soDienThoai" name="soDienThoai" />
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="row mb-3">
							<label for="email" class="col-3 col-form-label fw-bold">Email</label>
							<div class="col-9">
								<input type="email" class="form-control" id="email" name="email" />
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-success text-white fw-bold rounded-3">Thêm</button>
							<button type="button" class="btn btn-warning text-white fw-bold rounded-3 ms-2">Cập nhật</button>
							<button type="button" class="btn btn-danger text-white fw-bold rounded-3 ms-2">Xóa</button>
							<a href="/" class="btn btn-secondary text-white fw-bold rounded-3 ms-2">Quay lại trang chủ</a>
						</div>
					</div>
				</form>
			</div>
			<!-- Tìm kiếm -->
			<div class="row px-5 my-3">
				<form action="" class="col-5 row">
					<label for="timTenKhachHang" class="col-3 col-form-label fw-bold">Tên khách hàng</label>
					<div class="col-9">
						<div class="input-group">
							<input type="text" class="form-control" id="timTenKhachHang" name="timTenKhachHang" />
							<button class="btn btn-outline-success">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<hr>
			<!-- Danh sách khách hàng -->
			<div class="px-5 overflow-auto table-responsive" style="height: 282px; scrollbar-width: thin;">
				<table class="table align-middle mb-0 bg-white table-sticky">
					<thead class="bg-light">
						<tr>
							<th>STT</th>
							<th>Mã khách hàng</th>
							<th>Tên khách hàng</th>
							<th>Địa chỉ</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<!-- Vòng lặp để hiển thị danh sách khách hàng -->
						<c:forEach items="${danhSachKhachHang}" var="khachHang">
							<tr onclick="fillCustomerDetails('${khachHang.maKhachHang}', '${khachHang.tenKhachHang}', '${khachHang.diaChi}', '${khachHang.soDienThoai}', '${khachHang.email}')">
								<td>${loop.index + 1}</td>
								<td>${khachHang.maKhachHang}</td>
								<td>${khachHang.tenKhachHang}</td>
								<td>${khachHang.diaChi}</td>
								<td>${khachHang.soDienThoai}</td>
								<td>${khachHang.email}</td>
								<td>
									<button class="btn btn-outline-primary btn-icon-circle" onclick="editCustomer('${khachHang.maKhachHang}')">
										<i class="fa-regular fa-pen-to-square"></i>
									</button>
									<button class="btn btn-outline-danger btn-icon-circle" onclick="deleteCustomer('${khachHang.maKhachHang}')">
										<i class="fa-regular fa-trash-can"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
		function fillCustomerDetails(maKhachHang, tenKhachHang, diaChi, soDienThoai, email) {
			document.getElementById("maKhachHang").value = maKhachHang;
			document.getElementById("tenKhachHang").value = tenKhachHang;
			document.getElementById("diaChi").value = diaChi;
			document.getElementById("soDienThoai").value = soDienThoai;
			document.getElementById("email").value = email;
		}

		function editCustomer(maKhachHang) {
			// Logic to edit customer
		}

		function deleteCustomer(maKhachHang) {
			// Logic to delete customer
		}
	</script>
</body>

</html>
