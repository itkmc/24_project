<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- The Timeline -->

<section class="intro">
	<div class="container">
		<h1>History TimeLine &darr;</h1>
	</div>
</section>

<section class="timeline flex justify-center">
	<ul>
		<li>
			<div>
				<time class="period">선사시대</time>
				구석기 ~ 철기시대까지를 통들어 선사시대라고 한다.
			</div>
		</li>
		<li>
			<div>
				<time>
					구석기 <img
						src="data:image/jpeg;base64,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"
						alt="" />
				</time>
				사냥과 채집으로 살았던 구석기 사람들
			</div>
		</li>
		<li>
			<div>
				<time>
					신석기 <img
						src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Prehistoric_life-amsa_exhibition.jpg/220px-Prehistoric_life-amsa_exhibition.jpg"
						alt="" />
				</time>
				Proin quam velit, efficitur vel neque vitae, rhoncus commodo mi. Suspendisse finibus mauris et bibendum molestie.
				Aenean ex augue, varius et pulvinar in, pretium non nisi.
			</div>
		</li>
		<li>
			<div>
				<time>청동기</time>
				Proin iaculis, nibh eget efficitur varius, libero tellus porta dolor, at pulvinar tortor ex eget ligula. Integer eu
				dapibus arcu, sit amet sollicitudin eros.
			</div>
		</li>
		<li>
			<div>
				<time>철기</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
		<li>
			<div class="tilte">삼국시대</div>
		</li>
		<li>
			<div>
				<time>삼국시대</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
		<li>
			<div>
				<time>고구려</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
		<li>
			<div>
				<time>백제</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
		<li>
			<div>
				<time>신라</time>
				Aenean condimentum odio a bibendum rhoncus. Ut mauris felis, volutpat eget porta faucibus, euismod quis ante.
			</div>
		</li>
		<li>
			<div>
				<time></time>
				Vestibulum porttitor lorem sed pharetra dignissim. Nulla maximus, dui a tristique iaculis, quam dolor convallis
				enim, non dignissim ligula ipsum a turpis.
			</div>
		</li>
		<li>
			<div>
				<time>1985</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
		<li>
			<div>
				<time>2000</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
		<li>
			<div>
				<time>2005</time>
				In mattis elit vitae odio posuere, nec maximus massa varius. Suspendisse varius volutpat mattis. Vestibulum id magna
				est.
			</div>
		</li>
	</ul>
</section>


<%@ include file="../common/foot.jspf"%>