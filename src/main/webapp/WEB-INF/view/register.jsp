<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Kí</title>
<link rel="stylesheet" href="/css/signup.css">
</head>
<body>
 <div class="header">
    <div class="inner-header flex">    
      <h3>ĐĂNG KÝ</h3>
    </div>
    <div>
      <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
        <defs>
          <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
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
    <form>
      <input type="hidden" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'id'" />
      <label>Tên</label>
      <input type="text" placeholder="Username" onfocus="this.placeholder = ''"
        onblur="this.placeholder = 'Username'" />
      <label>Số Điện Thoại</label>
      <input type="text" placeholder="Username" onfocus="this.placeholder = ''"
        onblur="this.placeholder = 'Số Điện Thoại'" />
      <label>Password</label>
      <input type="password" placeholder="Password" onfocus="this.placeholder = ''"
        onblur="this.placeholder = 'Password'" />
      <label>Email</label>
      <input type="text" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'email'" />
      <label>Địa Chỉ</label>
      <input type="text" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'địa chỉ'" />
      <button class="login-btn">Đăng ký</button>

    </form>
    <div class="bottom-container">
      <p>Bạn đã có tài khoản ? </p><a href="#">Đăng nhập</a>
      <div> 
</body>
</html>