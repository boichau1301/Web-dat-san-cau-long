<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm nhân viên</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5 w-50">
		<h2>Thêm thông tin nhân viên</h2>

		<form:form modelAttribute="employee" action="/employee/employeeAdd" method="post">
			<div class="mb-3">
				<label for="id" class="form-label">Mã Nhân Viên</label>
				<form:input path="id" class="form-control" id="id" />
				<form:errors path="id" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="name" class="form-label">Tên nhân viên</label>
				<form:input path="name" class="form-control" id="name" />
				<form:errors path="name" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="username" class="form-label">Tên Đăng Nhập</label>
				<form:input path="username" class="form-control" id="username" />
				<form:errors path="username" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="role" class="form-label">Vai Trò</label>
				<form:select path="role" class="form-control" id="role">
					<option value="nhanVien">Nhân viên</option>
					<option value="quanLy">Quản lý</option>
				</form:select>
			</div>

			<div class="mb-3">
				<label for="password" class="form-label">Mật Khẩu</label>
				<form:input path="password" class="form-control" id="password" />
				<form:errors path="password" class="text-danger" />
			</div>

			<button type="submit" class="btn btn-primary">Thêm nhân viên</button>
			<a href="/employeeManager" type="submit" class="btn btn-outline-primary">Trở về</a>
		</form:form>

		<c:if test="${not empty message}">
			<div class="alert alert-success mt-3">${message}</div>
		</c:if>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
