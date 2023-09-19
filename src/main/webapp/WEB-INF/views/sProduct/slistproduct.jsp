<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>상품 리스트</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<style>
 .star-rating {
    font-size: 24px;
    color: #f0c419; }
  main{
  overflow:clip;
  height:auto;
  display:flex;
  }
#left{
width:15%;
float:left;
}



  .container {
width:70%;

}

.product-card {
background-color: #fff;
text-align: center;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
transform: translateY(-10px);
transition: transform 0.3s ease;
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
.card-img-top{
width:100%;
height:200px;
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

 .ad-container {
  position: fixed;
  top: 70%;
  left: 100%;
  transform: translate(-50%, -50%);
  z-index: 9999;
}
   .recently-viewed-products {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            text-align: center;
        }

        .product-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .product-item img {
            max-width: 100px; 
            margin-right: 10px; 
        }
      .middle{
margin-top:50px;
float:left;
display:flex;
width:100%;
        
}
.search{
position: absolute;
    right: 20px;
    bottom: 900px;
    z-index: 1;
}

.recent{
top:50px;

}
#main_right{
width:15%;
}
   .pagination {
        text-align: center;
        margin-top:1900px;
    }

    .pagination a {
        padding: 5px 10px;
        margin: 0 5px;
        border: 1px solid #ccc;
        text-decoration: none;
        color: #333;
    }

    .pagination a:hover {
        background-color: #eee;
    }

    .pagination .active {
        background-color: #333;
        color: #fff;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
<main>	   
	 <div id="left" class="recently-viewed-products">
	 <br><br><br>
    <h3 >최근 본 상품</h3>
    <div class="row" id="recentProductsList">
    </div>
	</div>
		<div class="row search">
        <div class="col-md-12">
        <form action="/product/search.do" method="get">
							<select name="searchCondition">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select><input type="text" name="searchKeyword" class="iText"placeholder="검색어를 입력하세요"><input type="submit" value="검색">
						</form>
						</div>
       </div>
<aside class="ad-container">
  <a href="https://kh-academy.co.kr/main/main.kh"><img src="${pageContext.request.contextPath}/resources/images/advertise.png" alt="Advertisement"></a>b
</aside>		

 <div class="container">
 <h1>상품 리스트</h1>
<div class="row middle">
	
    <c:forEach var="Product" items="${pList}" >
    <div class="product-card col-md-4">
    	<c:url var="detailUrl" value="/product/sdetail.do">
			<c:param name="sProductId" value="${Product.sProductId }"></c:param>
		</c:url>
        <a href="${detailUrl }"><img src="${pageContext.request.contextPath}/resources/images/${Product.sFileReName}" class="product-img" alt="상품이미지"></a>
        <p>${Product.sProductName}</p>
        <p>${Product.sDescription}</p>
        <strong class="price-value">${Product.sPrice }</strong>
        <div class="star-rating" data-rating="${Product.sProductAverageRating}"></div>
	 <a href="${detailUrl }"class="btn btn-detail">상세 정보 보기</a>
    </div>
    
    </c:forEach>
 
    </div>
    <div class="pagination">
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
</div>
             <div id="main_right"></div>
  	
  	</main>
  	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
  <script>
  document.addEventListener("DOMContentLoaded", function () {
	    var starRatingElements = document.querySelectorAll(".star-rating");

	    starRatingElements.forEach(function (element) {
	        var rating = parseFloat(element.getAttribute("data-rating"));
	        element.innerHTML = generateStarRating(rating);
		    displayRecentlyViewedProducts();

	    });
	});
  function generateStarRating(rating) {
	    var stars = "";
	    for (var i = 1; i <= 5; i++) {
	        if (i <= rating) {
	            stars += '<i class="fa fa-star"></i>'; 
	        } else {
	            stars += '<i class="fa fa-star-o"></i>'; 
	        }
	    }
	    return stars;
	}
 
		function displayRecentlyViewedProducts() {
			var recentlyViewedProducts = JSON.parse(localStorage.getItem('recentlyViewedProducts')) || [];
		    var recentProductsList = document.getElementById('recentProductsList');

		    var productListHTML = '';
		    recentlyViewedProducts.forEach(function (item) {
//		    	let fileName = 11;
//		    	productListHTML += `<div class='col-md-3'>${fileName}</div>` 
		        productListHTML += 
		            '<div class="col-md-7 recent">\
		                <div class="card">\
		                   <a href="/product/sdetail.do?sProductId='+item.sProductId+'"> <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/'+item.sFileReName+'" alt="${product.sProductName}"></a>\
		                    <div class="card-body">\
		                        <p class="card-title">'+item.sProductName+'</p>\
		                        <div class="star-rating" data-rating="'+item.sProductAverageRating+'"></div>\
		                    </div>\
		                </div>\
		            </div>';
		    });

		    recentProductsList.innerHTML = productListHTML;
		    
		    document.addEventListener("DOMContentLoaded", function () {
			    var starRatingElements = document.querySelectorAll(".star-rating");

			    starRatingElements.forEach(function (element) {
			        var rating = parseFloat(element.getAttribute("data-rating"));
			        element.innerHTML = generateStarRating(rating);
				    displayRecentlyViewedProducts();

			    });
			});
		}

		window.addEventListener('load', function () {
		    displayRecentlyViewedProducts();
		});


	  

	
      
</script>
</body>
</html>