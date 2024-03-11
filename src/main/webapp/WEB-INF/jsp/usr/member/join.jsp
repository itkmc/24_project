<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="questionForm" id="questionForm" action="../member/dojoin" method="POST" style="display: none">
			<!-- 사용자 정보 입력 필드 -->
			<input type="hidden" name="loginId" value="${loginId}" /> <input type="hidden" name="loginPw" value="${loginPw}" />
			<input type="hidden" name="name" value="${name}" /> <input type="hidden" name="nickname" value="${nickname}" />
			<!-- 문제 입력란 -->
			<table class="join-box table-box-1" border="1">
				<tbody>
					<!-- 10개의 문제 입력란 -->
					<!-- 각 문제에 대한 입력 필드 -->
					<!-- 문제 번호와 입력란 -->
					<tr>
						<th>1번 문제</th>
						<td><div>'널리 인간을 이롭게 한다'는 고조선의 건국 이념은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="1번 문제의 정답을 입력해주세요" name="Question1" /></td>
					</tr>
					<tr>
						<th>2번 문제</th>
						<td><div>세게에서 가장 오래된 목판 인쇄물은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="2번 문제의 정답을 입력해주세요" name="Question2" /></td>
					</tr>
					<tr>
						<th>3번 문제</th>
						<td><div>을지문덕 장군이 수나라의 30만 대군을 몰살시켜 크게 승리한 이 전투의 이름은?​</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="3번 문제의 정답을 입력해주세요" name="Question3" /></td>
					</tr>
					<tr>
						<th>4번 문제</th>
						<td><div>국권 회복을 위해 1907년 안창호, 양기탁 등이 주축이 되어 결성한 비밀결사 단체는?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="4번 문제의 정답을 입력해주세요" name="Question4" /></td>
					</tr>
					<tr>
						<th>5번 문제</th>
						<td><div>우리나라 최초의 한글소설인 이 소설은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="5번 문제의 정답을 입력해주세요" name="Question5" /></td>
					</tr>
					<tr>
						<th>6번 문제</th>
						<td><div>삼국이 통일 된 후 대조영이 세운 나라는?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="6번 문제의 정답을 입력해주세요" name="Question6" /></td>
					</tr>
					<tr>
						<th>7번 문제</th>
						<td><div>불교 수용, 태학을 설립, 율령 반포를 한 고구려의 왕은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="7번 문제의 정답을 입력해주세요" name="Question7" /></td>
					</tr>
					<tr>
						<th>8번 문제</th>
						<td><div>독립운동가, 시인, 승려로 '님의 침묵'을 쓴 사람은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="8번 문제의 정답을 입력해주세요" name="Question8" /></td>
					</tr>
					<tr>
						<th>9번 문제</th>
						<td><div>을사조약이 일본의 강압으로 이루어진것임을 세계에 알리고 무효로 만들기 위해 헤이크에 파견된 사절단의 이름은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="9번 문제의 정답을 입력해주세요" name="Question9" /></td>
					</tr>
					<tr>
						<th>10번 문제</th>
						<td><div>김대중 정부 당시 북한에 협력과 지원을 함으로써 ​평화적인 통일을 목적으로 하는​ 대북 화해 협력정책인 이 정책의 이름은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="10번 문제의 정답을 입력해주세요" name="Question10" /></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="회원가입" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>

