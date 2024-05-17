package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	@RequestMapping("/usr/home/main")
	public String showMain() {

		return "/usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {

		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/historicsitesmap")
	public String showHistoricSitesMap() {

		return "/usr/home/historicsitesmap";
	}
	
	@RequestMapping("/usr/home/museummap")
	public String showMuseumMap() {

		return "/usr/home/museummap";
	}

	@RequestMapping("/usr/home/personofthemonth")
	public String showPersonOfTheMonth() {

		return "/usr/home/personofthemonth";
	}
	
	@RequestMapping("/usr/home/personofthemonth2")
	public String showPersonOfTheMonth2() {

		return "/usr/home/personofthemonth2";
	}
	
	@ControllerAdvice
	public class GlobalExceptionHandler {

	    @ExceptionHandler(Exception.class)
	    @ResponseBody
	    public String handleException(Exception ex) {
	        // 예외 처리 로직을 여기에 작성
	        return "오류가 발생했습니다: " + ex.getMessage();
	    }
	}
}