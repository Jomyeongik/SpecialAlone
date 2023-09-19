<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>추천상품 목록</title>
		<link rel="stylesheet" href="/resources/css/common/footer.css">
        <link rel="stylesheet" href="/resources/css/common/header.css">
        <link rel="stylesheet" href="/resources/css/common/reset.css">
        <link rel="stylesheet" href="/resources/css/food/product/productList.css">		
	</head>
	<body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	        <nav class="nav_category">
	            <ul>
	            	<li>
	                    <a href="/foodProduct/list.do">전체</a>
	                </li>
	                <li>
	                    <a href="/foodProduct/list.do?category=koreanfood">한식</a>
	                </li>
	                <li>
	                    <a href="/foodProduct/list.do?category=chinesefood">중식</a>
	                </li>
	                <li>
	                    <a href="/foodProduct/list.do?category=japanesefood">일식</a>
	                </li>
	                <li>
	                    <a href="/foodProduct/list.do?category=westernfood">양식</a>
	                </li>
	                <li>
	                    <a href="/foodProduct/list.do?category=snackfood">분식</a>
	                </li>
	            </ul>
	        </nav>
         <!-- main -->
            <main>
            <section>
                <br><br><br>                   
                <h2>한식</h2>
                <br>
                <span>전체 상품 수 : ${pInfo.totalCount }</span>
                <button id="product_sort">분류방식</button>           
                <br><br>
                <h1>상품 리스트</h1><br><hr><br>


			<div class="product_list">
                <!-- 상품 리스트를 반복하여 출력합니다 -->
                <c:forEach var="productSet" items="${foodProductSetList}">
                    <div class="product_item">
                        <div class="image_thumbnail">
                            <img src="${productSet.foodProductFile.fProductFilepath}" alt="${productSet.foodProduct.fProductName}" 
                            onclick="showProductDetail(${productSet.foodProduct.fProductId}, ${productSet.foodProductFile.refFProductId})">
                        </div>
                        <div class="product_info">
                            <h2>${productSet.foodProduct.fProductName}</h2>
                            <br>
                            가격 : ${productSet.foodProduct.fProductPrice}원
                            <br>
                            간단설명 : ${productSet.foodProduct.fProductSimple}
                        </div>
                    </div>
                </c:forEach>        
            </div>
			<div class="pagination">
				<c:if test="${foodProductSetList.size() > 0}">
				    <ul>
				        <c:set var="pageParam" value='' />
				        <c:choose>
				            <c:when test="${param.category == 'koreanfood'}">
				                <c:set var="pageParam" value='?category=koreanfood' />
				            </c:when>
				            <c:when test="${param.category == 'chinesefood'}">
				                <c:set var="pageParam" value='?category=chinesefood' />
				            </c:when>
				            <c:when test="${param.category == 'japanesefood'}">
				                <c:set var="pageParam" value='?category=japanesefood' />
				            </c:when>
				            <c:when test="${param.category == 'westernfood'}">
				                <c:set var="pageParam" value='?category=westernfood' />
				            </c:when>
				            <c:when test="${param.category == 'snackfood'}">
				                <c:set var="pageParam" value='?category=snackfood' />
				            </c:when>
				        </c:choose>
				
				        <li><a href="/foodProduct/list.do${pageParam}&page=1">처음</a></li>
				        <c:if test="${pInfo.currentPage > 1}">
				            <li><a href="/foodProduct/list.do${pageParam}&page=${pInfo.currentPage - 1}">이전</a></li>
				        </c:if>
				
				        <c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="i">
				            <c:choose>
				                <c:when test="${pInfo.currentPage == i}">
				                    <li class="active"><span>${i}</span></li>
				                </c:when>
				                <c:otherwise>
				                    <li><a href="/foodProduct/list.do${pageParam}&page=${i}">${i}</a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				
				        <c:if test="${pInfo.currentPage < pInfo.naviTotalCount}">
				            <li><a href="/foodProduct/list.do${pageParam}&page=${pInfo.currentPage + 1}">다음</a></li>
				        </c:if>
				        <c:if test="${pInfo.endNavi < pInfo.naviTotalCount}">
				            <li><a href="/foodProduct/list.do${pageParam}&page=${pInfo.naviTotalCount}">끝</a></li>
				        </c:if>
				    </ul>
				</c:if>




			</div>
            </section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>
      
      <script>
		function showProductDetail(fProductId, refFProductId) {
		    // 선택한 상품의 fProductId 및 refFProductId를 사용하여 URL을 구성합니다.
		    var url = "/foodProduct/productdetail.do?fProductId=" + fProductId + "&refFProductId=" + refFProductId; 
		    // 구성한 URL로 이동합니다.
		    window.location.href = url;
		}
		</script>			
	</body>
</html>