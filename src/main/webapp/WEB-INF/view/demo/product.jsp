<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="https://png.pngtree.com/png-clipart/20190614/original/pngtree-beer-vector-png-image_3727423.jpg" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="icon" href="/img/icon.ico" type="image/x-icon">
<style type="text/css">
.pd{
margin-top: 10px;
margin-bottom: 10px;
}


</style>
<title>Product</title>
</head>
<body>
	<c:import url="/WEB-INF/view/admin/menupd.jsp" />
	<c:import url="/WEB-INF/view/admin/slider.jsp" />
	<div class="container">
		<div class="pd row">
			<div class="col-12 col-sm-3">
				<div class="card bg-light mb-3">

					<div class="card-header bg-primary text-white text-uppercase">
						<i class="fa fa-list"></i> Categories
					</div>
					<ul class="list-group category_block">
						<c:forEach var="category" items="${category}">
							<li class="list-group-item"><a href="#">${category.name}</a></li>
						</c:forEach>
					</ul>
				</div>

			</div>

			<div class="col">
				<div class="row">
					<c:forEach var="product" items="${product}">
						<div class="col-12 col-md-6 col-lg-4">
							<div class="card">
								<a href="/ctsp?cId=${product.productId}"> <img
									class="card-img-top" src="${product.image}"
									alt="Card image cap">
								</a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="product.html" title="View Product">${product.name}</a>
									</h4>
									<p class="card-text">${product.description}</p>
									<p style="text-align: center">${product.price}VNĐ</p>
									<div class="row">
										<div class="col">
											<a href="/them-vao-gio/${product.productId}"
												class="btn btn-success btn-block">Add Cart</a>

										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/view/admin/footer.jsp" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		// sidebar open close js code
		let navLinks = document.querySelector(".nav-links");
		let menuOpenBtn = document.querySelector(".navbar .bx-menu");
		let menuCloseBtn = document.querySelector(".nav-links .bx-x");
		menuOpenBtn.onclick = function() {
			navLinks.style.left = "0";
		}
		menuCloseBtn.onclick = function() {
			navLinks.style.left = "-100%";
		}

		// sidebar submenu open close js code
		let htmlcssArrow = document.querySelector(".htmlcss-arrow");
		htmlcssArrow.onclick = function() {
			navLinks.classList.toggle("show1");
		}
		let moreArrow = document.querySelector(".more-arrow");
		moreArrow.onclick = function() {
			navLinks.classList.toggle("show2");
		}
		let jsArrow = document.querySelector(".js-arrow");
		jsArrow.onclick = function() {
			navLinks.classList.toggle("show3");
		}

		$('#searchBt').click(function() {
			$('form #xepTheoInput').val("productId");
			$('form #thutuInput').val(true);
			$('form #trangInput').val(0);
			$('form').submit();
		});
		$('.trang').click(function() {
			var trang = $(this).attr('trang');
			$('form #trangInput').val(trang);
			$('form').submit();
		});
		$('.xep').click(function() {
			var xepTheo = $(this).attr('xepTheo');
			var xepTheoInput = $('form #xepTheoInput');
			var thutuInput = $('form #thuTuInput');
			// kiểm tra nếu xếp theo bằng giá trị xếp theo đã nhập
			// thì thay đổi thứ tự
			if (xepTheo == xepTheoInput.val()) {
				if (thutuInput.val() == 'true') {
					thutuInput.val(false);
				} else {
					thutuInput.val(true);
				}
			} else {
				// gán giá trị thứ tự thành tăng dần
				thutuInput.val(true);
				// gán giá trị xếp theo cho input
				xepTheoInput.val(xepTheo);
			}
			// đặt giá trị trang về 0
			$('form #trangInput').val(0);
			$('form').submit();
		});
		$('#xepTheoInput').change(function() {
			$('form').submit();
		});
	</script>
</body>
</html>