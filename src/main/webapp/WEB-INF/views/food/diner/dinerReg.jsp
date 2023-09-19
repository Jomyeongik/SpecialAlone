<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>식당 정보 등록</title>
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
                <form action="/diner/register.do" method="POST">                   
                        <h1>식당정보 등록</h1><br><hr><br>
                        <button class="btn1">등록</button>
                        <button class="btn1">수정</button>
                        <button id="btn-delete" class="btn1">삭제</button> <br>
                        <select name="fDinerType" id="fDinerType">
                            <option value="Seoul">서울</option>
                            <option value="Incheon">인천</option>
                            <option value="Gyeonggi">경기</option>
                        </select>
                        <label for="fDinerName">식당명</label> 
                        <input type="text" id="fDinerName" name="fDinerName"><br><br>
                        <label for="fDinerAddress">주소</label> 
                        <input type="text" id="fDinerAddress" name="fDinerAddress"><br><br>
                        <label for="fDinerParking">주차</label> 
                        <input type="text" id="fDinerParking" name="fDinerParking"><br><br>
                        <label for="fDinerPhone">전화번호</label>
                        <input type="text" id="fDinerPhone" name="fDinerPhone"><br><br>
                        <label for="fDinerBHour">영업시간</label>  
                        <input type="text" id="fDinerBHour" name="fDinerBHour"><br><br>
                        <label for="textarea">참고사항</label> 
                        <textarea name="fDinerNote" id="fDinerNote" cols="70" rows="10"></textarea><br>
                </form>
            </section>
        </main>   

         <!-- footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
      </div>	
	</body>
</html>