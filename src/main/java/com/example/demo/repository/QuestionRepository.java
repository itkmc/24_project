package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Question;

@Mapper
public interface QuestionRepository {

	@Select("""
			SELECT answer
			from question
			""")
	public List<String> findCorrectAnswers();

	@Select("""
			SELECT answer
			FROM question
			WHERE id =1
			""")
	public String getQuestion1();

	@Select ("""
			SELECT * 
			FROM question 
			WHERE id = #{questionId}
			""")
	public Question getQuestionById(int questionId);

}
