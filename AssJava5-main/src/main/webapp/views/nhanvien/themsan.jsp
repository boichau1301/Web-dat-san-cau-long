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
<title>Thêm sân</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5 w-50">
		<h2>Thêm thông tin sân</h2>

		<form:form action="/employee/badmintonAdd" method="post" modelAttribute="court" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="name" class="form-label">Tên sân</label>
				<form:input path="name" class="form-control" />
				<form:errors path="name" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="type" class="form-label">Loại sân</label>
				<form:input path="type" class="form-control" />
				<form:errors path="type" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="price" class="form-label">Giá sân</label>
				<form:input path="price" class="form-control" type="number" />
				<form:errors path="price" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="description" class="form-label">Mô tả</label>
				<form:input path="description" class="form-control" />
				<form:errors path="description" class="text-danger" />
			</div>

			<div class="mb-3">
				<label for="address" class="form-label">Địa chỉ</label>
				<form:input path="address" class="form-control" />
				<form:errors path="address" class="text-danger" />
			</div>

			<div class="mb-3">
				<span class="form-label col-4">Hoạt động</span>
				<div class="d-flex align-items-center justify-content-between"
					style="width: 110px; padding: .375rem 0">
					<div class="form-check">
						<form:radiobutton path="availability" class="form-check-input"
							value="true" label="Yes" />
					</div>
					<div class="form-check">
						<form:radiobutton path="availability" class="form-check-input"
							value="false" label="No" />
					</div>
				</div>
				<form:errors path="availability" class="text-danger" />
			</div>
	
			<div class="mb-3">
				<label for="images" class="form-label col-4">Hình ảnh</label>
				<form:input path="images" class="form-control" type="file" multiple="true" />
				<form:errors path="images" class="text-danger" />
			</div>

			<button type="submit" class="btn btn-primary">Thêm sân</button>
			<a href="/badmintonManager" type="submit" class="btn btn-outline-primary">Trở về</a>
		</form:form>

		<c:if test="${not empty message}">
			<div class="alert alert-success mt-3">${message}</div>
		</c:if>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
