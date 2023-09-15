<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>상품 리스트</title>
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
  .star-rating {
    font-size: 18px;
    color: #ffcc00; 
  }
</style>
</head>
<body>
    <div class="container">
        <h1>상품 리스트</h1>
       <div class="container">
  <div class="row">
    <div class="col-md-4" th:each="product : ${products}">
      <div class="card">
      <img class="card-img-top" src="상품 이미지 경로" alt="상품 이미지">
        <div class="card-body">
		  <h5 class="card-title" >${product.name}</h5>
          <p class="card-text" >${'평균평점: ' + product.averageRating}</p>
          <p class="card-text" >${product.description}</p>
          <a href="#" class="btn btn-primary">상세 정보 보기</a>
       </div>
      </div>
    </div>
  </div>
  </div>
  </div>
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

  $(document).ready(function () {
    displayStarRating();
  });
</script>
</body>
</html>