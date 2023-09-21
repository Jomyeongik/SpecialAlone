<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link rel="stylesheet" href="/resources/css/header.css">
		<link rel="stylesheet" href="/resources/css/footer.css">
		<link rel="stylesheet" href="/resources/css/index.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap">
		<title>Special Alone</title>
	</head>
	
	<body>
		<div class="container">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<!-- main -->
		<main>
			<section class="index_background">
				<img src="/resources/image/1920x1080test.jpg" alt="test">
			</section>
			<section class="index_front">
				<section class="index_center">
					<div class="index_center_title">Special Alone</div>
					<div class="index_center_content">더 특별한 혼자가 되기를 바랍니다!</div>
				</section>
				<section class="index_right">
					<div class="index_right_title">
					</div>
					<div class="index_right_nav">
					<img src="" alt="">
				</div>
				</section>
			</section>
		</main>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>