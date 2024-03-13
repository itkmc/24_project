<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAP"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl px-4">


	<table class="table-box-1 table" border="1">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 20%" />
			<col style="width: 60%" />
			<col style="width: 10%" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>유적지 이름</th>
				<th>위도</th>
				<th>경도</th>
				<th>만든시기</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="csv" items="${csvList }">
				<tr class="hover">

					<td>${csv.id }</td>
					<td>${csv.ruinsname }</td>
					<td>${csv.latitude }</td>
					<td>${csv.longitude }</td>
					<td>${csv.creationtime }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>

