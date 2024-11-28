<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html xmlns:form="http://www.springframework.org/tags/form">
<head>
    <meta charset="UTF-8">
    <title>Customer Info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Customer Information</h2>
        <!-- Form hiển thị thông tin khách hàng -->
        <form:form modelAttribute="customer" class="row g-3" enctype="multipart/form-data">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label"><strong>Name:</strong></label>
                            <form:input path="name" class="form-control" readonly="true" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>Email:</strong></label>
                            <form:input path="email" class="form-control"  />
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>Phone:</strong></label>
                            <form:input path="phoneNumber" class="form-control"  />
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>Address:</strong></label>
                            <form:input path="address" class="form-control"  />
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>Username:</strong></label>
                            <form:input path="username" class="form-control" readonly="true" />
                        </div>
                    </div>
                </div>
                 <div class="mt-3">
                    <a href="/customer/edit/${customer.id}" class="btn btn-primary">Sửa thông tin</a>
                </div>
            </div>
        </form:form>

        <!-- Lịch sử mua hàng -->
        <h3 class="mt-4">Order History</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${customer.orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy" /></td>
                        <td>${order.totalAmount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
