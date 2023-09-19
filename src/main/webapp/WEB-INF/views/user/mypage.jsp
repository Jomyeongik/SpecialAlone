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
      	<link rel="stylesheet" href="/resources/css/user/mypage.css">
		<title>SpecialAlone 마이페이지</title>
	</head>
	<body>
		<div class="container">
		<!-- header -->
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
			
		<!-- main -->
		<main>
			<section>
					<h1>Special Alone</h1>
					<h3>더 특별한 혼자가 되기를 바랍니다.</h3><br>
					<form action="/user/update.do" method="post">
					<fieldset id="registerbox">
						<legend>마이페이지</legend><br>
						<ul>
							<li>
								<label>아이디 : </label>
								<input id="textbox" type="text" name="userId" value="${user.userId }" readonly>
							</li>
							<li>
								<label>비밀번호 : </label>
								<input id="textbox" type="password" name="userPw" placeholder="비밀번호를 입력하세요">
							</li>
							<li>
								<label>이름 : </label>
								<input id="textbox" type="text" name="userName" value="${user.userName }" readonly>
							</li>
							<li>
								<label>성별 : </label>
								<input name="userGender" value="${user.userGender }" readonly>
								<c:if test="${user.userGender eq 'M' }"></c:if>
								<c:if test="${user.userGender eq 'F' }"></c:if>
							</li>
							<li>
								<label>이메일 : </label>
								<input id="textbox" type="text" name="userEmail" value="${user.userEmail }">
							</li>
							<li>
								<label>전화번호 : </label>
								<input id="textbox" type="text" name="userPhone" value="${user.userPhone }">
							</li>
							<li>
								<label>주소 : </label>
								<input id="userAddr" type="text" name="userAddr" value="${user.userAddr }">
								<input type="button" onclick="sample4_execDaumPostcode();" value="주소검색">
							</li>
							<li>
								<label>관심사 : </label>
<!-- 								<input type="text" name="userHobby"> -->
								<input type="radio" name="userHobby" value="음식"> 음식
								<input type="radio" name="userHobby" value="안전"> 안전
								<input type="radio" name="userHobby" value="취미"> 취미
							</li>
						</ul>
					</fieldset><br>
					<input type="submit" value="수정하기">
<!-- 					<input type="reset" value="탈퇴하기"> -->
				</form>
				<form action="/user/delete.do" method="get">
					<input type="hidden" name="userId" value="${user.userId }">
					<input type="submit" value="탈퇴" onclick="return confirm('정말 탈퇴하시겠습니까?');">
				</form>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				function sample4_execDaumPostcode(){
					new daum.Postcode({
						oncomplete : function(data){
							document.querySelector("#userAddr").value=data.roadAddress
						}
					}).open();
				}
				</script>
			</section>
		</main>
			
		<!-- footer -->
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>