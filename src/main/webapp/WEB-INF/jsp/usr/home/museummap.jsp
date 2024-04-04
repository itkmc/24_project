<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MUSEUMMAP"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head>
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
<body>
	<div id="map" style="width:750px;height:350px;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9027bcd1207d36d1a4ac000f5ba4ba0c"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56903, 126.98316), // 지도의 중심좌표
		        level: 5, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.56682, 126.97865), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

	</script>
</body>
</html>