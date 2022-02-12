<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<link rel="stylesheet" href="/css/giohang.css">

<!------ Include the above in your HEAD tag ---------->

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
</head>
<body>
	<div id="table-content">
		<div class="container">
			<div class="card shopping-cart">
				<div class="card-header bg-dark text-light">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ Hàng <a
						href="/product" class="btn btn-outline-info btn-sm pull-right">Tiếp
						Tục Mua Hàng</a>
					<div class="clearfix"></div>
				</div>
				<div class="card-body">
					<!-- PRODUCT -->
					<c:forEach var="chitiet" items="${gioHang.chiTietGioHang}">
						<div class="row">

							<div class="col-6 col-sm-6 col-md-2 text-center">
								<img class="img-responsive" src="${chitiet.key.image}"
									alt="prewiew" width="150" height="150">
							</div>
							<div class="col-5 ">
								<h4 class="product-name">
									<strong>${chitiet.key.name}</strong>
								</h4>
								<h4 class="product-name">
									<strong>${chitiet.key.price} {VNĐ}</strong>
								</h4>

							</div>

							<div
								class="col-9 col-sm-6 text-sm-center col-md-4 text-md-right row">

								<div class="col-6 col-sm-4 col-md-4">

									<div class="quantity">
										<c:if test="${chitiet.value >= 2}">
											<td><button onclick="truSP(event)"
													id="${chitiet.key.productId }"
													class="btn btn-outline-primary">-</button></td>
										</c:if>
										${chitiet.value}
										<c:if test="${chitiet.value <= 9}">
											<button onclick="congSP(event)"
												id="${chitiet.key.productId }"
												class="btn btn-outline-primary">+</button>
										</c:if>
									</div>
								</div>
								<div class="col-6 col-sm-6 col-md-6 text-md-right"
									style="padding-top: 5px">
									<h6>
										<strong>${chitiet.key.price * chitiet.value } {VNĐ} <span
											class="text-muted"></span></strong>
									</h6>
								</div>
								<div class="col-3 col-sm-2 col-md-2" style="">
									<button onclick="xoaSP(${chitiet.key.productId })"
										id="${chitiet.key.productId }"
										class="btn btn-outline-danger btn-xs">
										<i class="fa fa-trash" aria-hidden="true"></i>
									</button>
								</div>

							</div>


						</div>
					</c:forEach>
					<hr>

				</div>
				<div class="card-footer">
					<div class="pull-right" style="margin: 10px">
						<a href="/check-out" class="btn btn-success pull-right">Check
							Out</a>
						<div class="pull-right" style="margin: 5px">
							<c:set var="total" value="${0}" />
							<c:forEach var="article" items="${gioHang.chiTietGioHang}">
								<c:set var="total"
									value="${total + (article.value * article.key.price)}" />
							</c:forEach>

							Tổng Tiền: <b>${total} {VNĐ}</b>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
      			if (window.confirm("Do you really want to delete?")) {
					console.log("id:"+ev)
	      			let id = $(ev.target).attr('id');
	      			fetch('/xoa-san-pham/' + ev)
	      			.then(response => response.text())
	      			.then(data => {
	      				$('#table-content').html(data);
	      			});
				}
      			
      		}
      	</script>
</body>
