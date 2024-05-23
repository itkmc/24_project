package com.example.demo.service;

import com.example.demo.repository.QuestionRepository;
import com.example.demo.vo.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    public List<Question> getAllQuestions() {
        // Fetch all questions from the database
        return questionRepository.findAll();
    }
}