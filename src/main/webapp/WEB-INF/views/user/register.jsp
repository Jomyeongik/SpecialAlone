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
      	<link rel="stylesheet" href="/resources/css/user/register.css">
      	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>SpecialAlone 회원가입</title>
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
					<form action="/user/register.do" method="post">
					<fieldset id="registerbox">
						<legend>회원가입</legend><br>
						<ul>
							<li>
								<label>아이디 : </label>
								<input id="userId" type="text" name="userId" placeholder="아이디를 입력하세요"><br>
								<span id="userIdMsg"></span>
							</li>
							<li>
								<label>비밀번호 : </label>
								<input id="textbox" type="password" name="userPw" placeholder="비밀번호를 입력하세요">
							</li>
							<li>
								<label>이름 : </label>
								<input id="textbox" type="text" name="userName" placeholder="이름을 입력하세요">
							</li>
							<li>
								<label>성별 : </label>
								<input type="radio" name="userGender" value="M"> 남자
								<input type="radio" name="userGender" value="F"> 여자
							</li>
							<li>
								<label>이메일 : </label>
								<input id="userEmail" type="email" name="userEmail" placeholder="이메일을 입력하세요"><br>
								<span id="userEmailMsg"></span>
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
				<script>
				$(document).ready(function () {
				    var userIdInput = $("#userId");
				    var userIdMsg = $("#userIdMsg");

				    userIdInput.on("input", function () {
				        var userId = userIdInput.val();

				        // 입력란이 비어 있는 경우 메시지를 숨깁니다.
				        if (userId.trim() === "") {
				            userIdMsg.removeClass("valid invalid").text(""); // 클래스를 제거하고 텍스트를 지웁니다.
				            return;
				        }

				        // AJAX 요청을 사용하여 유효성 체크를 서버에 보냅니다.
				        $.ajax({
				            url: "/user/checkUserId.do",
				            method: "POST",
				            data: { userId: userId },
				            success: function (result) {
				                if (result === "valid") {
				                    userIdMsg.removeClass("invalid").addClass("valid").text("사용 가능한 아이디입니다.");
				                } else {
				                    userIdMsg.removeClass("valid").addClass("invalid").text("이미 사용 중인 아이디입니다.");
				                }
				            }
				        });
				    });
				});
 				</script>
 				<script>
 				$(document).ready(function () {
 				    var userEmailInput = $("#userEmail");
 				    var userEmailMsg = $("#userEmailMsg");

 				    userEmailInput.on("input", function () {
 				        var userEmail = userEmailInput.val();
 				        // 입력란이 비어 있는 경우 메시지를 숨깁니다.
 				        if (userEmail.trim() === "") {
 				            userEmailMsg.removeClass("valid invalid").text("");
 				            return;
 				        }
 				        // 이메일 주소의 형식을 정규 표현식으로 검사
 				        if (isValidEmailFormat(userEmail)) {
 				            // AJAX 요청을 사용하여 중복 여부를 서버에 보냅니다.
 				            $.ajax({
 				                url: "/user/checkUserEmail.do",
 				                method: "POST",
 				                data: { userEmail: userEmail },
 				                success: function (result) {
 				                    if (result === "valid") {
 				                        userEmailMsg.removeClass("invalid").addClass("valid").text("사용 가능한 이메일 주소입니다.");
 				                    } else {
 				                        userEmailMsg.removeClass("valid").addClass("invalid").text("이미 사용 중인 이메일 주소입니다.");
 				                    }
 				                }
 				            });
 				        } else {
 				            // 형식이 올바르지 않은 경우 메시지를 표시
 				            userEmailMsg.removeClass("valid").addClass("invalid").text("유효하지 않은 이메일 주소 형식입니다.");
 				        }
 				    });
 				});
 				// 이메일 주소의 형식을 정규 표현식으로 검사하는 함수
 				function isValidEmailFormat(email) {
 				    // 간단한 이메일 형식 유효성 검사 정규 표현식
 				    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
 				    return emailPattern.test(email);
 				}
 				</script>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				function sample4_execDaumPostcode(){
					new daum.Postcode({
						oncomplete : function(data){
							document.querySelector("#userAddr").value= data.roadAddress
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