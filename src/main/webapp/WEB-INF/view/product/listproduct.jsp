
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html>
<html lang="en">
<head>
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


<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap')
	;

.iamgess {
	width: 150px;
	height: 150px;
}

.idsp {
	font-size: 16px;
	font-family: 'Bebas Neue',
}

.danhmuc {
	font-size: 18px;
	font-family: 'Bebas Neue',
}

.title {
	font-size: 20px;
	text-transform: uppercase;
}

.description {
	font-size: 16px;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.price {
	font-size: 16px;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin-top: 20%;
}

.eitbtn {
	margin-top: 20%;
	margin-right: 20px;
	width: 45px;
	height: 45px;
}

.btnpage {
	margin-right: 10px;
}

.bg {
	margin-top: 10px;
}

.sugar {
	border: 1px solid red;
}

.toolbar {
	width: 150px;
	margin-right: 30px;
}

.themsp:hover {
	background-color: rgb(255, 187, 73);
	transition: 1s;
}

.page-item {
	margin-right: 10px;
}

.active {
	color: red;
}

.xxx {
	margin-left: 15px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/view/admin/menuadmin.jsp" /> 

	<div class="bg container-fluid">
		<div class="row">
			<div class="col-12 col-sm-2">
				<div class="card bg-light mb-2">
					<div class="card-header bg-primary text-white text-uppercase">
						<i class="fa fa-list"></i> DANH MỤC
					</div>
					<ul class="list-group category_block">
						<li class="list-group-item"><a href="/product/listproduct">Sản
								Phẩm</a></li>
						<li class="list-group-item"><a href="/category/listcategory">Loại
								Sản Phẩm</a></li>
						<li class="list-group-item"><a href="/account/listuser">Người
								Dùng</a></li>
					</ul>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-12 col-md-6 col-lg-9">
						<ul class="xxx nav nav-pills" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="pill" href="#home">Danh Sách</a></li>
							<li class="nav-item"><a class="themsp nav-link "
								href="/product/insert">Thêm Danh Mục</a></li>
						</ul>

						<div class="container">
							<hr class="sugar"></hr>
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<form action="listproduct">
										<div class="input-group" id="adv-search">
											<sf:form modelAttribute="searchForm" acion="test"
												method="get">
												<sf:input type="text" class="ttt form-control"
													placeholder="Hôm nay bạn tìm gì......" path="ten" />

												<sf:input type="hidden" class="ttt form-control"
													placeholder="Hôm nay bạn tìm gì......" path="thuTu"
													id="thuTuInput" />
												<sf:input type="hidden" class="ttt form-control"
													placeholder="Hôm nay bạn tìm gì......" path="trang"
													id="trangInput" />

												<sf:select path="xepTheo" items="${orders}"
													itemLabel="value" itemValue="key" id="xepTheoInput">
												</sf:select>
												<button type="submit" class="btn4 btn btn-primary"
													value="Tìm kiếm" id="searchBt">
													<i class="fas fa-search"></i>
												</button>
											</sf:form>
										</div>
									</form>
								</div>
							</div>
							<hr class="sugar"></hr>
							<table class="table table-hover table-condensed"
								style="box-shadow: 0 5px 10px rgba(0, 0, 0, 0.20)">
								<thead>
									<tr class="danhmuc">
										<th style="width: 3%; color: rgb(255, 187, 73)">#</th>
										<th style="width: 10%; color: rgb(255, 187, 73)">HÌNH ẢNH
										</th>
										<th style="width: 50%; color: rgb(255, 187, 73)">TÊN SẢN
											PHẨM</th>
										<th style="width: 20%; color: rgb(255, 187, 73)">GIÁ</th>
										<th style="width: 20%; color: rgb(255, 187, 73)"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${product}">
										<tr>
											<td data-th="Quantity">
												<p class="idsp">${product.productId}</p>
											</td>
											<td data-th="img"><img class="iamgess" src="${product.image}" alt=""></td>
											<td data-th="Product">
												<div class="row">
													<div class="col-sm-12">
														<h4 class="title">${product.name}</h4>
														<p class="description">${product.description}</p>
													</div>
												</div>
											</td>

											<td data-th="Price">
												<p class="price">${product.price}VNĐ</p>
											</td>
											<td class="actions" data-th=""><a
												href="/product/edit?cId=${product.productId}">
													<button type="button" class="eitbtn btn btn-success">
														<i class="fas fa-edit"></i>
													</button>
											</a> <a >
													<button type="button" class="eitbtn btn btn-danger"
														onclick="confirmDelete(${product.productId})">
														<i class="far fa-trash-alt"></i>
													</button>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">

									<c:if test="${maxPage >0 }">
										<c:forEach var="pageIndex" begin="0" end="${maxPage - 1}">
											<%-- <li class="page-item"><a class="page-link"
												href="/product/listproduct?pageIndex=${pageIndex}">${pageIndex + 1}</a></li> --%>
											<button trang="${pageIndex}"
												class="btnpage btn trang<c:if test="${pageIndex == searchForm.trang}"> active</c:if>">
												${pageIndex + 1}</button>
										</c:forEach>

									</c:if>


								</ul>
							</nav>
						</div>
						<script type="text/javascript"
							src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
						<script type="text/javascript">
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
							function confirmDelete(productId) {
								if (window.confirm("Do you really want to delete?")) {
									window.location.assign("/product/delete?cId="+productId)
	
								}
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>