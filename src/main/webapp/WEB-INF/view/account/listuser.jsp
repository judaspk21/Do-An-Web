<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
<!------ Include the above in your HEAD tag ---------->

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
</head>

<style type="text/css">
.tren {
	color: rgb(255, 187, 73);
}

.action {
	text-align: center;
}

.btn {
	margin-right: 20px;
}
.bg {
	margin-top: 10px;
}
</style>
<body>
	<c:import url="/WEB-INF/view/admin/menu.jsp" />
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
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th class="tren" scope="col">ID</th>
									<th class="tren" scope="col">UseName</th>
									<th class="tren" scope="col">Password</th>
									<th class="tren" scope="col">Role</th>									
									<th class="tren" scope="col"></th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Bootstrap 4 CDN and Starter Template</td>
									<td>Cristina</td>
									<td>2.846</td>
									<td class="action">
										<button type="button" class="btn btn-success">
											<i class="fas fa-edit"></i>
										</button>
										<button type="button" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button>
									</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Bootstrap Grid 4 Tutorial and Examples</td>
									<td>Cristina</td>
									<td>2.846</td>
									<td class="action">
										<button type="button" class="btn btn-success">
											<i class="fas fa-edit"></i>
										</button>
										<button type="button" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button>
									</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Bootstrap Flexbox Tutorial and Examples</td>
									<td>Cristina</td>
									<td>2.846</td>
									<td class="action">
										<button type="button" class="btn btn-success">
											<i class="fas fa-edit"></i>
										</button>
										<button type="button" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button>
									</td>
								</tr>
						</table>
					</div>
				</div>

			</div>
		</div>
</body>
</html>