<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	/* $(document).ready(function() {
		// 회원가입 버튼을 클릭했을 때 실행되는 함수
		$("#form1-submit-btn").click(function() {
			// 첫 번째 폼 숨기기
			$("form[name='form1']").hide();
			// 두 번째 폼 표시하기
			$("form[name='questionForm']").show();
		});

		// 아이디 입력 필드의 값이 변경될 때마다 중복체크 여부를 다시 "no"로 설정
		$("input[name='loginId']").on("input", function() {
			$("#idCheck").val("no");
		});

		// 비밀번호와 비밀번호 확인 일치 여부 확인
		$("input[name='checkloginPw']").on("input", function() {
			var password = $("input[name='loginPw']").val();
			var confirmPassword = $(this).val();
			if (password !== confirmPassword) {
				$(this).css("border-color", "red");
			} else {
				$(this).css("border-color", ""); // 기본 스타일로 변경
			}
		});

		$("#confirm").click(function() {
			var id = $("input[name='loginId']").val();

			// 입력한 아이디가 비어있는 경우 알림창 띄우기
			if (id.trim() === '') {
				alert("아이디를 입력해주세요.");
				return;
			}

			// 아이디를 서버로 전송하여 중복 여부 확인
			$.ajax({
				type : "POST",
				url : "/idOverlap",
				data : {
					id : id
				},
				success : function(data) {
					if (data === "true") {
						alert("사용 가능한 아이디입니다.");
						$("#idCheck").val("yes"); // 중복체크 여부 변경
					} else if (data === "false") {
						alert("중복된 아이디입니다.");
					}
				},
				error : function() {
					alert("서버와의 통신 중 오류가 발생했습니다.");
				}
			});
		});

		// 회원가입 폼 제출 전 필요한 모든 검증을 수행
		$("form[name='form1']").submit(function() {
			if ($("#idCheck").val() === 'no') {
				alert("아이디 중복체크를 해주세요.");
				return false; // 폼 제출 취소
			}

			var password = $("input[name='loginPw']").val();
			var confirmPassword = $("input[name='checkloginPw']").val();

			if (password !== confirmPassword) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return false; // 폼 제출 취소
			}

			// 여기에 닉네임 중복체크 로직 추가
			var nickname = $("input[name='nickname']").val();
			// AJAX를 사용하여 닉네임 중복 체크를 수행하는 부분을 추가해야 합니다.

			// 모든 검증이 완료되면 문제 푸는 페이지로 이동
			window.location.href = "../member/showQuestion";

			// 폼 제출을 막습니다.
			return false;
		}); */
		<script>
	    $(document).ready(function() {
	        // 중복 확인 버튼 클릭 시
	        $("#confirm").click(function() {
	            var id = $("input[name='loginId']").val();

	            // 입력한 아이디가 비어있는 경우 알림창 띄우기
	            if (id.trim() === '') {
	                alert("아이디를 입력해주세요.");
	                return;
	            }

	            // 아이디를 서버로 전송하여 중복 여부 확인
	            $.ajax({
	                type : "POST",
	                url : "/idOverlap",
	                data : {
	                    id : id
	                },
	                success : function(data) {
	                    if (data === "true") {
	                        alert("사용 가능한 아이디입니다.");
	                        $("#idCheck").val("yes"); // 중복체크 여부 변경
	                    } else if (data === "false") {
	                        alert("중복된 아이디입니다.");
	                    }
	                },
	                error : function() {
	                    alert("서버와의 통신 중 오류가 발생했습니다.");
	                }
	            });
	        });
	    });
	</script>


		<!-- // 문제 푸는 페이지에서의 회원가입 기능
		 $("form[name='questionForm']").submit(function() {
			var answers = [];
			for (var i = 1; i <= 10; i++) {
				var answer = $("input[name='Question" + i + "']").val().trim();
				answers.push(answer);
			}

			$.ajax({
				type : "POST",
				url : "/usr/member/doQuestion",
				data : JSON.stringify({
					"answers" : answers
				}), // 데이터를 JSON 문자열로 변환
				contentType : 'application/json', // contentType을 application/json으로 설정
				success : function(response) {
					if (response.success) {
						alert("회원가입이 완료되었습니다! 점수: " + response.score);
						window.location.href = "/home/main";
					} else {
						alert("회원가입에 실패했습니다. 다시 시도해주세요.");
					}
				},
				error : function(xhr, status, error) {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});

			// 폼 제출을 막습니다.
			return false;
		});
	}); 
</script> -->

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="form1" id="form1" action="#" method="POST">
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
							placeholder="비밀번호를 다시 한번 입력해주세요" name="checkloginPw" /></td>
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
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="questionForm" id="questionForm" action="../member/doQuestion" method="POST" style="display: none">
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
					<!-- 회원가입 버튼 -->
					<tr>
						<th></th>
						<td><input type="button" value="회원가입" onclick="../member/doQuestion" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>