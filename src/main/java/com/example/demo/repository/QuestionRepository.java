package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Question;

@Mapper
public interface QuestionRepository {

	@Select("""
			SELECT *
			from question
			""")
	 public  List<Question> findAll();

}
