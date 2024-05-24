package com.example.demo.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.Question;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private QuestionService questionService;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

		existsMember = getMemberByNickname(nickname);

		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)입니다", nickname));
		}

		memberRepository.join(loginId, loginPw, name, nickname);

		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입이 완료되었습니다.", "id", id);

	}

	private Member getMemberByNickname(String nickname) {
		return memberRepository.getMemberByNickname(nickname);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMember(int id) {
		return memberRepository.getMember(id);
	}
	
	public ResultData modifyWithoutPw(int loginedMemberId, String name, String nickname) {
		memberRepository.modifyWithoutPw(loginedMemberId, name, nickname);
		return ResultData.from("S-1", "회원정보 수정 완료");
	}
	
	public ResultData modify(int loginedMemberId, String loginPw, String name, String nickname) {
		memberRepository.modify(loginedMemberId, loginPw, name, nickname);
		return ResultData.from("S-1", "회원정보 수정 완료");
	}

	public boolean isIdOverlap(String loginId) {
		Member member = getMemberByLoginId(loginId);

		if (member == null) {

			return false;
		}
		return true;
	}

	public void updateMemberScore(Integer memberId, String[] userAnswers) {
        if (userAnswers == null) {
            userAnswers = new String[0];
        }

        Member member = getMember(memberId);
        List<String> correctAnswers = questionService.getAllQuestions().stream()
                                                     .map(Question::getAnswer)
                                                     .collect(Collectors.toList());

        // Check user's answers against correct answers
        int score = 0;
        for (int i = 0; i < userAnswers.length; i++) {
            if (correctAnswers.size() > i) {
                String userAnswer = userAnswers[i];
                String correctAnswer = correctAnswers.get(i);

                // Compare user's answer with the correct answer
                if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                    score++;
                }
            }
        }

        // Update the member's score
        member.setScore(score);
        memberRepository.updateMember(member);
    }
}