<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
	<nav class="nav_left">
		<a href="/index.jsp">Special Alone</a>
	</nav>
	
	<nav class="nav_center">
		<ul>
			<li>
				<a href="#">NOTICE</a>
			</li>
			<li>
				<a href="/foodProduct/list.do">FOOD</a>
			</li>
			<li>
				<a href="/hobby/category/list.do">HOBBY</a>
			</li>
			<li>
				<a href="/product/slistproduct.do">SECURITY</a>
			</li>
			<c:if test="${userId eq 'admin' }">
				<li><a href="#">관리자페이지</a></li>
			</c:if>
		</ul>
	</nav>
	<div class="nav_right">
		<ul>
			<c:if test="${userId ne null }">
		<li style="margin-top: 13px;"><a href="/user/logout.do">Logout</a></li>
			<form action="/user/mypage.do" method="post">
				<input type="hidden" name="userId" value="${userId }"><br>
				<input type="submit" value="Mypage">
			</form>
		</c:if>
		<c:if test="${userId eq null }">
			<li style="margin-top: 13px;"><a href="/user/login.do">Login</a></li>
			<li style="margin-top: 13px;"><a href="/user/register.do">Register</a></li>
		</c:if>
		</ul>
	</div>
</header>