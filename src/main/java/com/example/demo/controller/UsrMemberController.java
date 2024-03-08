package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/usr/member/doJoin")
    public String doJoin(HttpServletRequest req, String loginId, String loginPw, String name, String nickname) {
        // 세션을 사용하여 데이터 저장할 필요가 없으므로 제거
        // HttpSession session = req.getSession();
        // session.setAttribute("loginId", loginId);
        // session.setAttribute("loginPw", loginPw);
        // session.setAttribute("name", name);
        // session.setAttribute("nickname", nickname);

        // 회원가입 폼에서 받은 데이터를 서비스로 전달하여 처리
        ResultData<Object> joinResult = memberService.join(loginId, loginPw, name, nickname);
        
        // 회원가입 성공 여부에 따라 처리
        if (joinResult.isSuccess()) {
            // 회원가입 성공 시 로그인 페이지로 이동 또는 다른 페이지로 이동하도록 처리
            return "redirect:/usr/member/login";
        } else {
            // 회원가입 실패 시 적절한 에러 메시지 출력 등의 처리
            // 여기서는 간단하게 회원가입 폼으로 리다이렉트
            return "redirect:/usr/member/join";
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
        return "usr/member/questionForm";
    }

    @RequestMapping("/usr/member/doQuestion")
    @ResponseBody
    public Map<String, Object> doQuestion(@RequestParam("answers[]") List<String> answers, String loginId,
            String loginPw, String name, String nickname, HttpServletRequest request) {
        List<String> correctAnswers = questionService.getCorrectAnswers();

        int correctCount = 0;
        for (int i = 0; i < answers.size(); i++) {
            if (answers.get(i).equalsIgnoreCase(correctAnswers.get(i))) {
                correctCount++;
            }
        }

        boolean isCorrect = (correctCount == answers.size());

        Map<String, Object> response = new HashMap<>();
        if (isCorrect) {
            HttpSession session = request.getSession();
            String sessionId = session.getId();
            ResultData<Object> joinResult = memberService.join(loginId, loginPw, name, nickname);
            response.put("success", joinResult.isSuccess());
            if (!joinResult.isSuccess()) {
                response.put("errorMsg", joinResult.getMsg());
            }
        } else {
            response.put("success", false);
            response.put("errorMsg", "답변이 일치하지 않습니다.");
        }
        return response;
    }
}
