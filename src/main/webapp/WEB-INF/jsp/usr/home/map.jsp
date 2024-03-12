<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Daum Maps API</title>
</head>
<body>
<div id="map" style="width: 50%; height: 850px; margin: auto;"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9027bcd1207d36d1a4ac000f5ba4ba0c"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(36.3609976417, 127.378954394), // 지도의 중심좌표
        level: 11, // 지도의 확대 레벨
        mapTypeId: kakao.maps.MapTypeId.ROADMAP
        // 지도종류
    };

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커를 생성하고 지도에 표시
var marker = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(36.3609976417, 127.378954394),// 마커의 좌표
    position2: new kakao.maps.LatLng(csv.getLatitude, 127.378954394),
    position3: new kakao.maps.LatLng(36.3609976417, 127.378954394),
    position4: new kakao.maps.LatLng(36.3609976417, 127.378954394),
    map: map // 마커를 표시할 지도 객체
});

// 마커를 클릭했을 때 커스텀 오버레이를 표시할지 말지 결정하기 위한 변수
var isVisible = false;

// 마커에 클릭 이벤트를 등록합니다.
kakao.maps.event.addListener(marker, 'click', function() {
    // isVisible 변수 값에 따라 customOverlay의 표시 여부를 토글합니다.
    if (isVisible) {
        customOverlay.setMap(null); // 오버레이를 지도에서 제거합니다.
        isVisible = false; // 가시성 상태를 갱신합니다.
    } else {
        customOverlay.setMap(map); // 오버레이를 지도에 표시합니다.
        isVisible = true; // 가시성 상태를 갱신합니다.
    }
});

// Create a custom overlay object and make initial settings.
var customOverlay = new kakao.maps.CustomOverlay({
    map: null, // 초기에는 지도에 표시하지 않습니다. 클릭 이벤트를 통해 제어됩니다.
    content: '<div style="width: 300px; padding: 20px; text-align: center; background-color: white;">' + 
             '<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Neolithic_Pit_house_in_Dunsan_prehistoric_site.jpg/1280px-Neolithic_Pit_house_in_Dunsan_prehistoric_site.jpg" style="float: left; margin-right: 10px;" width="100">' + 
             '<div style="overflow: hidden;">' + 
             '<p style="background-color: white; word-break: keep-all; overflow-wrap: break-word; white-space: normal;">구석기·신석기·청동기시대의 유적이 발굴된 곳이다.</p>' +
             '</div>' + 
             '<div style="clear: both;"></div>' + // 플로팅 해제
             '</div>', // 오버레이에 표시할 콘텐츠입니다.
    position: new kakao.maps.LatLng(36.3609976417, 127.378954394), // 오버레이가 표시될 위치입니다.
    xAnchor: 0.5, // 컨텐츠의 x 위치
    yAnchor: 0 // 컨텐츠의 y 위치
});

// If necessary, you can call it like this when you want to hide customOverlay:
// customOverlay.setMap(null);
</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>
