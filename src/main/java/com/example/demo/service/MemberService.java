package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.userAnswers;
import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.Question;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Object> join(String loginId, String loginPw, String name, String nickname) {

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
	
	private String calculateScore(List<String> userAnswers) {
	    // 여기에 점수 계산 로직 구현
	    int score = 0; // 예시로 점수를 계산하는 로직을 추가해야 함
	    
	    userAnswers
	    // 점수에 따라 회원의 등급을 결정합니다.
	    String grade;
	    if (score >= 8) {
	    	return  grade = "초고수";
	    } else if (score >= 4) {
	    	return grade = "중수";
	    } else {
	    	return  grade = "초보";
	    }
	}	

	public Object updateMember(String loginId, String grade) {
		return memberRepository.updateMember(loginId, grade);

	}

//	public Question question(String question1) {
//		return memberRepository.question(question1);
//	}
}