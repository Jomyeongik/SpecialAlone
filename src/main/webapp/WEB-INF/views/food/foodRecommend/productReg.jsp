<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>추천상품 등록</title>
		<link rel="stylesheet" href="/resources/css/common/footer.css">
        <link rel="stylesheet" href="/resources/css/common/header.css">
        <link rel="stylesheet" href="/resources/css/common/reset.css">
        <link rel="stylesheet" href="/resources/css/food/product/productReg.css">

	</head>
	<body>
      <div class="container">
         <!-- header -->
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

         <!-- main -->
            <main>
               <section>
                <form action="/foodProduct/register.do" method="POST">
                		             
                        <h1>추천상품 등록</h1><br><hr><br>
                        <input type="submit" value="제출"><br>
                        <select name="fProductType" id="fProductType">
                            <option value="koreanfood">한식</option>
                            <option value="chinesefood">중식</option>
                            <option value="japanesefood">일식</option>
                            <option value="westernfood">양식</option>
                            <option value="snackfood">분식</option>
                        </select>
                        <label>기업명</label> 
                        <input type="text" id="fProductCompany" name="fProductCompany"><br><br>
                        <label>상품명</label> 
                        <input type="text" id="fProductName" name="fProductName"><br><br>
                        <label>가격</label> 
                        <input type="text" id="fProductPrice" name="fProductPrice"><br><br>
                        <label>간단설명</label> 
                        <input type="text" id="fProductSimple" name="fProductSimple"><br><br>
                        <label for="textarea">영양정보</label> 
                        <textarea name="fProductInfo" id="fProductInfo" cols="30" rows="10"></textarea><br>
                        <!-- 파일 등록 부분 수정 
                        파일등록 하나씩 버튼 만들기 3개 가로로 이어서 보여주기
                        -->
                  
                        <label for="textarea">상세정보</label> 
                        <textarea name="fProductDetail" id="fProductDetail" cols="60" rows="10"></textarea><br>
                </form>
	            <br><br>  
               </section>
            </main>

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>	
	</body>
</html>