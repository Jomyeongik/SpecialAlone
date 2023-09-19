<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/js/fileinput.min.js" type="text/javascript"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.3.0/js/fileinput.min.js" type="text/javascript"></script>

<style>
  .star-rating {
  margin-bottom:-20px;
  margin-top:-20px;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}



  main{
  overflow:clip;
  height:auto;
  display:flex;
  }
.recently-viewed-products{
width:15%;
display: flex;
flex-direction: column;
align-items: flex-start;
text-align: center;
}
.card{
width:200px;
}
.card-img-top{
width:100%;
height:180px;
}
.imagination{
    display: flex;
    justify-content: left;
    text-align: left;
    padding-left: 20px;
}
 .image img {
    width:      800px;	
    object-fit: cover; /* Maintain aspect ratio and cover the entire container */
}

.middle{
margin-top:50px;
float:left;
width:70%;
display:flex;
margin-right:300px;
margin-left:200px;
}
.right{
width:15%;
}
#bottom{
margin-top :10%;
}
#review-commit{
    position: relative	;
    top: -75px;
    right: -400px;
    width: 56px;
    height: 56px;
    line-height: 56px;
    margin: 0;
    padding: 0;
    left:300px;
}
.imagedetail{
position:absolute;
margin-left:800px;
margin-top:0%;
}
#fileup{
    position: relative;
    right :-200px;
	top:60px;
	left:50px	;
}
#reviewcontents{
	position: relative;
	right:-100px;
	left:20px;
}
#userId{
padding-left :20px;
right:25%;
}
.recent{
top:50px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<main>
    <div class="recently-viewed-products">
    <br><br>
    <h3>최근 본 상품</h3>
    <div class="row-container">
    <div id="recentProductsList">
    
	</div>
	</div>
	</div>
	<div class="middle row">
	<div class="image col-md-6">
	<img alt="방호상품" src="${pageContext.request.contextPath}/resources/images/${Product.sFileReName}">
	</div>
	<hr>
	<div class="imagedetail col-md-6">
	<ol>
	<li><h1>${Product.sProductName }</h1></li>
	<li><strong>${Product.sPrice }</strong></li>
	<li>${Product.sDescription }</li>
	<li>
	<c:if test="${User.userGrade eq '2' }">
		<a href="/product/update.do?sproductId="${Product.sProductId } class="btn btn-light">수정</a>
		<a href="/product/delete.do?sproductId="${Product.sProductId } class="btn btn-light">삭제</a>		
	</c:if>
	</li>
	</ol>
	</div>
	<div class="row form-group ">
	<div class="col-md-12">
<strong><h3>리뷰 쓰기</h3></strong>
<form action="/review/insertReview.do" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="sProductId" value="${Product.sProductId}">
    <input type="hidden" name="sUserNo" value="${User.userNo}">
    <table id="reviewtable" class="table table-striped" style="text-align: center; border: 1px #dddddd">
        <tr>
            <td style="border-bottom:none;" valign="middle" id="userId"><br><br>${User.userId}</td>
            <td>  <div class="star-rating">
                    <input type="radio" id="5-stars" name="sRating" value=5 />
                    <label for="5-stars" class="star">&#9733;</label>
                    <input type="radio" id="4-stars" name="sRating" value=4 />
                    <label for="4-stars" class="star">&#9733;</label>
                    <input type="radio" id="3-stars" name="sRating" value=3 />
                    <label for="3-stars" class="star">&#9733;</label>
                    <input type="radio" id="2-stars" name="sRating" value=2 />
                    <label for="2-stars" class="star">&#9733;</label>
                    <input type="radio" id="1-star" name="sRating" value=1 />
                    <label for="1-star" class="star">&#9733;</label>
                </div>
                <br>
                <textarea id="reviewcontents" rows="3" cols="55" placeholder="리뷰를 남겨주세요." name="sReviewContent"></textarea>
                	<br>
                <input type="submit" class="bd_btn keyup_alt" id="review-commit"value="등록"></td>               
            <td ><br><br>
            
            <input type="file" name="uploadFile" id="fileup"class="file" data-show-upload="false" data-show-caption="true">
            </td>
            
        </tr>
    </table>
</form>
	<div class="row" id="bottom">
	<c:choose>
    <c:when test="${not empty Reviews}">
    <c:forEach var="Review" items="${Reviews}">
    	<div class="col-md-12">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td align="left" bgcolor="beige">Review</td>
				</tr>
				<tr>
				<div class="container">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>
											<td>${Review.sUserId } <input type="hidden" id="sReviewNo_${Review.sReviewId}" value="${Review.sReviewId }"></td>	
											<td align="left">
											<td colspan="2"><td>${Review.sReviewContent }</td>
											<td align="right">
												<td>${Review.sCreateDate }</td>
												<td class="fdv_nav img_tx">	
	   										<a class="fa fa-thumbs-o-up like-button" onclick="return confirm('추천하시겠습니까?')" data-reviews="${Review.sReviewId}"><span class="vote-count">${Review.sReviewReCommend }</span></a>
											<a class="fa fa-exclamation-triangle" onclick="openSingoPopup(${Review.sReviewId});">신고</a>
											<c:if test="${Review.sUserId eq sessionScope.userId or User.userNo eq 2}">
											<a class="fa fa-pencil edit-button" id="sReviewId" data-sreviewid="${Review.sReviewId}" data-target="#editModal">수정</a>
											<a class="fa fa-eraser" onclick="return confirm('삭제하시겠습니까?')" href="/review/deleteReview.do?sReviewId=${Review.sReviewId }&sProductId=${Review.sProductId}">삭제</a>
											</c:if>
											</td>
										</tr>
										<tr>
											<td colspan="5" align="left">
											
											<br><br><img src = "${pageContext.request.contextPath}/resources/images/${Review.sFileReName}" width="300px" height="300px"><br><br></td>
										</tr>
									</tbody>
								</table>			
				</tr>
						</table>
					</div>
				</c:forEach>
		 </c:when>
    <c:otherwise>
        <p>리뷰가 없습니다.</p>
    </c:otherwise>
</c:choose>
				</div>
		
	</div>
	</div>
	</div>
	<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">리뷰 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
	          <form id="editReviewForm"action="/review/editReview.do" method="POST" enctype="multipart/form-data">
	          	<input type="hidden" name="sReviewId" id="sReviewIdInput" value="${Review.sReviewId }">
	          	<input type="hidden" name="sProductId" value="${Product.sProductId }">
                <textarea id="editReviewContent" name="editReviewContent" class="form-control" rows="3"></textarea>
            	<input type="file" id="imageInput" name="uploadFile" accept="image/*">
            	<img id="imagePreview" src="" alt="이미지 미리보기" style="max-width: 100%; max-height: 200px;">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="closeEditButton"data-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" id="saveEditButton" data-review-id="${Review.sReviewId }">저장</button>
            </div>
        </div>
    </div>
</div>
	
	<div class="right"></div>
	</main>
	  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
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
		            '<div class="col-md-8 recent">\
		                <div class="card">\
		                   <a href="/product/sdetail.do?sProductId='+item.sProductId+'"> <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/'+item.sFileReName+'" alt="${product.sProductName}"></a>\
		                    <div class="card-body">\
		                        <strong><p class="card-title">'+item.sProductName+'</p></strong>\
		                        <p class="card-text">평균평점: <span class="star" data-rating="'+item.sProductAverageRating+'"></span></p>\
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


		function openSingoPopup(reviewId) {
		    var url = "/review/singo.do?sReviewId=" + reviewId;
		    var popup = window.open(url, "singo", "width=500,height=400");
		    if (popup) {
		        popup.focus(); 
		    } else {
		        alert("팝업 창이 차단되었습니다. 팝업 차단을 해제하고 다시 시도하세요.");
		    }
		}

			
		$(document).ready(function() {
		    $(".fa.fa-thumbs-o-up.like-button").on("click", function() {
		        var reviewId = $(this).data("reviews");
		        var voteCountElement = $(this).find(".vote-count");
		        if (localStorage.getItem('recommendedReview' + reviewId)) {
		            alert('이미 추천하셨습니다.');
		            return; 
		        }

		        $.ajax({
		            type: "POST",
		            url: "/review/insertrecommend.do",
		            data: {
		                reviewId: reviewId
		            },
		            success: function(response) {
		                var updatedVoteCount = response;

		                localStorage.setItem('recommendedReview' + reviewId, 'true');

		                voteCountElement.text(updatedVoteCount);
		            },
		            error: function(xhr, status, error) {
		                alert("추천 중 오류가 발생했습니다.");
		                console.error(error);
		            }
		        });
		    });
		});
 		
 		$('#editModal').on('show.bs.modal', function (event) {
 		    var reviewId = $("#sReviewId").data('sreviewid'); 
 		    $('#sReviewIdInput').val(reviewId); 
 		});
 		$(".edit-button").on("click", function() {
 		    var reviewId = $(this).data("sreviewid"); 
 		    var reviewContent = $(this).closest("tr").find(".review-content").text();
 		    $("#editReviewContent").val(reviewContent);
 		    $("#saveEditButton").data("review-id", reviewId); 
 		    $("#editModal").modal("show");
 		    
 		    console.log("ReviewId in modal:", reviewId); 
 		});
 	
        $("#saveEditButton").on("click", function() {
        	  var reviewId = $(this).data("review-id");            
        	  $("#editReviewForm").submit();

        });
        $("#closeEditButton").on("click", function() {
            $("#editModal").modal("hide");
        });
        document.getElementById('imageInput').addEventListener('change', function(event) {
            var imagePreview = document.getElementById('imagePreview');
            var fileInput = event.target;

            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.style.display = 'block'; 
                };

                reader.readAsDataURL(fileInput.files[0]);
            } else {
                imagePreview.src = ''; 
                imagePreview.style.display = 'none';
            }
        });
 		</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>