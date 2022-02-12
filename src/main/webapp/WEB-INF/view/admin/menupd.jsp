<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css">

<link rel="stylesheet" href="/css/adminpd.css">
<%--   <script src="<c:url value="/static/js/main.js" />"></script> --%>
<!-- <script src="js/script.js"></script> -->
<script type="text/javascript" src="css/js/test.js"></script>


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- partial:index.partial.html -->
	<nav class="menu">
		<div class="navbar">
			<i class="bx bx-menu"></i>
			<div class="logo">
				<a href="/index">1972 SINCE-BEER</a>
			</div>
			<div class="nav-links">
				<div class="sidebar-logo">
					<span class="logo-name">Logo</span> <i class="bx bx-x"></i>
				</div>
				<ul class="links">
					<li><a href="/index"><s:message code="lo.index.home" /></a></li>
					<li><a href="/product"><s:message code="lo.index.product" /></a>
						<!-- <i class="bx bxs-chevron-down htmlcss-arrow arrow "></i>  --><!-- <ul class="htmlCss-sub-menu sub-menu">
							<li><a href="#">Web Design</a></li>
							<li><a href="#">Login Forms</a></li>
							<li><a href="#">Card Design</a></li>
							<li class="more"><span><a href="#">More</a> <i
									class="bx bxs-chevron-right arrow more-arrow"></i> </span>
								<ul class="more-sub-menu sub-menu">
									<li><a href="#">Neumorphism</a></li>
									<li><a href="#">Pre-loader</a></li>
									<li><a href="#">Glassmorphism</a></li>
								</ul></li>
						</ul> --></li>
					<!-- <li><a href="#">CÂU CHUYỆN THƯƠNG HIỆU</a> <i
						class="bx bxs-chevron-down js-arrow arrow "></i>
						<ul class="js-sub-menu sub-menu">
							<li><a href="#">Dynamic Clock</a></li>
							<li><a href="#">Form Validation</a></li>
							<li><a href="#">Card Slider</a></li>
							<li><a href="#">Complete Website</a></li>
						</ul></li> -->
					<li><a href="/admin/dashboard"><s:message code="lo.index.dashboard" /></a></li>
					<li><a href="#"><i class="fas fa-globe-asia"></i></a><i
						class="bx bxs-chevron-down js-arrow arrow "></i>
						<ul class="js-sub-menu sub-menu">
							<li><img class="flag" src="/img/vietnam.png" alt=""><a
								href="${requestScope['javax.servlet.forward.request_uri']}?lang=vn"><s:message
										code="lo.index.vi" /></a></li>
							<li><img class="flag" src="/img/united-states.png" alt=""><a
								href="${requestScope['javax.servlet.forward.request_uri']}?lang=en">
									<s:message code="lo.index.en" />
							</a></li>
						</ul></li>
					<li><a href="#"><i class="far fa-user"></i></a><i
						class="bx bxs-chevron-down js-arrow arrow "></i>
						<ul class="js-sub-menu sub-menu">
							<li><a href="/login?cartStatus=${cartStatus}"
								class="loginn">
									<button class="btn" name="action" value="logout">
										<i class="mvp fas fa-sign-in-alt"></i>
									</button>
							</a></li>
							<li>
								<form action="/logout" method="post">
									<a><button class="btn" name="action" value="logout">
											<i class="mvp fas fa-sign-out-alt"></i>
										</button></a>
								</form>
							</li>
						</ul></li>
						<li><a href="#">${username}</a></li>
				</ul>
			</div>
			<div class="nav-links">
				<sf:form action="product" modelAttribute="searchForm" method="get">
					<div class="input-group" id="adv-search">

						<sf:input type="text" class="ttt form-control"
							placeholder="Hôm nay bạn tìm gì......" path="ten" />

						<sf:input type="hidden" class="ttt form-control"
							placeholder="Hôm nay bạn tìm gì......" path="thuTu"
							id="thuTuInput" />
						<sf:input type="hidden" class="ttt form-control"
							placeholder="Hôm nay bạn tìm gì......" path="trang"
							id="trangInput" />
						<button type="submit" class="btn4 btn btn-primary"
							value="Tìm kiếm" id="searchBt">
							<i class="fas fa-search"></i>
						</button>

					</div>
				</sf:form>
			</div>

		</div>

	</nav>
	<!-- partial -->



</body>
</html>