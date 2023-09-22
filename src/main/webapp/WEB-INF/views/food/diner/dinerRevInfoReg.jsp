<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>추천식당 리뷰 등록</title>
		<link rel="stylesheet" href="/resources/css/footer.css">
        <link rel="stylesheet" href="/resources/css/header.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/food/diner/dinerRevReg.css">		
        <link rel="stylesheet" href="/resources/css/food/product/star.css">
        <link rel="stylesheet" href="/resources/css/food/button.css">
	</head>
	<body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
         <!-- main -->
           <main>
            <section>
                    <h2>${diner.fDinerType }</h2>
                    <h3>${diner.fDinerName }</h3>
                    <br><br>
                    <h1>식당리뷰 등록</h1><br><hr><br>
                <form action="/diner/revInfoReg.do" method="post">
                    <!-- 정보등록 폼 내용 -->
                    <br>
                    <div class="input_box">                                  
	                    <div class="input_title">
	                            <label>제목</label> 
	                    </div>
                    <input type="hidden" name="fDinerId" id="fDinerId" value="${diner.fDinerId}">                    
                    <input type="text" id="fDinerRevTitle" name="fDinerRevTitle"><br><br>
                    </div>
                    
			        <fieldset class="rate">
			            <input type="radio" id="rating10" name="fDinerRevStar" value="5"><label for="rating10" title="5점"></label>
			            <input type="radio" id="rating9" name="fDinerRevStar" value="4.5"><label class="half" for="rating9" title="4.5점"></label>
			            <input type="radio" id="rating8" name="fDinerRevStar" value="4"><label for="rating8" title="4점"></label>
			            <input type="radio" id="rating7" name="fDinerRevStar" value="3.5"><label class="half" for="rating7" title="3.5점"></label>
			            <input type="radio" id="rating6" name="fDinerRevStar" value="3"><label for="rating6" title="3점"></label>
			            <input type="radio" id="rating5" name="fDinerRevStar" value="2.5"><label class="half" for="rating5" title="2.5점"></label>
			            <input type="radio" id="rating4" name="fDinerRevStar" value="2"><label for="rating4" title="2점"></label>
			            <input type="radio" id="rating3" name="fDinerRevStar" value="1.5"><label class="half" for="rating3" title="1.5점"></label>
			            <input type="radio" id="rating2" name="fDinerRevStar" value="1"><label for="rating2" title="1점"></label>
			            <input type="radio" id="rating1" name="fDinerRevStar" value="0.5"><label class="half" for="rating1" title="0.5점"></label>
			        </fieldset>
			        <div id="textarea_box">
                    	<label for="textarea">리뷰내용</label> 
                    	<textarea name="fDinerRevContent" id="fDinerRevContent" cols="70" rows="5"></textarea><br>
                    </div>
                    <button id="submit-button" class="custom-btn btn-11">제출</button>
                </form>
            </section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div> 
    <script>
	    document.addEventListener('DOMContentLoaded', function () {
	        var submitButton = document.getElementById('submit-button');
	
	        submitButton.addEventListener('click', function () {
	            window.location.href = '/diner/revInfoReg.do';
	        });
	    });    
    </script>          		
	</body>
</html>