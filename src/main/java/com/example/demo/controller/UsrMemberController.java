package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.service.QuestionService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private Rq rq;

	@Autowired
	private MemberService memberService;

	@Autowired
	private QuestionService questionService;

	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그아웃 상태입니다");
		}

		rq.logout();

		return Ut.jsReplace("S-1", "로그아웃 되었습니다", "/");
	}

	@RequestMapping("/usr/member/login")
	public String showLogin(HttpServletRequest req) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		return "usr/member/login";
	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw, String afterLoginUri) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s(은)는 존재하지 않는 아이디입니다", loginId));
		}

		if (!member.getLoginPw().equals(loginPw)) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다"));
		}

		rq.login(member);

		if (afterLoginUri.length() > 0) {
			return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), afterLoginUri);
		}

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	@RequestMapping("/usr/member/join")
	public String showJoin(HttpServletRequest req) {

		return "usr/member/join";
	}

	@RequestMapping("/usr/member/dojoin")
	@ResponseBody
	public void dojoin(HttpServletRequest req, List<String> userAnswers) {
	    String loginId = req.getParameter("loginId");
	    String loginPw = req.getParameter("loginPw");
	    String name = req.getParameter("name");
	    String nickname = req.getParameter("nickname");
	    String[] userAnswersArray = req.getParameterValues("userAnswers[]");

	    // 첫 번째 문제 해결: userAnswers가 null일 때 NullPointerException 방지
	    if (userAnswers != null && !userAnswers.isEmpty()) {
	        System.err.println(userAnswers.get(0));
	    }

	    // userAnswersArray가 null인지 확인하고 이에 따라 처리합니다.
	    userAnswers = userAnswersArray != null ? Arrays.asList(userAnswersArray) : Collections.emptyList();

	    // 회원 등록 서비스를 호출하여 회원을 등록합니다.
	    ResultData<Object> joinResult = memberService.join(loginId, loginPw, name, nickname);

	    if (joinResult.isSuccess()) {
	        // 사용자 답변을 기반으로 점수를 계산합니다.
	        int score = calculateScore(userAnswers);

	        // 점수에 따라 회원의 등급을 결정합니다.
	        String grade;
	        if (score >= 8) {
	            grade = "초고수";
	        } else if (score >= 4) {
	            grade = "중수";
	        } else {
	            grade = "초보";
	        }

	        // 회원 등급을 업데이트합니다.
	        updateMember(loginId, grade);
	    }
	}

	// 사용자 답변을 기반으로 점수를 계산하는 메서드
	private int calculateScore(List<String> userAnswers) {
	    // 정답 목록을 정의합니다.
	    List<String> correctAnswers = Arrays.asList("정답 1", "정답 2", "정답 3", "정답 4", "정답 5", "정답 6", "정답 7", "정답 8", "정답 9", "정답 10");

	    // 점수를 초기화합니다.
	    int score = 0;

	    // 사용자의 답변을 반복하며 정답과 비교합니다.
	    for (int i = 0; i < userAnswers.size(); i++) {
	        if (userAnswers.get(i).equals(correctAnswers.get(i))) {
	            score++;
	        }
	    }

	    return score;
	}

	// 회원의 등급을 데이터베이스에 업데이트하는 메서드
	private void updateMember(String loginId, String grade) {
	    // 데이터베이스에서 회원 정보를 업데이트하는 서비스 메서드를 호출합니다.
	    memberService.updateMember(loginId, grade);
	}


	@PostMapping("/idOverlap")
	public ResponseEntity<String> checkIdOverlap(@RequestParam("id") String id) {
		boolean isOverlap = memberService.isIdOverlap(id);
		return ResponseEntity.ok(isOverlap ? "false" : "true");
	}

	@RequestMapping("/usr/member/showQuestion")
	public String showQuestionForm(HttpServletRequest req, String loginId, String loginPw, String name,
			String nickname) {
		req.setAttribute("loginId", loginId);
		req.setAttribute("loginPw", loginPw);
		req.setAttribute("name", name);
		req.setAttribute("nickname", nickname);
		return "usr/member/showQuestion";
	}

//	@RequestMapping("/usr/member/doQuestion")
//	@ResponseBody
//	public Map<String, Object> doQuestion(@RequestParam("answers[]") List<String> answers, String loginId,
//			String loginPw, String name, String nickname, HttpServletRequest request) {
//		List<String> correctAnswers = questionService.getCorrectAnswers();
//
//		int correctCount = 0;
//		for (int i = 0; i < answers.size(); i++) {
//			if (answers.get(i).equalsIgnoreCase(correctAnswers.get(i))) {
//				correctCount++;
//			}
//		}
//
//		boolean isCorrect = (correctCount == answers.size());
//
//		Map<String, Object> response = new HashMap<>();
//		if (isCorrect) {
//			HttpSession session = request.getSession();
//			String sessionId = session.getId();
//			ResultData<Object> joinResult = memberService.join(loginId, loginPw, name, nickname);
//			response.put("success", joinResult.isSuccess());
//			if (!joinResult.isSuccess()) {
//				response.put("errorMsg", joinResult.getMsg());
//			}
//		} else {
//			response.put("success", false);
//			response.put("errorMsg", "답변이 일치하지 않습니다.");
//		}
//		return response;
//	}
}
