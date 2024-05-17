package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HistoryController {
	
	@RequestMapping("/usr/history/main")
	public String showMain() {

		return "/usr/history/main";
	}
	
	@RequestMapping("/usr/history/goguryeo")
	public String showGoguryeo() {

		return "/usr/history/goguryeo";
	}

	@RequestMapping("/usr/history/baekjae")
	public String showBaekjae() {

		return "/usr/history/baekjae";
	}
	
	@RequestMapping("/usr/history/silla")
	public String showSilla() {

		return "/usr/history/silla";
	}
}
