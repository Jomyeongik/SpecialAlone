<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <header>
	<nav class="nav_left">
		<a href="/index.jsp">Special Alone</a>
	</nav>
	
	<nav class="nav_center">
		<div id="nav">
			<div id="main_nav">
				<ul>
					<li><a href="#">NOTICE</a></li>
					<li><a href="#">FOOD</a></li>
					<li><a href="/hobby/category/list.do">HOBBY</a></li>
					<li><a href="#">SECURITY</a></li>
					<li>
						<c:if test="${userId eq 'admin' }">
							<li><a href="#">관리자페이지</a></li>
						</c:if>
					</li>
				</ul>
			</div>
			
			<div id="sub" class="background-with-opacity">
				<div id="sub_menu">
					<ul class="menu">
						<li><a href="/notice/list.do">공지사항</a></li>
						<li><a href="/event/list.do">행사</a></li>
						<li><a href="/newsRoom/list.do">뉴스룸</a></li>
					</ul>
					<ul class="menu">
						<li><a href="/foodProduct/list.do">추천상품</a></li>
						<li><a href="/diner/list.do">추천식당</a></li>
					</ul>
					<ul class="menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">행사</a></li>
						<li><a href="#">뉴스룸</a></li>
					</ul>
					<ul class="menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">행사</a></li>
						<li><a href="#">뉴스룸</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="nav_right">
		<ul>
			<c:if test="${userId ne null }">
		<li style="float: left;"><a href="/user/logout.do">Logout</a></li>
			<form action="/user/mypage.do" method="post">
				<input type="hidden" name="userId" value="${userId }"><br>
				<input type="submit" value="Mypage">
			</form>
		</c:if>
		<c:if test="${userId eq null }">
			<li style="float: left;"><a href="/user/login.do">Login</a></li>
			<li style="float: left;"><a href="/user/register.do">Register</a></li>
		</c:if>
		</ul>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script>
         // JSP 내에서는 제이쿼리 코드를 작성할 수 있습니다.
         $(function() {
             $('#sub').hide();
            
 	        $('#main_nav').mouseenter(function() {
 	            $(this).parent().find('#sub').slideDown();
 	        });
 	        $('#sub').mouseleave(function() {
 	            $(this).slideUp(1000); // 1초 동안 유지
 	        });
         });
        
     </script>
</header>