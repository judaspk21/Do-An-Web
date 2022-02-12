<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>



<style>
body {
	margin: 0;
	font-family: Roboto, -apple-system, BlinkMacSystemFont, "Segoe UI",
		Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-weight: 400;
	line-height: 1.5385;
	color: #333;
	text-align: left;
	background-color: #f5f5f5
}

.mt-50 {
	margin-top: 50px
}

.mb-50 {
	margin-bottom: 50px
}

.bg-teal-400 {
	background-color: #26a69a
}

a {
	text-decoration: none !important
}

p {
	font-size: 15px;
}

h6 {
	font-size: 20px;
	text-transform: uppercase;
}

.gia {
	color: rgb(234, 128, 37);
}

.card {
	margin-top: 10px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/admin/menu.jsp" />
	<div class="container d-flex justify-content-center mt-50 mb-50">
	<div class="col-6 col-sm-3">
				<div class="card bg-light mb-3">

					<div class="card-header bg-primary text-white text-uppercase">
						<i class="fa fa-list"></i> Categories
					</div>
					<ul class="list-group category_block">
						<c:forEach var="category" items="${category}">
							<li class="list-group-item"><a href="/product">${category.name}</a></li>
						</c:forEach>
					</ul>
				</div>

			</div>
		<div class="row">
		
			<div class="col-md-12">
				<div class="card card-body">
					<div
						class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
						<div class="mr-2 mb-3 mb-lg-0">
							<img
								src="${product.image}"
								width="150" height="150" alt="">
						</div>
						<div class="media-body">
							<h6 class="media-title font-weight-semibold">
								<a href="#" data-abc="true">${product.name}</a>
							</h6>
							<p class="mb-3">${product.description}</p>
						</div>
						<div class="mt-3 mt-lg-0 ml-lg-3 text-center">
							<h3 class="gia mb-0 font-weight-semibold">${product.price} VNĐ</h3>
							<a href="/them-vao-gio/${product.productId}"><button type="button" class="btn btn-warning mt-4 text-white">
								<i class="fas fa-cart-plus"></i> Add to cart
							</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/view/admin/footer.jsp" />
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'>
		
	</script>
	<script type='text/javascript'></script>
</body>
</html>