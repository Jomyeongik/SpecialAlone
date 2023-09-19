<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천식당 목록</title>
<link rel="stylesheet" href="/resources/css/common/footer.css">
<link rel="stylesheet" href="/resources/css/common/header.css">
<link rel="stylesheet" href="/resources/css/common/reset.css">
<link rel="stylesheet" href="/resources/css/food/diner/dinerList.css">
</head>
<body>
	<div class="container">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<!-- main -->
	        <nav class="nav_region">
	            <ul>
	            	<li>
	                    <a href="/diner/list.do">전체</a>
	                </li>
	                <li>
	                    <a href="/diner/list.do?region=Seoul">서울</a>
	                </li>
	                <li>
	                    <a href="/diner/list.do?region=Incheon">경기</a>
	                </li>
	                <li>
	                    <a href="/diner/list.do?region=Gyeonggi">인천</a>
	                </li>
	            </ul>
	        </nav>								
		<main>
			<section>
				<h1>추천식당 목록</h1>
				<br>
				<hr>
				<br>
				<br>
				
					<c:forEach var="dinerSet" items="${dinerSetList}">
						<div class="diner-list">
							<!-- 이미지 영역 -->
							<div class="dinerListImage">
								<img src="${dinerSet.dinerFile.fDinerFilepath}"
									alt="${dinerSet.dinerFile.fDinerFilename}"
									onclick="showDinerDetail(${dinerSet.diner.fDinerId}, ${dinerSet.dinerFile.refFDinerId})">
							</div>
							<!-- 정보 영역 -->
							<div class="dinerListInfo">
								<h2>${dinerSet.diner.fDinerName}</h2>
								<br>
								<h3>${dinerSet.diner.fDinerAddress}</h3>
								<br>
								<p>
									대표메뉴 <br>
									<br> 간단설명 : ${dinerSet.diner.fDinerNote}
								</p>
							</div>
							<!-- 영업시간 영역 -->
						<div class="dinerListImage">
								<p>
									영업시간 <br> ${dinerSet.diner.fDinerBHour}<br>
									<br>
								</p>
						</div>
						</div>
					</c:forEach>
				
			<div class="pagination">
				<c:if test="${dinerSetList.size() > 0}">
				    <ul>
				        <c:if test="${pInfo.startNavi > 1}">
				            <li><a href="/diner/list.do?page=1">처음</a></li>
				        </c:if>
				        <c:if test="${pInfo.currentPage > 1}">
				            <li><a href="/diner/list.do?page=${pInfo.currentPage - 1}">이전</a></li>
				        </c:if>
				        <c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="i">
				            <c:if test="${pInfo.currentPage == i}">
				                <li class="active"><span>${i}</span></li>
				            </c:if>
				            <c:if test="${pInfo.currentPage != i}">
				                <li><a href="/diner/list.do?page=${i}">${i}</a></li>
				            </c:if>
				        </c:forEach>
				        <c:if test="${pInfo.currentPage < pInfo.naviTotalCount}">
				            <li><a href="/diner/list.do?page=${pInfo.currentPage + 1}">다음</a></li>
				        </c:if>
				        <c:if test="${pInfo.endNavi < pInfo.naviTotalCount}">
				            <li><a href="/diner/list.do?page=${pInfo.naviTotalCount}">끝</a></li>
				        </c:if>
				    </ul>
				</c:if>

			</div>				
				<br>
				<br>
				<br>

			</section>
		</main>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
      <script>
		function showDinerDetail(fDinerId, refFDinerId) {
		    // 선택한 상품의 fProductId 및 refFProductId를 사용하여 URL을 구성합니다.
		    var url = "/diner/dinerDetail.do?fDinerId=" + fDinerId + "&refFDinerId=" + refFDinerId; 
		    // 구성한 URL로 이동합니다.
		    window.location.href = url;
		}
		</script>	
</body>
</html>