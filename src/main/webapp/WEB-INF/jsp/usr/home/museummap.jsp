<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MUSEUMMAP"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다음 지도 API</title>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9027bcd1207d36d1a4ac000f5ba4ba0c"></script>
</head>

<body>
    <div class="mapbox" style="text-align: center;">
        <div id="map"></div>
    </div>

    <script>
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = {
            center: new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
            level: 11, // 지도의 확대 레벨
            mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
        }; 

        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption); 
        
        // CSV 데이터를 JavaScript 객체로 변환한다.
        var csvData = [
            <c:forEach var="item" items="${csvList2}">
                {
                    latitude: ${item.latitude},
                    longitude: ${item.longitude},
                    museumName: "${item.museumName}",
                    viewingHours: "${item.viewingHours}",
                    closedDays: "${item.closedDays}"
                }
                <c:if test="${!loop.last}">,</c:if> 
            </c:forEach>
        ];

        // CSV 데이터를 반복하여 마커를 생성하고 지도에 표시한다.
        csvData.forEach(function(data) {
            var markerPosition = new kakao.maps.LatLng(data.latitude, data.longitude);
            var marker = new kakao.maps.Marker({
                position: markerPosition,
                map: map
            });
            
            // 마커를 클릭했을 때
            kakao.maps.event.addListener(marker, 'click', function() {
                // 오버레이의 표시를 토글한다.
                // 여기에 오버레이에 관련된 내용을 추가해야 합니다.
            });
        });
    </script>
</body>
</html>
