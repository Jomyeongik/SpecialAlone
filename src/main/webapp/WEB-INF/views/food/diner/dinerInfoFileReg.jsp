<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천식당 이미지등록</title>
<link rel="stylesheet" href="/resources/css/common/footer.css">
<link rel="stylesheet" href="/resources/css/common/header.css">
<link rel="stylesheet" href="/resources/css/common/reset.css">
<link rel="stylesheet"
	href="/resources/css/food/diner/dinerMenuReg.css">
</head>
<body>
	<div class="container">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<!-- main -->
		<main>
			<section>
				<h1>추천식당 이미지등록</h1>
				<br>
				<hr>
				<br> <br> <br>
				<form action="/diner/infofileregister.do" method="POST"
					enctype="multipart/form-data">
					<input type="submit" value="파일등록"> <br> <br> <br>
					<input type="file" id="image" name="imagename1"/>
					<div id="image_container1" class="image_thumbnail"></div>
					<input type="file" id="image" name="imagename2"/>
					<div id="image_container2" class="image_thumbnail"></div>
					<input type="file" id="image" name="imagename3"/>
					<div id="image_container3" class="image_thumbnail"></div>
					<!-- 이미지 썸네일 -->
				</form>
			</section>
		</main>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>