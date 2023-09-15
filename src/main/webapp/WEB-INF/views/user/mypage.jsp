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
      	<link rel="stylesheet" href="/resources/css/mypage.css">
		<title>SpecialAlone 마이페이지</title>
	</head>
	<body>
		<div class="container">
		<!-- header -->
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
			
		<!-- main -->
		<main>
			<section>
<!-- 				<form action="/user/register.do" method="post"> -->
					<h1>Special Alone</h1>
					<h3>더 특별한 혼자가 되기를 바랍니다.</h3><br>
					<form action="/user/mypage.do" method="post">
					<fieldset id="registerbox">
						<legend>마이페이지</legend><br>
						<ul>
							<li>
								<label>아이디 : </label>
								<span>${user.userId }</span>
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
								<input id="textbox" type="text" name="userEmail" placeholder="이메일을 입력하세요">
							</li>
							<li>
								<label>전화번호 : </label>
								<input id="textbox" type="text" name="userPhone" placeholder="전화번호를 입력하세요">
							</li>
							<li>
								<label>주소 : </label>
								<input id="userAddr" type="text" name="userAddr" placeholder="주소를 입력하세요">
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
					<input type="submit" value="회원가입">
					<input type="reset" value="취소">
				</form>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				function sample4_execDaumPostcode() {
					var themeObj = {
						searchBgColor: "#0B65C8", //검색창 배경색
						queryTextColor: "#FFFFFF" //검색창 글자색
					};
					var width = 500; //팝업의 너비
	                var height = 600; //팝업의 높이
			        new daum.Postcode({
			        	width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
			            height: height,
			            theme: themeObj,
			            oncomplete: function(data) {
			                var addr = data.address; // 최종 주소 변수

			                // 주소 정보를 해당 필드에 넣는다.
// 			                document.getElementById("userAddr").value = addr;
			                document.querySelector("#userAddr").value= data.address
			                // 주소로 상세 정보를 검색
			                geocoder.addressSearch(data.address, function(results, status) {
			                });
			            }
			        }).open({
			        	autoClose: true
			        });
			    }
			</script>
			</section>
		</main>
			
		<!-- footer -->
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>