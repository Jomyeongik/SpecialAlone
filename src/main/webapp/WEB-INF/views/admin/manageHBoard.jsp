<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" href="/resources/css/reset.css">
	    <link rel="stylesheet" href="/resources/css/header.css">
	    <link rel="stylesheet" href="/resources/css/footer.css">
	    <link rel="stylesheet" href="/resources/css/admin/manageBoard.css">
	    <link rel="stylesheet" href="/resources/css/admin/main.css">
		<script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<title>게시글/리뷰 관리</title>
	</head>
	<body>
		<!-- header -->
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <!-- main -->
        <main>
        	<div id="main_left">
                <table>
                    <tr>
                        <td><a href="/member/list.do">회원관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/singo/list.do">신고회원</a></td>
                    </tr>
                    <tr>
                        <td style="background-color: black;"><a href="/manageBoard.do?selectedValue=notice" style="color:white;">게시글/리뷰 관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/manageReply.do?selectedValue=hobby">댓글 관리</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
            	<h2><b>게시글/리뷰 관리</b></h2>
                <hr>
                <div class="search">
                	<select id="boardType">
                		<option value="notice">공지사항</option>
                		<option value="event">행사</option>
                		<option value="sProduct">안전 상품</option>
                		<option value="sReview">안전 리뷰</option>
                		<option value="hBoard" selected>취미 게시글</option>
                		<option value="fBoard">음식 추천</option>
                		<option value="fReview">음식 포토 리뷰</option>
                	</select>
                	<br>
                    <form action="/manageBoard/search.do" method="get">
                    	<input type="hidden" name="selectedValue" value="hBoard">
						<input type="text" name="searchKeyword" placeholder="카테고리 검색 ex)캠핑, 독서.." style="width:30%">
						<button id="findProduct" type="submit"><i class="fa-solid fa-magnifying-glass" style="color: blue;"></i></button>
					</form>	
                </div>
	            <table class="table table-striped table-hover">
	            		<colgroup>
							<col width="10%"></col>
							<col width="15%"></col>
							<col width="15%"></col>
							<col width="30%"></col>
							<col width="10%"></col>
						</colgroup>
	                    <thead>
	                        <tr style="text-align:center">
	                            <th>번호</th>
	                            <th>카테고리 분류</th>
	                            <th>게시글 분류</th>
	                            <th>제목</th>
	                            <th>관리</th>
	                        </tr>
	                    </thead>
	                    <tbody class="table-group-divider">
							<c:forEach var="notice" items="${hList}">
								<tr>
									<td style="text-align:center">${notice.hBoardNo }</td>
									<td style="text-align:center">${notice.refCategoryName }</td>
									<td style="text-align:center">${notice.hBoardCategory }</td>
									<td><a href="/hobby/board/detail.do?hBoardNo=${notice.hBoardNo }&category=${notice.refCategoryName}">${notice.hBoardTitle }</a></td>
									<td style="text-align:center">
										<button onclick="if (confirm('삭제 하시겠습니까?')) { location.href = '/deleteHBaord.do?hBoardNo=${notice.hBoardNo }'; window.location.href = window.location.href; }">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr align="center">
								<td colspan="5">
								<c:if test="${pInfo.currentPage != 1 }">
									<a href="/manageBoard.do?selectedValue=hBoard&currentPage=${pInfo.currentPage - 1 }">&lt;</a>&nbsp;
								</c:if>
								<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
									<c:url var="pageUrl" value="/manageBoard.do">
										<c:param name="selectedValue" value="hBoard"></c:param>
										<c:param name="currentPage" value="${p }"></c:param>
									</c:url>
									<c:if test="${pInfo.currentPage == p }"><a href="${pageUrl }" style="color:black;">${p }</a>&nbsp;</c:if>
									<c:if test="${pInfo.currentPage != p }"><a href="${pageUrl }">${p }</a>&nbsp;</c:if>
								</c:forEach>
								<c:if test="${pInfo.currentPage ne pInfo.naviTotalCount }">
									<a href="/manageBoard.do?selectedValue=hBoard&currentPage=${pInfo.currentPage + 1 }">&gt;</a>
								</c:if>
								</td>
							</tr>
						</tfoot>
	            </table>
            </div>
        	<div id="main_right"></div>
        </main>
        <!-- footer -->
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <script>
        	const selectElement = document.getElementById("boardType");
        	selectElement.addEventListener("change", function() {
        		const selectedValue = selectElement.value;
				location.href="/manageBoard.do?selectedValue="+selectedValue;
        	});
        	
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	</body>	
</html>