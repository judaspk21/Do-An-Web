<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="https://png.pngtree.com/png-clipart/20190614/original/pngtree-beer-vector-png-image_3727423.jpg" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
</head>
</head>
<style>
.tren {
	color: rgb(255, 187, 73);
}

.action {
	text-align: center;
}

.btnss {
	margin-right: 20px;
	width: 50px;
}

.bg {
	margin-top: 10px;
}

.sugar {
	border: 1px solid red;
}

.themsp:hover {
	background-color: rgb(255, 187, 73);
	transition: 1s;
}

.toolbar {
	width: 150px;
}

.xxx {
	margin-left: 15px;
}
</style>

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
								href="/category/insert">Thêm Danh Mục</a></li>
						</ul>

						<div class="container">
							<hr class="sugar"></hr>
							<div class="row">
								<div class="col-md-3 ">
									<div class="toolbar">
										<select class="form-control">
											<option value="">Export Basic</option>
											<option value="all">Export All</option>
											<option value="selected">Export Selected</option>
										</select>

									</div>
								</div>
								<div class="col-md-3 "></div>							
								<div class="col-md-6  ">
									<div class="input-group" id="adv-search">
										<input type="text" class="form-control"
											placeholder="Hôm nay bạn tìm gì......" />
										<button type="button" class="btn btn-primary"><i class="fas fa-search"></i></button>
									</div>
								</div>
							</div>
							<hr class="sugar"></hr>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th class="tren" scope="col">#</th>
										<th class="tren" scope="col">Name</th>
										<th class="tren" scope="col"></th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="category" items="${cate}">
										<tr>
											<th scope="row">${category.categogyId}</th>
											<td>${category.name}</td>
											<td class="action"><a
												href="/category/edit?cId=${category.categogyId}">
													<button type="button" class="btnss btn btn-success">
														<i class="fas fa-edit"></i>
													</button>
											</a> <a href="/category/delete?cId=${category.categogyId}">
													<button type="button" class="btnss btn btn-danger">
														<i class="far fa-trash-alt"></i>
													</button>
											</a></td>


										</tr>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>