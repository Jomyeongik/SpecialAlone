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
      <link rel="stylesheet" href="/resources/css/hobby/detail.css">
      <title>Special Alone</title>
   </head>
   <body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

         <!-- main -->
            <main>
               <section class="hobby_detail_left">
                  <section class="hobby_detail_title">
                     ${ refCategoryName }
                  </section>
                  <section class="hobby_detail_bigNav">
                     <div class="hobby_detail_memberInfo">
                        <a href="">Today 200회</a>
                        <br>
                        <a href="#">내가 쓴 글 보기</a>
                        <br>
                        <a href="#">내가 쓴 댓글 보기</a>
                     </div>
                     <div class="hobby_detail_insertBTN">
                        <a href="/hobby/insert.do">
                           <input type="button" value="글쓰기">
                        </a>
                     </div>
                     <div class="hobby_detail_searchOPT">
                        <select name="" id="">
                           <option value="">카테고리</option>
                        </select>
                        <select name="" id="">
                           <option value="">제목</option>
                        </select>
                     </div>
                     <div class="hobby_detail_searchBar">
                        <input type="text" name="" id="" placeholder="검색어를 입력해주세요.">
                     </div>
                     <div class="hobby_detail_categorySelector">
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
               <section class="hobby_detail_center">
                  <section class="hobby_detail_center_top"></section>
                  <table class="hobby_detail_board_table">
                     <thead>
                        <tr class="hobby_detail_table_title">
                           <th>${ board.hBoardCategory }</th>
                           <th>${ board.hBoardTitle }</th>
                           <th>${ board.hBoardWriter }</th>
                           <th>${ board.hBoardCreateDate }</th>
                           <th>${ board.hBoardReplyNum }</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td colspan="5" class="hobby_detail_table_content">
                              ${ board.hBoardContent }
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <section class="hobby_detail_center_bottom">
                     <div>
                        <a href="../resources/buploadFiles/${ board.hBoardFilerename }" download>${ board.hBoardFilename }</a>
                     </div>
                     <div class="hobby_detail_listBTN">
                        <input type="button" value="    List    " onClick="javascript:history.go(-1);">
                     </div>
                     <c:url var="updateUrl" value="/hobby/board/update.do">
                        <c:param name="category" value="${ refCategoryName }"></c:param>
                        <c:param name="hBoardNo" value="${ board.hBoardNo }"></c:param>
                     </c:url>
                     <c:url var="boardDelUrl" value="/hobby/board/delete.do">
                        <c:param name="category" value="${ refCategoryName }"></c:param>
                        <c:param name="hBoardNo" value="${ board.hBoardNo }"></c:param>
                     </c:url>
                     <div>
                        <button type="button" onclick="updateBoard('${ updateUrl}');">수정</button>
                        <button type="button" onclick="deleteBoard('${ boardDelUrl }');">삭제</button>
                     </div>

                  </section>
                  <section class="hobby_detail_reply_tableBox">
                     <table class="hobby_detail_reply_table">
                        <thead>
                           <tr>
                              <td>khuser01</td>
                              <td><input type="text" name="" id="" placeholder="댓글을 입력하세요."></td>
                              <td>SYSDATE</td>
                              <td rowspan="2"><a href=""><input type="button" value="등록"></a></td>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td>khuser01</td>
                              <td>너무 멋져요~</td>
                              <td>23.09.11</td>
                              <td><a href=""><input type="button" value="수정"></a></td>
                              <td><a href=""><input type="button" value="삭제"></a></td>
                           </tr>
                        </tbody>
                     </table>
                  </section>
               </section>
               <section class="hobby_detail_right"></section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>
      <script>
			function updateBoard(url) {
				location.href = url;
			}
			function deleteBoard(url) {
				location.href = url;
			}
      </script>
   </body>
</html>