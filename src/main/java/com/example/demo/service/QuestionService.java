package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.QuestionRepository;
import com.example.demo.vo.Question;

@Service
public class QuestionService {

	@Autowired
	private QuestionRepository questionRepository;

	public QuestionService(QuestionRepository questionRepository) {
		this.questionRepository = questionRepository;
	}

	public int checkAnswers(int questionId, String userAnswers) {
	    // 데이터베이스에서 해당 질문의 정답을 가져옵니다.
	    Question question = questionRepository.getQuestionById(questionId);
	    String[] correctAnswers = question.getAnswer().split(","); // 정답 문자열을 배열로 분할합니다.

	    // 사용자의 답변을 배열로 분할합니다.
	    String[] userAnswersArray = userAnswers.split(",");

	    // 점수를 초기화합니다.
	    int score = 0;

	    // 사용자의 답변을 올바른 답변과 비교합니다.
	    for (int i = 0; i < correctAnswers.length; i++) {
	        // 인덱스가 두 배열의 범위 내에 있는지 확인합니다.
	        if (i < userAnswersArray.length && i < correctAnswers.length) {
	            // 사용자의 답변이 올바른 답변과 일치하는지 확인합니다 (대소문자 구분 없음)
	            if (correctAnswers[i].equalsIgnoreCase(userAnswersArray[i])) {
	                // 답변이 일치하면 점수를 증가시킵니다.
	                score++;
	            }
	        } else {
	            // 사용자의 답변 수와 올바른 답변 수가 일치하지 않는 경우를 처리합니다.
	            return -1; // 오류를 나타내는 -1을 반환합니다.
	        }
	    }

	    // 점수를 반환합니다.
	    return score;
	}
}