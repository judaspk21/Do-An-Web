<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="https://png.pngtree.com/png-clipart/20190614/original/pngtree-beer-vector-png-image_3727423.jpg" />
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
	<div class="bb container-fluid">
		<div class="row">
			<div class="col-12 col-sm-2">
				<div class="card bg-light mb-2 ">
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
					<div class="container-fluid">
						<div class="col-9 col-md-6 col-lg-9 "
							style="box-shadow: 0 5px 10px rgba(0, 0, 0, 0.20)">
							<form:form action="#" method="post" modelAttribute="product">
								<div class="form-group">
									<label for="name"></label>
									<form:input path="productId" type="hidden" class="form-control"
										placeholder="tên sản phẩm"></form:input>
								</div>
								<div class="form-group">
									<label for="name">Tên Sản Phẩm</label>
									<form:input path="name" type="text" class="form-control"
										placeholder="tên sản phẩm" id="email"></form:input>
									<form:errors path="name" cssStyle="color:red" />
								</div>
								<div class="form-group">
									<label for="name">Danh Mục </label>
									<form:select path="category.categogyId" class="custom-select"
										itemValue="categogyId" itemLabel="name" items="${categories}" />
								</div>
								<div class="form-group">
									<label for="name">Giá Sản Phẩm</label>
									<form:input path="price" type="text" class="form-control"
										placeholder="giá sản phẩm"></form:input>
									<form:errors path="price" cssStyle="color:red" />
								</div>
								<div class="form-group">
									<label for="pwd">Mô tả</label>
									<form:textarea path="description" class="form-control"
										placeholder="mô tả sản phẩm"></form:textarea>
									<form:errors path="description" cssStyle="color:red" />
								</div>
								<div class="form-group">
									<%-- <label for="pwd">Hình Ảnh</label>
									<form:input path="image" type="text" class="form-control"
										placeholder="tên sản phẩm" id="email"></form:input>
										<form:errors path="image" cssStyle="color:red" /> --%>
									<!-- upload image -->
									<div>
										<input type="file" class="upload" id="${editProp.prop}_file"
											accept="image/*">
										<form:input path="image" placeholder="Hình ảnh"
											type="hidden" cssClass="form-control" id="pictureInput" />
										<form:errors path="image" cssClass="small text-danger" />
										<img src="${product.image}" style="width: 25%" />
									</div>
									<!-- upload image -->
								</div>
								<div class="form-group">
									<button type="submit" value="gửi" class="btn btn-success">Sửa</button>
								</div>
							</form:form>
							<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$('.upload').change(function() {
	    uploadFile(this);
	});

	uploadFile = async (fileInput) => {
	    let formData = new FormData()
	    formData.append('file', fileInput.files[0]);
	    let uploadOption = {
	        method: 'POST',
	        body: formData
	    };
	    try {
	        let response = await fetch('/upload', uploadOption);
	        if (response.ok) {
	            let uploadResult = await response.json();
	            if (uploadResult.uploaded) {
		            $(fileInput).next().val(uploadResult.url);
		            $(fileInput).prev().val(uploadResult.url);
		            let $img =  $(fileInput).next().next();
		            if ($img.length > 0) {
		                $img.attr('src', uploadResult.url);
		            }
		        } else {
		            alert(uploadResult.messsage);
		        }
	        } else {
	            let error = await response.json();
	            alert(error);
	        }
	    } catch(error) {
	        alert(error);
	    }
	}
	</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		CKEDITOR.replace('description');
		CKEDITOR.replace('contact');
	</script>
</body>
</html>