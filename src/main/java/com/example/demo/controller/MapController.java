package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.repository.MapRepository;
import com.example.demo.vo.CSV1;

@Controller
public class MapController {

	@Autowired
	private MapRepository mapRepository;

	public MapController(MapRepository mapRepository) {
		this.mapRepository = mapRepository;
	}

	@GetMapping("usr/home/historicsitesmap")
	public String showMap(Model model) {
		List<CSV1> csvList = mapRepository.selectList1();

		model.addAttribute("csvList", csvList);
		return "usr/home/historicsitesmap";
	}

	
}
