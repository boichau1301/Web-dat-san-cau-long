<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Chi tiết đơn đặt sân</title>
</head>

<body>
    <div class="container bg-body-tertiary rounded py-3 px-4 shadow mt-5" style="width: 25%;">
		<c:if test="${not empty errorNotFound}">
			<div class="rounded-4 bg-danger-subtle p-3 mt-1 mb-3 text-danger">${errorNotFound}</div>
		</c:if>
		<c:if test="${empty errorNotFound}">
	        <h4 class="text-center">Chi tiết đơn đặt</h4>
	        <ul class="list-unstyled">
	            <li>Mã đơn: <span class="fw-bold">#${courtOrderDetail.id}</span></li>
	            <li>
	                <div class="text-line" style="margin: 1rem 0 5px 0;">
	                    <span class="fw-bold">Thông tin khách hàng</span>
	                    <div class="divider"></div>
	                </div>
	            </li>
	            <li>Tên người đặt: <span class="fw-bold">${courtOrderDetail.customer.name}</span></li>
	            <li>Số điện thoại: <span class="fw-bold">${courtOrderDetail.customer.phoneNumber}</span></li>
	            <li>
	                <div class="text-line" style="margin: 1rem 0 5px 0;">
	                    <span class="fw-bold">Thông tin sân</span>
	                    <div class="divider"></div>
	                </div>
	            </li>
	            <li>Tên sân: <span class="fw-bold">${courtOrderDetail.badmintoncourt.name} - ${courtOrderDetail.badmintoncourt.type}</span></li>
	            <li>Ngày: <span class="fw-bold"><fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${courtOrderDetail.date}"/></span></li>
	            <li>Khung giờ: 
	            	<span class="fw-bold">
						<fmt:formatDate type="time" pattern="HH:mm" value="${courtOrderDetail.start}"/>
						 - 
						<fmt:formatDate type="time" pattern="HH:mm" value="${courtOrderDetail.end}"/>
					</span>
				</li>
	            <li>Giá thuê sân: <span class="fw-bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${courtOrderDetail.badmintoncourt.price}"/> VND</span></li>
	            <hr>
	            <li>Tình trạng: <span class="fw-bold">${courtOrderDetail.status}</span></li>
	        </ul>
			<a href="/courtOrderManager" class="btn btn-outline-primary rounded flex-end">Trở về</a>
		</c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>