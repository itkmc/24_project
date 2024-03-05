<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="JOIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	function joinCheck() {
		var form = document.form1;

		var loginId = form.loginId.value;
		var loginPw = form.loginPw.value;
		var name = form.name.value;
		var nickname = form.nickname.value;

		$.get('./doJoinCheck', {
		    loginId: loginId,
		    loginPw: loginPw,
		    name: name,
		    nickname: nickname
		}, function(data) {
		    // 서버로부터의 응답을 처리하는 로직
		    // 예: 성공 응답을 확인하는 조건
		    if(data.success) { // 이 부분은 실제 응답 데이터에 맞게 수정되어야 합니다.
		        // 조건이 충족되면 페이지 이동
		        window.location.href = "/member/doQuestion";
		    } else {
		        // 조건이 충족되지 않으면 경고 메시지 표시 (예시)
		        alert("회원가입 검증에 실패했습니다.");
		    }
		}, 'json');
	}
</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="form1" action="../member/showQuestion" method="POST">
			<table class="join-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="아이디를 입력해주세요" name="loginId" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="비밀번호를 입력해주세요" name="loginPw" /></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="이름을 입력해주세요" name="name" /></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="닉네임을 입력해주세요" name="nickname" /></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="가입" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>