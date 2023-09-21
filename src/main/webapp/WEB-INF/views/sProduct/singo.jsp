<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	
	
	<form id="reportPopup" action="/admin/singo.do" method="POST" >
    <select name="reason" id="categorySelect">
        <option value="폭력적인언어">폭력적인 언어</option>
        <option value="비적절한 내용">비적절한 내용</option>
        <option value="광고">광고</option>
    </select>
    <input type="hidden" name="productTitle" value="${Product.sProductName }">
    <input type="hidden" name="name" value="${rv.sUserId }">
    <input type="hidden" name="url" value="/product/sdetail.do?sProductId=${rv.sProductId }">
    <input type="hidden" name="content" value="${rv.sReviewContent }">
    <hr>
    <br>
   	<p>사유</p>
    <textarea rows="3"cols="50" name="singocontents"></textarea>
    
    <button id="submit">보내기</button>
    <button type="button" id="closePopup">닫기</button>
    
</form>
</body>
<script >

$(document).ready(function() {
    $("#closePopup").click(function() {
        $("#reportPopup").hide();
        window.close();
    });
    
    $("#submit").click(function() {
        var dataToSend = {
            reason: $("#categorySelect").val(),
            productTitle: $("input[name='productTitle']").val(),
            name: $("input[name='name']").val(),
            url: $("input[name='url']").val(),
            content: $("input[name='content']").val(),
            singocontents: $("textarea[name='singocontents']").val()
        };

        $.ajax({
            url: "/admin/singo.do", 
            method: "POST",
            data: dataToSend,
            success: function(response) {
            	if(response = "success"){
                $("#reportPopup").html("<p>신고가 완료되었습니다.</p>");
                setTimeout(function() {
                    $("#reportPopup").hide();
                    window.close();
                }, 2000);
            		
            	}else{
            		alert("Fail");
            	}
            },
            error: function(error) {
                console.error("신고 요청 실패:", error);
            }
        });
    });

});
</script>
</html>