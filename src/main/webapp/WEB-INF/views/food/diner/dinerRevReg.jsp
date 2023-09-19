<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>추천식당 리뷰 등록</title>
		<link rel="stylesheet" href="/resources/css/common/footer.css">
        <link rel="stylesheet" href="/resources/css/common/header.css">
        <link rel="stylesheet" href="/resources/css/common/reset.css">
        <link rel="stylesheet" href="/resources/css/food/diner/dinerRevReg.css">		
        <link rel="stylesheet" href="/resources/css/food/product/star.css">
	</head>
	<body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
         <!-- main -->
           <main>
            <section>
                <form id="infoForm" action="/diner/revInfoReg.do" method="post">
                    <!-- 정보등록 폼 내용 -->
                    <br>                   
                    <h2>이마트</h2>
                    <h3>[피코크] 밀푀유나베</h3>
                    <br><br>
                    <h1>포토리뷰 등록</h1><br><hr><br>
                    <button class="btn1" id="submitButton" type="submit" onclick="showFileForm()">등록</button>
                    <button class="btn1">수정</button>
                    <button id="btn-delete" class="btn1">삭제</button> <br><br><br>
                    <label for="">제목</label> 
                    <input type="text" id="fProductRevTitle" name="fProductRevTitle"><br><br>
			        <fieldset class="rate">
			            <input type="radio" id="rating10" name="fProductRevStar" value="5"><label for="rating10" title="5점"></label>
			            <input type="radio" id="rating9" name="fProductRevStar" value="4.5"><label class="half" for="rating9" title="4.5점"></label>
			            <input type="radio" id="rating8" name="fProductRevStar" value="4"><label for="rating8" title="4점"></label>
			            <input type="radio" id="rating7" name="fProductRevStar" value="3.5"><label class="half" for="rating7" title="3.5점"></label>
			            <input type="radio" id="rating6" name="fProductRevStar" value="3"><label for="rating6" title="3점"></label>
			            <input type="radio" id="rating5" name="fProductRevStar" value="2.5"><label class="half" for="rating5" title="2.5점"></label>
			            <input type="radio" id="rating4" name="fProductRevStar" value="2"><label for="rating4" title="2점"></label>
			            <input type="radio" id="rating3" name="fProductRevStar" value="1.5"><label class="half" for="rating3" title="1.5점"></label>
			            <input type="radio" id="rating2" name="fProductRevStar" value="1"><label for="rating2" title="1점"></label>
			            <input type="radio" id="rating1" name="fProductRevStar" value="0.5"><label class="half" for="rating1" title="0.5점"></label>
			        </fieldset>
                    <label for="textarea">리뷰내용</label> 
                    <textarea name="fProductRevContent" id="fProductRevContent" cols="70" rows="5"></textarea><br>
                </form>
                <form id="fileForm" action="/diner/revInfoReg.do" method="post" enctype="multipart/form-data" style="display: none;">
                	<input type="submit" value="파일등록">
                    <!-- 파일등록 폼 내용 -->
                    <input type="file" id="image" name="revImageName1"/>
                    <div id="image_container1" class="image_thumbnail"></div>
                    <input type="file" id="image" name="revImageName2"/>
                    <div id="image_container2" class="image_thumbnail"></div>    
                </form>
            </section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>
        <script>
            function showFileForm() {
                var infoForm = document.getElementById('infoForm');
                var fileForm = document.getElementById('fileForm');

                // 정보등록 폼을 숨깁니다.
                infoForm.style.display = 'none';
                // 파일등록 폼을 나타냅니다.
                fileForm.style.display = 'block';
            }
        </script>     		
	</body>
</html>