<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<body>
	
	
	<div id="reportPopup" >
    <select id="categorySelect">
        <option value="카테고리1">카테고리1</option>
        <option value="카테고리2">카테고리2</option>
        <option value="카테고리3">카테고리3</option>
    </select>
    <p>${Review. }</p>
    
    <button id="submitReport">보내기</button>
    <button id="closePopup">닫기</button>
    
</div>
</body>
<script >
$("#submitReport").click(function() {
    var selectedCategory = $("#categorySelect").val();
    var reportContent = ""; 
    $.ajax({
      type: "POST", 
      url: "/admin/singo.do", 
      data: {
        sDescription: reportContent,
        category: selectedCategory
      },
      success: function(response) {
        alert("신고가 성공적으로 접수되었습니다.");
        $("#reportPopup").hide(); 
      },
      error: function(xhr, status, error) {
        alert("신고 제출 중 오류가 발생했습니다.");
        console.error(error);
      }
    });
  });
    $("#reportPopup").hide();
});
</script>
</html>