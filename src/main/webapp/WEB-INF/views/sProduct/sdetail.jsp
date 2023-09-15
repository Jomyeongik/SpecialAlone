<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/reset.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/header.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/footer.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/security/index.css">
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/js/fileinput.min.js" type="text/javascript"></script>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/js/fileinput.min.js" type="text/javascript"></script>
<style>
  .star-rating {
    font-size: 18px;
    color: #ffcc00; 
  }
 @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       .rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ la
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 
#starcontainer{
  top: -100%;
  
  }
  main{
  overflow:clip;
  height:auto;
  display:flex;
  }
.recently-viewed-products{
width:15%;
}
 .recentProductsList{
    align-items: center; /* Vertically center images */
   
}
.imagination{
    display: flex;
    justify-content: left;
    text-align: left;
    padding-left: 20px;
}
 .image img {
    width:     width: 400px;
    object-fit: cover; /* Maintain aspect ratio and cover the entire container */
}

.middle{
margin-top:50px;
float:left;
width:75%;
display:flex;
margin-right:300px;
}
.right{
width:15%;
}


</style>
</head>
<body>
	<main>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="recently-viewed-products">
    <h3>최근 본 상품</h3>
    <div class="row-container">
    <div id="recentProductsList">
    
	</div>
	</div>
	</div>
	<div class="middle col-md-7">
	<section>
	<div class="image">
	<img alt="방호상품" src="${pageContext.request.contextPath}/resources/image/${Product.sFileReName}">
	</div>
	<hr>
	<div class="imagedetail">
	<ol>
	<li>${Product.sProductName }</li>
	<li>${Product.sPrice }</li>
	<li>${Product.sDescription }</li>
	</ol>
	</div>
	<h3>리뷰 쓰기</h3>
	<div class="form-group">
	<form action="/product/insertReview.do" method="post" name="reviewform" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align: center; border: 1px #dddddd">
		<tr>
		<td style="border-bottom:none;" valign="middle"> <br><br>${review.sUserid }</td>
		<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
		<td>   <div class="raiting_div " id="starcontainer">
        <fieldset class="rate">
        <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
        <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
        <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
        <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
        <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
        <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
        <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
        <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
        <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
        <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
		</fieldset>
		</div>
			</td>
			<td><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
			<td>	
	    <button class="btn btn-primary like-button" data-comment-id="comment123">추천</button>
		<a href="/review/singo.do?sReviewId=${Review.sReviewId }" id="reportButton">신고하기</a>
		<a href="/review/delete.do">삭제하기</a>
		</td>
			<tr>
				<td colspan="3"><input type="file" name="fileName"></td>
			</tr>
	</table>
	</form>
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td align="left" bgcolor="beige">댓글</td>
				</tr>
				<tr>
					<div class="container">		
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>						
											<td align="left"></td>		
											<td colspan="2"></td>
											<td align="right">
												
											</td>
										</tr>
										<tr>
											<td colspan="5" align="left">
											
											<br><br><img src = "commentUpload/ border="300px" width="300px" height="300px"><br><br></td>
										</tr>
									</tbody>
								</table>			
							</div>
					</div>		
				</tr>
		</table>
		
	</div>
	</div>
 </section>
	
	</div>
	  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</main>
	<script>
	var product = {
		    sProductId: ${Product.sProductId},
		    sProductName: "${Product.sProductName}",
		    sFilePath: "${Product.sFilePath}",
		    sFileReName: "${Product.sFileReName}",
		    sProductAverageRating: ${Product.sProductAverageRating}
		};

		function addToRecentlyViewedProducts(product) {
		    var recentlyViewedProducts = JSON.parse(localStorage.getItem('recentlyViewedProducts')) || [];

		    if (!recentlyViewedProducts.some(p => p.sProductId === product.sProductId)) {
		        recentlyViewedProducts.unshift(product); 

		    
		        localStorage.setItem('recentlyViewedProducts', JSON.stringify(recentlyViewedProducts));
		    }
		}

		function displayRecentlyViewedProducts() {
			var recentlyViewedProducts = JSON.parse(localStorage.getItem('recentlyViewedProducts')) || [];
		    var recentProductsList = document.getElementById('recentProductsList');

		    var productListHTML = '';
		    recentlyViewedProducts.forEach(function (item) {
// 		    	let fileName = 11;
// 		    	productListHTML += `<div class='col-md-3'>${fileName}</div>` 
		        productListHTML += 
		            '<div class="col-md-4">\
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
		    addToRecentlyViewedProducts(product);	
		});


 		 $(document).ready(function() {
			  $("#reportButton").click(function() {
			    var popup = window.open("/review/singo.do", "singo", "width=500,height=400");
			  })});

			
 		$(document).ready(function() {
 		    $(".like-button").on("click", function() {
 		        var commentId = $(this).data("comment-id");

 		        $.ajax({
 		            type: "POST",
 		            url: "/your-server-endpoint", 
 		            data: {
 		                commentId: commentId 
 		            },
 		            success: function(response) {
 		                var likeCount = response.likeCount; 
 		                $("#like-count-" + commentId).text(likeCount); 
 		            },
 		            error: function(xhr, status, error) {
 		                alert("추천 중 오류가 발생했습니다.");
 		                console.error(error);
 		            }
 		        });
 		    });
 		});
 		
 		</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>	
</body>
</html>