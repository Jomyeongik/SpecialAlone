<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/resources/css/reset.css">
      <link rel="stylesheet" href="/resources/css/header.css">
      <link rel="stylesheet" href="/resources/css/footer.css">
      <link rel="stylesheet" href="/resources/css/hobby/category.css">
      <title>Special Alone</title>
   </head>
   <body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

         <!-- main -->
            <main>
               <section class="hobby_category_left"></section>
               <section class="hobby_category_center">
                  <div class="hobby_category_center_top">
                     <div class="hobby_category_tag">
                        <form action="/hobby/category/searchByTag.do" method="get">
                           <ul>
                              <li>
                                 <input type="submit" name="searchCondition" value="indoor">
                              </li>
                              <li>
                                 <input type="submit" name="searchCondition" value="outdoor">
                              </li>
                              <li>
                                 <input type="submit" name="searchCondition" value="alone">
                              </li>
                              <li>
                                 <input type="submit" name="searchCondition" value="together">
                              </li>
                              <li>
                                 <input type="submit" name="searchCondition" value="health">
                              </li>
                              <li>
                                 <input type="submit" name="searchCondition" value="exercise">
                              </li>
                              <li>
                                 <input type="submit" name="searchCondition" value="art">
                              </li>
                              <!-- <c:forEach var="category" items="${ tagList }" begin="0" end="5">
                                 <li><input type="button" value="" name="searchCondition"></li>
                              </c:forEach> -->
                           </ul>
                        </form>
                     </div>
                     <div class="hobby_category_functionBTN">
                        <input type="button" value="등록" onclick="openInsertForm();" id="openInsertFormBTN">
                        <input type="button" value="삭제">
                     </div>
                     <form action="/hobby/category/searchByKeyword.do" method="get">
                        <div class="hobby_category_searchBar">
                           <input type="text" name="searchKeyword" id="" placeholder="Search">
                           <input type="submit" value="검색">
                        </div>
                     </form>
                  </div>
                  <div class="hobby_category_center_bottom">
                     <div class="hobby_category_col" id="insertForm">
                        <div class="hobby_category_row"></div>
                        <div class="hobby_category_row">
                           <form action="/hobby/category/insert.do" method="post" enctype="multipart/form-data">
                              <div class="hobby_category_insertBTN">
                                 <input type="submit" value="V">
                              </div>
                              <div class="hobby_category_image">
                                 <input type="file" name="uploadFile" id="">
                              </div>
                              <div class="hobby_category_title">
                                 <input type="text" name="hCategoryName" id="" placeholder="카테고리를 입력해주세요.">
                                 <select name="hCategoryTag" id="">
                                    <option value="">태그</option>
                                    <option value="indoor">실내</option>
                                    <option value="outdoor">실외</option>
                                    <option value="alone">혼자</option>
                                    <option value="together">같이</option>
                                    <option value="health">건강</option>
                                    <option value="exercise">운동</option>
                                    <option value="art">예술</option>
                                 </select>
                              </div>
                           </form>
                        </div>
                        <div class="hobby_category_row"></div>
                     </div>
                     <div class="hobby_category_col">
                        <c:forEach var="category" items="${ tagList }" begin="0" end="2">
                           <div class="hobby_category_row">
                              <div class="hobby_category_image">
                                 <a href="/hobby/board/list.do">
                                    <img src="/resources/image/Forester-MultiCloner-forest-750x750.jpg" alt="" width="300px" height="300px">
                                 </a>
                              </div>
                              <div class="hobby_category_title">
                                 ${ category.hCategoryName }
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                     <div class="hobby_category_col">
                        <c:forEach var="category" items="${ tagList }" begin="3" end="5">
                           <div class="hobby_category_row">
                              <div class="hobby_category_image">
                                 <a href="/hobby/board/list.do">
                                    <img src="/resources/image/Forester-MultiCloner-forest-750x750.jpg" alt="" width="300px" height="300px">
                                 </a>
                              </div>
                              <div class="hobby_category_title">
                                 ${ category.hCategoryName }
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                     <div class="hobby_category_col">
                        <c:forEach var="category" items="${ tagList }" begin="6" end="8">
                           <div class="hobby_category_row">
                              <div class="hobby_category_image">
                                 <a href="/hobby/board/list.do">
                                    <img src="/resources/image/Forester-MultiCloner-forest-750x750.jpg" alt="" width="300px" height="300px">
                                 </a>
                              </div>
                              <div class="hobby_category_title">
                                 ${ category.hCategoryName }
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
               </section>
               <section class="hobby_category_right"></section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>
      <script>
         function openInsertForm() {
            document.querySelector("#insertForm").style.display = "flex";
         }
      </script>
   </body>
</html>