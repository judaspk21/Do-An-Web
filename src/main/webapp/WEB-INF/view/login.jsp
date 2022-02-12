<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">

<title>Đăng Kí</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="/css/login.css">
	<link rel="shortcut icon" href="https://png.pngtree.com/png-clipart/20190614/original/pngtree-beer-vector-png-image_3727423.jpg" />
</head>
<body>
	<div class="header">	
		<div class="inner-header flex">		
			<h3>ĐĂNG NHẬP</h3>
		</div>	
		<div>
			<svg class="waves" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28"
				preserveAspectRatio="none" shape-rendering="auto">
<defs>
<path id="gentle-wave"
					d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
</defs>
<g class="parallax">
<use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
<use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
</g>
</svg>
		</div>		
	</div>
	<div class="content flex">
		<form:form action="/login?cartStatus=${cartStatus}" method="POST"
			modelAttribute="login">
			<input type="text" placeholder="Username"
				onfocus="this.placeholder = ''"
				onblur="this.placeholder = 'Username'" value="${login.getPhone()}"
				path="phone" name="phone" placeholder="Số điện thoại..." />
			<input type="password" placeholder="Password"
				onfocus="this.placeholder = ''"
				onblur="this.placeholder = 'Password'" path="passWord"
				name="passWord" placeholder="Mật khẩu..." />
			<button class="login-btn" type="submit" value="Đăng nhập">Login</button>
		</form:form>
		<div class="bottom-container">
			<p class="ss">
				Bạn chưa có tài khoản? <a class="dangki" href="/register?cartStatus=${cartStatus }">Đăng
					ký</a>
			</p>
			<div>
</body>
</html>