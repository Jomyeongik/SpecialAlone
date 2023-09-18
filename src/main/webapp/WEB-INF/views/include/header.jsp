<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
	<div class="logo">
        <a class="navbar-brand" href="/index.jsp"><img src="/resources/images/logo.png" alt=""></a>
    </div>
    <div id="nav" class="container-fluid">
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
	    </button>
	   <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav" style="background-color:gray;">
	         <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">NOTICE</a>
				<ul class="dropdown-menu" style="background-color: gray;">
					<li>
						<a class="dropdown-item" href="/notice/list.do">공지사항</a>
					</li>
					<li><a class="dropdown-item" href="/event/list.do">행사</a></li>
					<li><a class="dropdown-item" href="/newsRoom/list.do">뉴스룸</a></li>
				</ul>
	         </li>
	         <li class="nav-item" style="margin-top: 13px;">
	            <a href="#">FOOD</a>
	         </li>
	         <li class="nav-item" style="margin-top: 13px;">
	            <a href="/hobby/category/list.do">HOBBY</a>
	         </li>
	         <li class="nav-item" style="margin-top: 13px;">
	            <a href="#">SECURITY</a>
	         </li>
	         <li class="nav-item" style="margin-top: 13px;">
	            <a href="#">관리자 페이지</a>
	         </li>
	      </ul>
	   </div>
	</div>
	<div class="nav_right">
      <ul>
      	<c:if test="${userId ne null }">
        	<li style="margin-top: 13px;"><a href="/user/logout.do">Logout</a></li>
        	<form action="/user/mypage.do" method="post">
        		<input type="hidden" name="userId" value="${userId }"><br>
        		<input type="submit" value="Mypage">
        	</form>
<%--         	<li style="margin-top: 13px;"><a href="/user/mypage.do?userId=${userId }">Mypage</a></li> --%>
      	</c:if>
      	<c:if test="${userId eq null }">
      		<li style="margin-top: 13px;"><a href="/user/login.do">Login</a></li>
        	<li style="margin-top: 13px;"><a href="/user/register.do">Register</a></li>
      	</c:if>
      </ul>
    </div>
</header>