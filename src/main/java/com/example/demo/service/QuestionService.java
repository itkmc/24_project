package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.QuestionRepository;

@Service
public class QuestionService {

	@Autowired
	private QuestionRepository questionRepository; // 데이터베이스와 상호작용하는 Repository

	// 데이터베이스에서 문제의 정답을 가져오는 메소드
	public List<String> getCorrectAnswers() {
		return questionRepository.findCorrectAnswers();
	}

	public String getQuestion1() {
		return questionRepository.getQuestion1();
	}
}