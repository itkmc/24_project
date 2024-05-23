<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.join-box {
	display: flex;
    justify-content: center;
    align-items: center;
}

.btns {
	display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 10px;
}
</style>

<script>
   $(document).ready(function() {
      // 중복 확인 버튼 클릭 시
      $("#confirm").click(function() {
         var id = $("input[name='loginId']").val();

         // 입력한 아이디가 비어있는 경우 알림창을 표시합니다.
         if (id.trim() === '') {
            alert("아이디를 입력해주세요.");
            return;
         }

         // 서버에 아이디 중복 확인 요청을 보냅니다.
         $.ajax({
            type: "POST",
            url : "/idOverlap",
            data : {
               id: id
            },
            success : function(data) {
               if (data === "true") {
                  alert("사용 가능한 아이디입니다.");
                  $("#idCheck").val("yes"); // 중복체크 여부 변경
               } else if (data === "false") {
                  alert("중복된 아이디입니다.");
                  $("#idCheck").val("no");
               }
            },
            error : function() {
               alert("서버와의 통신 중 오류가 발생했습니다.");
            }
         });
      });

      // 폼 제출 이벤트
      $("form").submit(function(e) {
         // 중복 체크를 하지 않은 경우 회원가입을 막습니다.
         if ($("#idCheck").val() === 'no') {
            e.preventDefault(); // 폼 제출 취소
            alert("아이디 중복을 확인해주세요.");
         }

         // 비밀번호가 일치하지 않는 경우 회원가입을 막고, 비밀번호 확인란을 빨간색으로 표시합니다.
         var password = $("input[name='loginPw']").val();
         var confirmPassword = $("input[name='loginPwCheck']").val();
         if (password !== confirmPassword) {
            e.preventDefault(); // 폼 제출 취소
            $("#passwordMatchMessage").text("비밀번호가 일치하지 않습니다").css("color", "red");
            $("input[name='loginPwCheck']").css("border-color", "red");
         } else {
            // 비밀번호가 일치하는 경우, 비밀번호 확인란을 초록색으로 표시합니다.
            $("#passwordMatchMessage").text("비밀번호가 일치합니다").css("color", "green");
            $("input[name='loginPwCheck']").css("border-color", "green");
         }
      });

      // 비밀번호 입력란 이벤트 핸들러: 비밀번호 일치 여부 확인
      $("input[name='loginPw'], input[name='loginPwCheck']").on("input", function() {
         var password = $("input[name='loginPw']").val(); // 첫 번째 비밀번호 입력란
         var confirmPassword = $("input[name='loginPwCheck']").val(); // 두 번째 비밀번호 입력란
         var $passwordMatchMessage = $("#passwordMatchMessage");

         if (password !== '' && confirmPassword !== '') { // 두 입력란이 모두 비어 있지 않은 경우에만 비교
            if (password === confirmPassword) {
               $passwordMatchMessage.text("비밀번호가 일치합니다").css("color", "green");
               $("input[name='loginPwCheck']").css("border-color", "green");
            } else {
               $passwordMatchMessage.text("비밀번호가 일치하지 않습니다").css("color", "red");
               $("input[name='loginPwCheck']").css("border-color", "red");
            }
         } else {
            $passwordMatchMessage.text(""); // 한 입력란이라도 비어 있는 경우 메시지 초기화
            $("input[name='loginPwCheck']").css("border-color", ""); // 입력란 테두리 색상 초기화
         }
      });
   });
</script>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="form1" id="form1" action="/usr/member/showQuestion" method="POST">
			<table class="join-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="아이디를 입력해주세요" name="loginId" /> <input type="hidden" id="idCheck" name="idCheck" value="no">
							<button type="button" id="confirm">중복확인</button></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="password"
							placeholder="비밀번호를 입력해주세요" name="loginPw" /></td>
					</tr>
					<tr>
    					<th>비밀번호 확인</th>
    					<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="password"
        					placeholder="비밀번호를 다시 한번 입력해주세요" name="loginPwCheck" /></td>
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
						<td><input type="submit" value="다음" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>