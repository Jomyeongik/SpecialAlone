<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
      	<link rel="stylesheet" href="/resources/css/reset.css">
      	<link rel="stylesheet" href="/resources/css/header.css">
      	<link rel="stylesheet" href="/resources/css/footer.css">
      	<link rel="stylesheet" href="/resources/css/login.css">
		<title>SpecialAlone 회원가입</title>
	</head>
	<body>
		<div class="container">
		<!-- header -->
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
			
		<!-- main -->
		<main>
			<section>
				<h1>Special Alone</h1><br>
				<h3>더 특별한 혼자가 되기를 바랍니다.</h3><br>
				<h1>로그인</h1>
				<div class="loginArea">
					<form action="/user/login.do" method="post">
						<input type="text" name="userId" placeholder="아이디를 입력하세요">
						<input type="password" name="userPw" placeholder="비밀번호를 입력하세요">
						<button type="submit">Login</button>
					</form>
					<a href="/user/register.do">회원가입</a>
				</div>
			</section>
		</main>
			
		<!-- footer -->
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>