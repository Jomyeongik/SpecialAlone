<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
   <nav class="nav_left">
      <a href="#">Special Alone</a>
   </nav>
   <nav class="nav_center">
      <ul>
         <li>
            <a href="#">NOTICE</a>
         </li>
         <li>
            <a href="#">FOOD</a>
         </li>
         <li>
            <a href="/hobby/category/list.do">HOBBY</a>
         </li>
         <li>
            <a href="#">SECURITY</a>
         </li>
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
<%--         	<li style="margin-top: 13px;"><a href="/user/mypage.do?userId=${userId }">Mypage</a></li> --%>
      	</c:if>
      	<c:if test="${userId eq null }">
      		<li style="margin-top: 13px;"><a href="/user/login.do">Login</a></li>
        	<li style="margin-top: 13px;"><a href="/user/register.do">Register</a></li>
      	</c:if>
      </ul>
    </div>
    
</header>