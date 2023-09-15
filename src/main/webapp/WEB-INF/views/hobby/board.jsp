<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/resources/css/reset.css">
      <link rel="stylesheet" href="/resources/css/header.css">
      <link rel="stylesheet" href="/resources/css/footer.css">
      <link rel="stylesheet" href="/resources/css/hobby/board.css">
      <title>Special Alone</title>
      <!-- react -->
      <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
      <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
      <!-- babel -->
      <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
   </head>
   <body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

         <!-- main -->
            <main>
               <section class="hobby_board_left">
                  <section class="hobby_board_title">
                     ${ refCategoryName }
                  </section>
                  <section class="hobby_board_bigNav">
                     <div class="hobby_board_memberInfo">
                        <a href="">Today 200회</a>
                        <br>
                        <a href="#">내가 쓴 글 보기</a>
                        <br>
                        <a href="#">내가 쓴 댓글 보기</a>
                     </div>
                     <div class="hobby_board_insertBTN">
                        <a href="/hobby/board/insert.do?category=${ refCategoryName }">
                           <input type="button" value="글쓰기">
                        </a>
                     </div>
                     <div class="hobby_board_searchOPT">
                        <select name="" id="">
                           <option value="">카테고리</option>
                        </select>
                        <select name="" id="">
                           <option value="">제목</option>
                        </select>
                     </div>
                     <div class="hobby_board_searchBar">
                        <input type="text" name="" id="" placeholder="검색어를 입력해주세요.">
                     </div>
                     <div class="hobby_board_categorySelector">
                        <ul>
                           <li>
                              카테고리
                           </li>
                           <li>
                              <hr>
                           </li>
                           <li>
                              <a href="#">전체보기</a>
                           </li>
                           <li>
                              <a href="#">후기</a>
                           </li>
                           <li>
                              <a href="#">질문</a>
                           </li>
                           <li>
                              <a href="#">소모임 모집</a>
                           </li>
                           <li>
                              <a href="#">소모임</a>
                           </li>
                        </ul>
                     </div>
                  </section>
               </section>
               <section class="hobby_board_center">
                  <section class="hobby_board_center_top"></section>
                  <table>
                     <thead>
                        <tr>
                           <th>카테고리</th>
                           <th>제목</th>
                           <th>작성자</th>
                           <th>작성일</th>
                           <th>댓글/인원</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="board" items="${ bList }">
                           <tr>
                              <td>${ board.hBoardCategory }</td>
                              <c:url var="detailUrl" value="/hobby/board/detail.do">
                                 <c:param name="category" value="${ refCategoryName }"></c:param>
                                 <c:param name="hBoardNo" value="${ board.hBoardNo }"></c:param>
                              </c:url>
                              <td><a href="${ detailUrl }">${ board.hBoardTitle }</a></td>
                              <td>${ board.hBoardWriter }</td>
                              <td>
                                 <fmt:formatDate pattern="yyyy-MM-dd" value="${ board.hBoardCreateDate }"/>
                              </td>
                              <td>
                                 <c:if test="${ board.hBoardCategory != '소모임' }">${ board.hBoardReplyNum }</c:if>
                                 <c:if test="${ board.hBoardCategory == '소모임' }">${ board.hGroupPersonNum }</c:if>
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  <section class="hobby_board_center_bottom">
                     <div class="hobby_board_listBTN">
                        <a href="#"><input type="button" value="    List    "></a>
                     </div>
                     <section class="hobby_board_listNav">
                        <c:if test="${ pInfo.startNavi != 1 }">
                           <c:url var="prevUrl" value="/hobby/board/list.do?category=${ refCategoryName }">
                              <c:param name="page" value="${ pInfo.startNavi -1 }"></c:param>
                           </c:url>
                           <a href="${ prevUrl }">[이전]</a>
                        </c:if>
                        <c:forEach begin="${ pInfo.startNavi }" end="${ pInfo.endNavi }" var="p">
                           <c:url var="pageUrl" value="/hobby/board/list.do?category=${ refCategoryName }">
                              <c:param name="page" value="${ p }"></c:param>
                           </c:url>
                           <a href="${ pageUrl }">${ p }</a>&nbsp;
                        </c:forEach>
                        <c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
                           <c:url var="nextUrl" value="/hobby/board/list.do?category=${ refCategoryName }">							
                              <c:param name="page" value="${ pInfo.endNavi +1 }"></c:param>
                           </c:url>
                           <a href="${ nextUrl }">[다음]</a>
                        </c:if>
                     </section>
                  </section>
               </section>
               <section class="hobby_board_right"></section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>
   </body>
</html>