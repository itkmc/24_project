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
import com.example.demo.vo.CSV;

@Controller
public class MapController {

	@Autowired
	private MapRepository mapRepository;

	public MapController(MapRepository mapRepository) {
		this.mapRepository = mapRepository;
	}

	@GetMapping("usr/home/map")
	public String showMap(Model model) {
		List<CSV> csvList = mapRepository.selectList();

		model.addAttribute("csvList", csvList);
		return "usr/home/map";
	}

	private List<CSV> csvList(String filePath) {
		List<CSV> csvList = new ArrayList<>();
		try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
			String line;
			// 첫 줄은 헤더일 수 있으므로 스킵
			// br.readLine();
			while ((line = br.readLine()) != null) {
				String[] data = line.split(",");
				System.out.println("데이터 길이: " + data.length); // 데이터 배열의 길이 출력
				CSV csv = new CSV();
				csv.setRuinsname(data[0]);
				csv.setLatitude(data[1]);
				csv.setLongitude(data[2]);
				csv.setImagelink(data[3]);
				csv.setDescription(data[4]);

				csvList.add(csv);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return csvList;
	}
}
