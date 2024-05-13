<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="HISTORICSITESMAP"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>다음 지도 API</title>
<!-- 카카오맵 API -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9027bcd1207d36d1a4ac000f5ba4ba0c"></script>
<style>
#map {
	width: 1000px; /* 가로 너비를 1000px로 설정 */
	height: 800px;
	margin: 0 auto; /* 가운데 정렬을 위해 margin을 설정합니다. */
	position: relative; /* 지도 컨테이너에 position 속성 추가 */
}

#overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 10px;
	border: 1px solid #ccc; /* # 문자가 잘못 입력되어 수정했습니다. */
	border-radius: 5px;
	display: none;
	z-index: 1000; /* 오버레이를 지도 위에 표시하기 위해 z-index 속성 추가 */
	width: 400px; /* 오버레이 너비 조정 */
}

#image {
  width: 200px; /* 이미지 크기를 동일하게 조정 */
  height: auto; /* 가로 크기에 맞추어 세로 크기 자동 조정 */
  float: left; /* 이미지를 왼쪽으로 정렬 */
  margin-right: 10px; /* 이미지와 설명 사이 간격 설정 */
}

#description {
  float: left; /* 설명을 오른쪽으로 정렬 */
  width: calc(100% - 220px); /* 이미지 너비와 간격을 제외한 공간을 설정 */
}
</style>
</head>
<body>
		<div id="map"></div>
		<div id="overlay">
			<img id="image" src="" alt="이미지">
			<p id="description"></p>
		</div>
	</div>
	<script>
        var mapContainer = document.getElementById('map');
        var overlay = document.getElementById('overlay');
        var image = document.getElementById('image');
        var description = document.getElementById('description');
        var currentMarker = null; // 현재 클릭된 마커를 저장하기 위한 변수

        // 중심 좌표를 초기화합니다. (임시 값)
        var centerPosition = new kakao.maps.LatLng(37.56619, 126.97880);

        var mapOption = {
            center: centerPosition,
            level: 11,
            mapTypeId: kakao.maps.MapTypeId.ROADMAP
        };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        // CSV 데이터를 가져와서 JavaScript에서 사용할 수 있는 형식으로 변환합니다.
        var csvData = [
            <c:forEach var="item" items="${csvList}">
                { latitude: ${item.latitude}, longitude: ${item.longitude}, imageUrl: '${item.imageLink}', description: '${item.description}' }<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        
        // CSV 데이터를 반복하여 마커와 오버레이를 생성합니다.
        csvData.forEach(function(data) {
            var markerPosition = new kakao.maps.LatLng(data.latitude, data.longitude);
            var marker = new kakao.maps.Marker({
                position: markerPosition,
                map: map
            });

         // 마커를 클릭했을 때
            kakao.maps.event.addListener(marker, 'click', function() {
                // 오버레이의 표시를 토글합니다.
                if (overlay.style.display === 'block') {
                    overlay.style.display = 'none'; // 이미 표시된 경우 숨깁니다.
                } else {
                    overlay.style.display = 'block'; // 숨겨진 경우 표시합니다.
                    // 이미지와 설명을 설정합니다.
                    image.src = data.imageUrl;
                    description.textContent = data.description;
                }
            });
        });
    </script>
</body>
</html>
