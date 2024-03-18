package com.example.demo.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String dojoin(HttpServletRequest req) {
	    String loginId = req.getParameter("loginId");
	    String loginPw = req.getParameter("loginPw");
	    String name = req.getParameter("name");
	    String nickname = req.getParameter("nickname");
	    String[] userAnswersArray = req.getParameterValues("userAnswers[]");

	    List<String> userAnswers = userAnswersArray != null ? Arrays.asList(userAnswersArray) : Collections.emptyList();

	    ResultData<Object> joinResult = memberService.join(loginId, loginPw, name, nickname);

	    if (joinResult.isSuccess()) {
	        // DB에서 정답을 가져오는 로직 필요
	        List<String> correctAnswers = fetchCorrectAnswers();

	        // 사용자 답변을 기반으로 점수를 계산합니다.
	        String grade = calculateScore(userAnswers, correctAnswers);

	        // 회원 등급을 업데이트합니다.
	        memberService.updateMember(loginId, grade);
	        
	        return "회원가입 및 등급 설정이 완료되었습니다.";
	    } else {
	        return "회원가입에 실패했습니다.";
	    }
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
}
