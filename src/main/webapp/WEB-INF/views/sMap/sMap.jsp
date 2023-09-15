<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7a14b510baba8f2aa2d6bdf15c8181a"></script>
<script>
var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(37.566295, 126.977945),
        level: 2 
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); 

var circle = new kakao.maps.Circle({
    center : new kakao.maps.LatLng(33.450701, 126.570667),   
    radius: 20, // 미터 단위의 원의 반지름입니다 
    strokeWeight: 5, 
    strokeColor: '#75B8FA', 
    strokeOpacity: 1, 
    strokeStyle: 'dashed', 
    fillColor: '#CFE7FF', 
    fillOpacity: 0.7  
}); 

circle.setMap(map); 


var linePath = [
    new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
    new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
    new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
];

var polyline = new kakao.maps.Polyline({
    path: linePath, 
    strokeWeight: 5, 
    strokeColor: '#FFAE00', 
    strokeOpacity: 0.7, 
    strokeStyle: 'solid' 
});

polyline.setMap(map);  


var sw = new kakao.maps.LatLng(33.448842, 126.570379), 
    ne = new kakao.maps.LatLng(33.450026,  126.568556); 


var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);

var rectangle = new kakao.maps.Rectangle({
    bounds: rectangleBounds, // 그려질 사각형의 영역정보입니다
    strokeWeight: 4, // 선의 두께입니다
    strokeColor: '#FF3DE5', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'shortdashdot', // 선의 스타일입니다
    fillColor: '#FF8AEF', // 채우기 색깔입니다
    fillOpacity: 0.8 // 채우기 불투명도 입니다
});
var positions = [
    {
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}








</script>
</body>
</html>