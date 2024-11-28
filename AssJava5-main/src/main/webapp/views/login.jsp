<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>Please Log In</h1>
		<div c:if="${param.error}">
			Invalid username and password.</div>
		<div c:if="${param.logout}">
			You have been logged out.</div>
		<form action="/login" method="post">
			<div>
			<input type="text" name="username" placeholder="Username"/>
			</div>
			<div>
			<input type="password" name="password" placeholder="Password"/>
			</div>
			<input type="submit" value="Log in"/>
		</form>
	</body>
</html>