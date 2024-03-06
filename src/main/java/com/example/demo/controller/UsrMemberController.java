package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
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

		if (member.getLoginPw().equals(loginPw) == false) {
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
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String name, String nickname) {
	    // 이전 페이지의 정보를 세션에 저장합니다.
	    HttpSession session = req.getSession();
	    session.setAttribute("loginId", loginId);
	    session.setAttribute("loginPw", loginPw);
	    session.setAttribute("name", name);
	    session.setAttribute("nickname", nickname);

	    // 회원가입을 완료하는 로직은 문제를 올바르게 푼 후의 doQuestion 메서드에서 처리합니다.
	    // 따라서 여기서는 다음 페이지로 리다이렉트만 진행합니다.
	    return "redirect:/usr/member/showQuestion"; // 다음 페이지로 이동합니다.
	}


//	@RequestMapping("/usr/member/doJoin")
//	@ResponseBody
//	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String name, String nickname) {
//		Rq rq = (Rq) req.getAttribute("rq");
//		if (rq.isLogined()) {
//			return Ut.jsHistoryBack("F-A", "이미 로그인 상태입니다");
//		}
//
//		if (Ut.isNullOrEmpty(loginId)) {
//			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
//		}
//		if (Ut.isNullOrEmpty(loginPw)) {
//			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
//		}
//		if (Ut.isNullOrEmpty(name)) {
//			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
//		}
//		if (Ut.isNullOrEmpty(nickname)) {
//			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
//		}
//
//		ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name, nickname);
//
//		if (joinRd.isFail()) {
//			return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
//		}
//
//		Member member = memberService.getMember(joinRd.getData1());
//
//		return Ut.jsReplace(joinRd.getResultCode(), joinRd.getMsg(), "../member/login");
//	}

	@RequestMapping("/usr/member/myPage")
	public String showMyPage() {

		return "usr/member/myPage";
	}

	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {

		return "usr/member/checkPw";
	}

	@RequestMapping("/usr/member/doCheckPw")
	public String doCheckPw(String loginPw) {

		if (Ut.isNullOrEmpty(loginPw)) {
			return rq.historyBackOnView("비번 입력해");
		}

		if (rq.getLoginedMember().getLoginPw().equals(loginPw) == false) {
			return rq.historyBackOnView("비번 틀림");
		}

		return "usr/member/modify";
	}

	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		Rq rq = (Rq) req.getAttribute("rq");

		// 비밀번호 안바꿀 수도 있어서 비번 null 체크는 제거

		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");

		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		ResultData modifyRd = memberService.modify(rq.getLoginedMemberId(), loginPw, name, nickname);

		return Ut.jsReplace(modifyRd.getResultCode(), modifyRd.getMsg(), "../member/myPage");
	}
	
	@RequestMapping("/usr/member/showQuestion")
	public String showQuestionForm(HttpServletRequest req, String loginId, String loginPw, String name, String nickname) {
	    req.setAttribute("loginId", loginId);
	    req.setAttribute("loginPw", loginPw);
	    req.setAttribute("name", name);
	    req.setAttribute("nickname", nickname);
	    return "usr/member/questionForm";
	}

	@RequestMapping("/usr/member/doQuestion")
	@ResponseBody
	public String doQuestion(HttpServletRequest req, String Question1, String Question2, String Question3, String Question4) {
	    // 세션에서 저장된 정보를 가져옵니다.
	    HttpSession session = req.getSession();
	    String loginId = (String) session.getAttribute("loginId");
	    String loginPw = (String) session.getAttribute("loginPw");
	    String name = (String) session.getAttribute("name");
	    String nickname = (String) session.getAttribute("nickname");

	    // 문제를 올바르게 푼 경우, 회원가입 로직 수행
	    ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name, nickname);

	    if (joinRd.isFail()) {
	        return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
	    }

	    // 회원가입이 성공하면 로그인 페이지로 이동합니다.
	    return Ut.jsReplace(joinRd.getResultCode(), joinRd.getMsg(), "../member/login");
	}
}