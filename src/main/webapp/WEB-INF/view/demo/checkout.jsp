<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap')
	;

.fas {
	margin-right: 10px;
}

.thanh-toan {
	box-shadow: 0 4px 6px 5px #00000029;
}

h2, h4 {
	color: rgb(234, 128, 37);
}

.fas {
	color: rgb(234, 128, 37);
}

label {
	font-size: 18px;
	font-family: 'Open Sans', sans-serif;
	color: rgb(234, 128, 37);
}
</style>
</head>
</head>
<body>
<c:import url="/WEB-INF/view/admin/menu.jsp" />
	<div class="container">
		<div class=" text-center">
			<h2>Thoong tin thanh toán</h2>
		</div>
		<div class="thanh-toan row">
			<div class="gio-hang col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					Giỏ hàng của bạn</h4>

				<ul class="list-group mb-3">
					<c:forEach var="product" items="${cart.chiTietGioHang}">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">${product.key.name}</h6>
								<small class="text-muted"><img alt=""
									src="${product.key.image}" style="width: 100px; height: 100px"></small>
							</div>
							<div>
								<span class="text-muted">${product.key.price}</span> <br> <span
									class="text-muted">Số Lượng: ${product.value} </span>
								<c:set var="total" value="${0 }" />
								<c:forEach var="cart" items="${cart.chiTietGioHang}">
									<c:set var="total"
										value="${total + (cart.value * cart.key.price)}" />
								</c:forEach>
							</div>

						</li>
						<li class="list-group-item d-flex justify-content-between">
					</c:forEach>
				</ul>
				<li class="list-group-item d-flex justify-content-between"><span>Tổng
						cộng</span> <strong>${total} {VNĐ}</strong></li>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Địa chỉ thanh toán</h4>
				<form:form class="needs-validation" action="check-out" method="post"
					modelAttribute="order">

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="lastName"><i class="fas fa-user"></i>Họ và
								tên :</label>
							<form:input type="text" class="form-control" path="name"
								placeholder="Họ và tên..." value="${name }"></form:input>
							<form:errors path="name"
								cssStyle="color:red;margin-left: 10px;font-style: italic;"></form:errors>
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label path="phone"><i class="fas fa-mobile"></i>Số điện
								thoại :</label>
							<form:input type="text" class="form-control" path="phone"
								placeholder="Số điện thoại..." value="${phone}"></form:input>
							<form:errors path="phone"
								cssStyle="color:red;margin-left: 10px;font-style: italic;"></form:errors>
							<div class="invalid-feedback">Valid last name is required.
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="email"><i class="fas fa-envelope"></i>Email :</label>
						<form:input type="text" class="form-control" path="email"
							placeholder="Nhập email..." value="${email}"></form:input>
						<form:errors path="email"
							cssStyle="color:red;margin-left: 10px;font-style: italic;"></form:errors>
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="mb-3">
						<label for="address"><i class="fas fa-location-arrow"></i>Địa
							chỉ :</label> 
							<form:input type="text" class="form-control" path="address"
							placeholder="Địa chỉ nhận hàng..." value="${address}"></form:input>
							<form:errors path="address"
							cssStyle="color:red;margin-left: 10px;font-style: italic;"></form:errors>
						<div class="invalid-feedback">Please enter your shipping
							address.</div> 					
					</div>

					<div class="mb-3">
						<label for="address2"><i class="fas fa-sticky-note"></i>Ghi
							chú : </label>
						<textarea name="description" class="form-control"
							placeholder="mô tả sản phẩm" id="pwd"></textarea>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">Thanh
						Toán</button>
				</form:form>
			</div>
		</div>
	</div>
	<script>
		CKEDITOR.replace('description');
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
      		$('button.close').click(function () {
      			$(this).parent().css("display", "none");
      		});
      		$('button.mo-gio-hang').click(function() {
      			$('div.gio-hang').css("display", "block");
      			fetch('/gio-hang')
      			.then(response => response.text())
      			.then(data => {
      				$('#table-content').html(data);
      			});
      		});
      		function truSP(ev) {
      			
      			console.log("124"+ev)
      			let id = $(ev.target).attr('id');
      			fetch('/tru-san-pham/' + id)
      			.then(response => response.text())
      			.then(data => {
      				$('#table-content').html(data);
      			});
      		}
      		function congSP(ev) {
      			console.log("124"+ev)
      			let id = $(ev.target).attr('id');
      			fetch('/them-vao-gio/' + id)
      			.then(response => response.text())
      			.then(data => {
      				$('#table-content').html(data);
      			});
      		}
      		
      		function xoaSP(ev) {
      			console.log("id:"+ev)
      			let id = $(ev.target).attr('id');
      			fetch('/xoa-san-pham/' + ev)
      			.then(response => response.text())
      			.then(data => {
      				$('#table-content').html(data);
      			});
      		}
      	</script>

</body>
</html>