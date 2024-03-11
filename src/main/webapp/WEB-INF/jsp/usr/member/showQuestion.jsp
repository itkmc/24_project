<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- <script> -->
// $("form[name='questionForm']").submit(function() {
//     collectAnswers();

//     $.ajax({
//         type: "POST",
//         url: "/usr/member/dojoin",
//         data: {
//             loginId: $("input[name='loginId']").val(),
//             loginPw: $("input[name='loginPw']").val(),
//             name: $("input[name='name']").val(),
//             nickname: $("input[name='nickname']").val(),
//             answers: answers
//         },
//         success: function(response) {
//             console.log(response);
//             window.location.href = "/usr/member/showQuestion"; // 회원가입 후 문제 푸는 페이지로 리다이렉션
//         },
//         error: function(xhr, status, error) {
//             console.error("오류가 발생했습니다:", error);
//         }
//     });

//     return false;
// });
<!-- </script> -->


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="questionForm" action="../member/dojoin" method="POST">
			<input type="hidden" name="loginId" value="${loginId}" /> <input type="hidden" name="loginPw" value="${loginPw}" />
			<input type="hidden" name="name" value="${name}" /> <input type="hidden" name="nickname" value="${nickname}" />

			<table class="join-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>1번 문제</th>
						<td>
							<div>'널리 인간을 이롭게 한다'는 고조선의 건국 이념은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="1번 문제의 정답을 입력해주세요" name="Question[0]" />
						</td>
					</tr>
					<tr>
						<th>2번 문제</th>
						<td>
							<div>세게에서 가장 오래된 목판 인쇄물은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="2번 문제의 정답을 입력해주세요" name="Question2" />
						</td>
					</tr>
					<tr>
						<th>3번 문제</th>
						<td>
							<div>을지문덕 장군이 수나라의 30만 대군을 몰살시켜 크게 승리한 이 전투의 이름은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="3번 문제의 정답을 입력해주세요" name="Question3" />
						</td>
					</tr>
					<tr>
						<th>4번 문제</th>
						<td>
							<div>국권 회복을 위해 1907년 안창호, 양기탁 등이 주축이 되어 결성한 비밀결사 단체는?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="4번 문제의 정답을 입력해주세요" name="Question4" />
						</td>
					</tr>
					<tr>
						<th>5번 문제</th>
						<td>
							<div>우리나라 최초의 한글소설인 이 소설은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="5번 문제의 정답을 입력해주세요" name="Question5" />
						</td>
					</tr>
					<tr>
						<th>6번 문제</th>
						<td>
							<div>삼국이 통일 된 후 대조영이 세운 나라는?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="6번 문제의 정답을 입력해주세요" name="Question6" />
						</td>
					</tr>
					<tr>
						<th>7번 문제</th>
						<td>
							<div>불교 수용, 태학을 설립, 율령 반포를 한 고구려의 왕은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="7번 문제의 정답을 입력해주세요" name="Question7" />
						</td>
					</tr>
					<tr>
						<th>8번 문제</th>
						<td>
							<div>독립운동가, 시인, 승려로 '님의 침묵'을 쓴 사람은?</div> <input class="input input-bordered input-primary w-full max-w-xs"
							autocomplete="off" type="text" placeholder="8번 문제의 정답을 입력해주세요" name="Question8" />
						</td>
					</tr>
					<tr>
						<th>9번 문제</th>
						<td>
							<div>을사조약이 일본의 강압으로 이루어진것임을 세계에 알리고 무효로 만들기 위해 파견된 사절단의 이름은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="9번 문제의 정답을 입력해주세요" name="Question9" />
						</td>
					</tr>
					<tr>
						<th>10번 문제</th>
						<td>
							<div>김대중 정부 당시 북한에 협력과 지원을 함으로써 ​평화적인 통일을 목적으로 하는​ 대북 화해 협력정책인 이 정책의 이름은?</div> <input
							class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="10번 문제의 정답을 입력해주세요" name="Question10" />
						</td>
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
