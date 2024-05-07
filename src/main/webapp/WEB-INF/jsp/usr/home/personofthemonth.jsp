<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>

.peoples {
	margin: 0 auto;
	max-width: 1300px; /* 최대 너비를 설정합니다. */
}

.person {
	/* 배경색, 그림자, 글자색, 글꼴 등을 설정합니다. */
	background-color: #000000;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
	color: #ffffff;
	font-family: 'Open Sans', Arial, sans-serif;
	font-size: 16px;
	line-height: 1.6em;
	margin-bottom: 5px;
	min-width: 250px; /* 최소 너비를 설정합니다. */
	overflow: hidden; /* 내용이 넘칠 때 처리 방법을 설정합니다. */
	position: relative; /* 상대적 위치 설정 */
	text-align: left; /* 텍스트 정렬을 왼쪽으로 설정합니다. */
	width: 310px; /* 너비를 설정합니다. */
	display: inline-block; /* 인라인 요소로 설정하여 가로로 배열되게 합니다. */
	vertical-align: top; /* 요소들을 위쪽으로 정렬합니다. */
}

.person * {
	/* 모든 하위 요소의 크기 계산을 박스 모델로 설정합니다. */
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	/* 모든 속성에 대한 변화가 부드럽게 일어나도록 설정합니다. */
	-webkit-transition: all 0.25s ease;
	transition: all 0.25s ease;
}

.person img {
	/* 이미지 스타일을 설정합니다. */
	max-width: 100%; /* 최대 너비를 설정합니다. */
	vertical-align: top; /* 이미지를 위쪽으로 정렬합니다. */
	position: relative; /* 상대적 위치 설정 */
	opacity: 0.75; /* 투명도를 설정합니다. */
	width: 100%; /* 너비를 100%로 설정합니다. */
	height: 440.39px; /* 높이를 설정합니다. */
	object-fit: cover; /* 이미지를 커버하도록 설정합니다. */
	opacity: 0.5; /* 투명도를 설정합니다. */
}

.person figcaption {
	/* 이미지 아래 텍스트의 스타일을 설정합니다. */
	padding: 25px 20px 25px; /* 안쪽 여백을 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	bottom: 0; /* 아래쪽 위치를 설정합니다. */
	z-index: 1; /* 쌓이는 순서를 설정합니다. */
	width: 100%; /* 너비를 100%로 설정합니다. */
}

.person .date {
	/* 날짜 텍스트의 스타일을 설정합니다. */
	background-color: #fff; /* 배경색을 설정합니다. */
	color: #333; /* 글자색을 설정합니다. */
	font-size: 18px; /* 글자 크기를 설정합니다. */
	font-weight: 800; /* 글자 굵기를 설정합니다. */
	min-height: 48px; /* 최소 높이를 설정합니다. */
	min-width: 48px; /* 최소 너비를 설정합니다. */
	padding: 10px 0; /* 안쪽 여백을 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	right: 15px; /* 오른쪽 위치를 설정합니다. */
	text-align: center; /* 텍스트 정렬을 가운데로 설정합니다. */
	text-transform: uppercase; /* 텍스트를 대문자로 변환합니다. */
	top: 0; /* 위쪽 위치를 설정합니다. */
}

.person .date span {
	/* 날짜 텍스트의 스타일을 설정합니다. */
	display: block; /* 블록 요소로 설정합니다. */
	line-height: 14px; /* 줄 높이를 설정합니다. */
}

.person .date .year {
	/* 연도 텍스트의 스타일을 설정합니다. */
	font-size: 11px; /* 글자 크기를 설정합니다. */
}

.person h3 {
	/* 제목 텍스트의 스타일을 설정합니다. */
	font-weight: 800; /* 글자 굵기를 설정합니다. */
	letter-spacing: -0.4px; /* 글자 사이 간격을 설정합니다. */
	opacity: 3; /* 투명도를 설정합니다. */
	margin: 0; /* 마진을 초기화합니다. */
	padding: 0; /* 패딩을 초기화합니다. */
}

.person .hover {
	/* 마우스 호버 시 나타나는 스타일을 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	top: 0; /* 위쪽 위치를 설정합니다. */
	bottom: 0; /* 아래쪽 위치를 설정합니다. */
	left: 0; /* 왼쪽 위치를 설정합니다. */
	right: 0; /* 오른쪽 위치를 설정합니다. */
	align-items: center; /* 수직 정렬을 가운데로 설정합니다. */
	background-color: rgba(236, 188, 46, 0.75); /* 배경색을 설정합니다. */
	display: flex; /* 플렉스 박스로 설정합니다. */
	font-size: 65px; /* 글자 크기를 설정합니다. */
	justify-content: center; /* 수평 정렬을 가운데로 설정합니다. */
	opacity: 0; /* 투명도를 0으로 설정합니다. */
}

.person a {
	/* 링크 스타일을 설정합니다. */
	left: 0; /* 왼쪽 위치를 설정합니다. */
	right: 0; /* 오른쪽 위치를 설정합니다. */
	top: 0; /* 위쪽 위치를 설정합니다. */
	bottom: 0; /* 아래쪽 위치를 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	z-index: 1; /* 쌓이는 순서를 설정합니다. */
}

.person:hover .hover, .person.hover .hover {
	/* 마우스 호버 시 나타나는 스타일을 설정합니다. */
	-webkit-transition-delay: 0.1s; /* 트랜지션 지연 시간을 설정합니다. */
	transition-delay: 0.1s; /* 트랜지션 지연 시간을 설정합니다. */
	opacity: 1; /* 투명도를 1로 설정합니다. */
}

.person:hover figcaption, .person.hover figcaption {
	/* 마우스 호버 시 이미지 아래 텍스트의 스타일을 설정합니다. */
	opacity: 0; /* 투명도를 0으로 설정합니다. */
}

.person:hover .date, .person.hover .date {
	/* 마우스 호버 시 날짜 텍스트의 스타일을 설정합니다. */
	-webkit-transform: translateY(-100%); /* Y축으로 -100%만큼 이동합니다. */
	transform: translateY(-100%); /* Y축으로 -100%만큼 이동합니다. */
}

/*영상 팝업*/
.popup {
	/* 팝업 스타일을 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	min-height: auto; /* 최소 높이를 자동으로 설정합니다. */
	width: 500px; /* 너비를 설정합니다. */
	z-index: 1002; /* 쌓이는 순서를 설정합니다. */
}

.test {
	/* 테스트 스타일을 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	top: 0; /* 위쪽 위치를 설정합니다. */
	left: 0; /* 왼쪽 위치를 설정합니다. */
	right: 0; /* 오른쪽 위치를 설정합니다. */
	bottom: 0; /* 아래쪽 위치를 설정합니다. */
	margin: auto; /* 가운데 정렬을 위해 마진을 자동으로 설정합니다. */
	width: 60%; /* 너비를 설정합니다. */
	height: 60%; /* 높이를 설정합니다. */
}

.bg {
	/* 배경 스타일을 설정합니다. */
	background-color: black; /* 배경색을 설정합니다. */
	opacity: 0.65; /* 투명도를 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	z-index: 1000; /* 쌓이는 순서를 설정합니다. */
	top: 0px; /* 위쪽 위치를 설정합니다. */
	left: 0px; /* 왼쪽 위치를 설정합니다. */
	width: 100%; /* 너비를 설정합니다. */
	min-height: 100%; /* 최소 높이를 설정합니다. */
	overflow: hidden; /* 넘침을 숨김 처리합니다. */
}

#showPopup {
	/* 팝업 표시 버튼 스타일을 설정합니다. */
	position: absolute; /* 절대적 위치 설정 */
	top: 50%; /* 위쪽 위치를 설정합니다. */
	left: 50%; /* 왼쪽 위치를 설정합니다. */
	padding: 10px 30px; /* 안쪽 여백을 설정합니다. */
	margin-top: -40px; /* 마진을 설정합니다. */
	margin-left: -77px; /* 마진을 설정합니다. */
	font-size: 40px; /* 글자 크기를 설정합니다. */
	text-decoration: none; /* 텍스트에 밑줄을 없앱니다. */
	color: #333; /* 글자색을 설정합니다. */
	border: 1px solid #333; /* 테두리를 설정합니다. */
}

video {
	/* 비디오 스타일을 설정합니다. */
	width: 500px; /* 너비를 설정합니다. */
}
</style>

<script>
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});

	/*영상 팝업*/
	$(function() {
	  $("#showPopup").click(function(e) {
	    e.stopPropagation();
	    $(".bg").toggle();
	    $(".popup").toggle();
	  });
	  $("body").click(function() {
	    $(".bg").toggle();
	    $(".popup").hide();
	    var video = $("#player").attr("src");
	    $("#player").attr("src", "");
	    $("#player").attr("src", video);
	  });
	});
</script>

<div class="peoples">
	<figure class="person">
		<img src="/resource/2024년 4월.jpg" />
		<div class="date">
			<span class="month">04월</span><span class="year">2024년</span>
		</div>
		<figcaption>
			<h3>유기동, 김만수, 최병호</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2024년 4월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>

	<figure class="person">
		<img src="/resource/2024년 3월.jpg" />
		<div class="date">
			<span class="month">03월</span><span class="year">2024년</span>
		</div>
		<figcaption>
			<h3>마가렛 샌더먼 데이비스, 이사벨라 멘지스, 데이지 호킹</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2024년 3월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>

	<figure class="person">
		<img src="/resource/2024년 2월.jpg" />
		<div class="date">
			<span class="month">02월</span><span class="year">2024년</span>
		</div>
		<figcaption>
			<h3>김창환, 이진산, 윤덕보 김원식</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2024년 2월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2024년 1월.jpg" />
		<div class="date">
			<span class="month">01월</span><span class="year">2024년</span>
		</div>
		<figcaption>
			<h3>이승만</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2024년 1월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 12월.jpg" />
		<div class="date">
			<span class="month">12월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>문일민, 안혜순</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 12월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 11월.jpg" />
		<div class="date">
			<span class="month">11월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>서상교, 최낙철, 신기철</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 11월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 10월.jpg" />
		<div class="date">
			<span class="month">10월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>이종암, 이강훈, 엄순봉</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 10월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 9월.jpg" />
		<div class="date">
			<span class="month">09월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>이재현, 한형석, 송면수</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 9월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 8월.jpg" />
		<div class="date">
			<span class="month">08월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>윤준희, 임국정, 한상호, 김강</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 8월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 7월.jpg" />
		<div class="date">
			<span class="month">07월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>강윤국, 유만수</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 7월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 6월.jpg" />
		<div class="date">
			<span class="month">06월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>오덕홍, 김일언, 정래의</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 6월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 5월.jpg" />
		<div class="date">
			<span class="month">05월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>가네코 후미코, 후세 다쓰지</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 5월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 4월.jpg" />
		<div class="date">
			<span class="month">04월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>이희경, 나용균, 황기환</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 4월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 3월.jpg" />
		<div class="date">
			<span class="month">03월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>권애라, 심영식, 임명애, 신관빈</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 3월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 2월.jpg" />
		<div class="date">
			<span class="month">02월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>송몽규, 안창남, 김필순</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 2월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2023년 1월.jpg" />
		<div class="date">
			<span class="month">01월</span><span class="year">2023년</span>
		</div>
		<figcaption>
			<h3>안현경, 이원순</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2023년 1월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 12월.jpg" />
		<div class="date">
			<span class="month">12월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>김상태, 신태식, 김동신</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 12월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 11월.jpg" />
		<div class="date">
			<span class="month">11월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>박건병, 강경선, 배천택</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 11월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 10월.jpg" />
		<div class="date">
			<span class="month">10월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>이옥, 유원우</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 10월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 9월.jpg" />
		<div class="date">
			<span class="month">09월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>안원규, 정원명</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 9월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 8월.jpg" />
		<div class="date">
			<span class="month">08월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>강제하, 이웅해, 백남준, 최명수</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 8월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 7월.jpg" />
		<div class="date">
			<span class="month">07월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>김갑, 한흥교, 민제호</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 7월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 6월.jpg" />
		<div class="date">
			<span class="month">06월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>안경근, 이덕주, 최흥식</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 6월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 5월.jpg" />
		<div class="date">
			<span class="month">05월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>박원희, 김영순, 조복금</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 5월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 4월.jpg" />
		<div class="date">
			<span class="month">04월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>안태국</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 4월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 3월.jpg" />
		<div class="date">
			<span class="month">03월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>김수남, 이두열, 고석주, 윌리엄 린튼</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 3월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 2월.jpg" />
		<div class="date">
			<span class="month">02월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>강기덕</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 2월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
	<figure class="person">
		<img src="/resource/2022년 1월.jpg" />
		<div class="date">
			<span class="month">01월</span><span class="year">2022년</span>
		</div>
		<figcaption>
			<h3>부춘화, 김옥련, 부덕량</h3>
		</figcaption>
		<div class="hover">
			<i class="ion-android-open" id="showPopup"></i>
			<div class="bg" style="display: none"></div>
			<div class="popup" style="display: none; height: 800px; width: 530px;">
				<iframe id="player" class="test" src="/resource/2022년 1월.mp4" frameborder="0" allowfullscreen autoplay></iframe>
			</div>
		</div>
	</figure>
</div>