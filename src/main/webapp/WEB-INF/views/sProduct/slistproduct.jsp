<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>상품 리스트</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/reset.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/header.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/footer.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/index.css">
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<style>
  .star-rating {
    font-size: 18px;
    color: #ffcc00; 
  }
  main{
  overflow:clip;
  height:auto;
  display:flex;
  }
.recently-viewed-products{
width:25%;
}
.row-container{
margin-top:500px;
float:left;
width:75%;
display:flex;
}
 .recentProductsList{
    align-items: center; /* Vertically center images */
   
}
  .product-container {
justify-content: left;
align-items: center;
display: flex;
flex-wrap: wrap;
justify-content: space-between;
}

.product-card {
background-color: #fff;
padding: 10px;
text-align: center;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
transform: translateY(-10px);
margin: 5px;
transition: transform 0.3s ease;
width: calc(33.33% - 10px);
margin-bottom: 20px;
}

.product-card:hover {
transform: translateY(0);
}

.product-img {
width: 100%;
height: auto;
object-fit: cover;
overflow: hidden;
position: relative;
}

.product-img img {
width: 100%;
height: 200px;
}

.btn-detail{
display: inline-block;
background-color: red;
color: rgba(243, 242, 242, 0.955);
padding: 10px 20px;
border-radius: 5px;
font-size: 16px;
text-decoration: none;
transition: background-color 0.3s ease;
}
.btn {
display: inline-block;
background-color: aqua;
color: rgba(4, 4, 4, 0.955);
padding: 10px 20px;
border-radius: 5px;
font-size: 16px;
text-decoration: none;
transition: background-color 0.3s ease;
}

.btn:hover {
background-color: #555;
}
 .recently-product{
 width: 100%;
height: 100px;
 }
 .ad-container {
  position: fixed;
  top: 50%;
  left: 100%;
  transform: translate(-50%, -50%);
  z-index: 9999;
}
   .recent-products {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .product-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .product-item img {
            max-width: 100px; /* 이미지의 최대 너비 설정 */
            margin-right: 10px; /* 이미지와 이름 사이의 간격 조절 */
        }
      
</style>
</head>
<body>
<main>	   
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	 <div class="recently-viewed-products">
    <h3>최근 본 상품</h3>
    <div class="row" id="recentProductsList">
        <!-- 최근 본 상품이 여기에 동적으로 추가될 것입니다. -->
    </div>
	</div>

       
        <div class="pull-right">
        <form action="/product/search.do" method="get">
							<select name="searchCondition">
								<option value="all">전체</option>
								<option value="writer">작성자</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
							<input type="submit" value="검색">
						</form>
        </div>
       
<aside class="ad-container">
  <a href="https://kh-academy.co.kr/main/main.kh"><img src="${pageContext.request.contextPath}/resources/image/advertise.png" alt="Advertisement"></a>b
</aside>		
  <div class="row-container col-md-6">
 <h1>상품 리스트</h1>	
     <c:forEach var="Product" items="${pList}" >
    <div class="product-card col-md-4">
    	<c:url var="detailUrl" value="/product/sdetail.do">
			<c:param name="sProductId" value="${Product.sProductId }"></c:param>
		</c:url>
        <h2>${Product.sProductName}</h2>
        <a href="${detailUrl }"><img src="${pageContext.request.contextPath}/resources/image/${Product.sFileReName}" class="product-img" alt="상품이미지"></a>
        <p>${Product.sDescription}</p>
        <div class="star-rating" data-rating="${Product.sProductAverageRating}"></div>
	 <a href="${detailUrl }"class="btn btn-detail">상세 정보 보기</a>
    </div>
    </c:forEach>
</div>

<div>
<c:if test="${pInfo.startNavi != 1 }">
							<c:url var="prevUrl" value="/product/sproductlist.do">
								<c:param name="page" value="${pInfo.startNavi - 1 }"></c:param>
							</c:url>
							<a href="${prevUrl }">[이전]</a>
						</c:if>
						<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/product/sproductlist.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;
						</c:forEach>
						<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
							<c:url var="nextUrl" value="/product/sproductlist.do">
								<c:param name="page" value="${pInfo.endNavi + 1 }"></c:param>
							</c:url>
							<a href="${nextUrl }">[다음]</a>
						</c:if>
</div>


  	<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/product/sproductlist.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;
	</c:forEach>
 
  	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
  	
  	</main>
  <script>
  function displayStarRating() {
    $('.star-rating').each(function () {
      const rating = parseFloat($(this).data('rating'));
      const starHtml = '<i class="fa fa-star"></i>';
      const halfStarHtml = '<i class="fa fa-star-half"></i>';
      let starsHtml = '';
      for (let i = 1; i <= 5; i++) {
        if (i <= rating) {
          starsHtml += starHtml;
        } else if (i - 0.5 <= rating) {
          starsHtml += halfStarHtml;
        } else {
          starsHtml += '<i class="fa fa-star-o"></i>';
        }
      }
      $(this).html(starsHtml);
    });
  }
  
  
	
	
	  

  

		

		function displayRecentlyViewedProducts() {
			var recentlyViewedProducts = JSON.parse(localStorage.getItem('recentlyViewedProducts')) || [];
		    var recentProductsList = document.getElementById('recentProductsList');

		    var productListHTML = '';
		    recentlyViewedProducts.forEach(function (item) {
//		    	let fileName = 11;
//		    	productListHTML += `<div class='col-md-3'>${fileName}</div>` 
		        productListHTML += 
		            '<div class="col-md-3">\
		                <div class="card">\
		                   <a href="/product/sdetail.do?sProductId='+item.sProductId+'"> <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/'+item.sFileReName+'" alt="${product.sProductName}"></a>\
		                    <div class="card-body">\
		                        <h5 class="card-title">'+item.sProductName+'</h5>\
		                        <p class="card-text">평균평점: <span class="star-rating" data-rating="'+item.sProductAverageRating+'"></span></p>\
		                    </div>\
		                </div>\
		            </div>';
		    });

		    recentProductsList.innerHTML = productListHTML;
		}

		window.addEventListener('load', function () {
		    displayRecentlyViewedProducts();
		});


	  

	
      
</script>
</body>
</html>