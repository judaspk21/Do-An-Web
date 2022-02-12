<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="https://png.pngtree.com/png-clipart/20190614/original/pngtree-beer-vector-png-image_3727423.jpg" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
</head>
<style>
.bb {
	margin-top: 10px;
}
</style>
<body>
	<c:import url="/WEB-INF/view/admin/menu.jsp" />
	<div class="bb container">
		<div class="row">
			<div class="col-12 col-sm-3">
				<div class="card bg-light mb-3">
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
					<div class="container">
						<div class=" col-md-6 col-lg-12" style="box-shadow: 0 5px 10px rgba(0, 0, 0, 0.20)">
							<form:form action="#" method="post"
								modelAttribute="category">
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-4">
										<form:input class="form-control" type="hidden"  
											path="categogyId"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Tên Danh Mục</label>
									<div class="col-sm-4">
										<form:input class="form-control" type="text" path="name"
											placeholder="Nhập Tên Danh Mục"></form:input>
											<form:errors path="name" cssStyle="color:red" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" value="gửi" class="btn btn-success">Sửa</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>