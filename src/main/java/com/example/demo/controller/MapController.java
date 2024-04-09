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
import com.example.demo.vo.CSV2;

@Controller
public class MapController {

	@Autowired
	private MapRepository mapRepository;

	public MapController(MapRepository mapRepository) {
		this.mapRepository = mapRepository;
	}

	@GetMapping("usr/home/museummap")
	public String showMap2(Model model) {
		List<CSV2> csvList = mapRepository.selectList2();

		model.addAttribute("csvList", csvList);
		return "usr/home/museummap";
	}

	@GetMapping("usr/home/historicsitesmap")
	public String showMap(Model model) {
		List<CSV1> csvList = mapRepository.selectList1();

		model.addAttribute("csvList", csvList);
		return "usr/home/historicsitesmap";
	}

	private List<CSV1> csvList(String filePath) {
		List<CSV1> csvList1 = new ArrayList<>();
		try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
			String line;
			// 첫 줄은 헤더일 수 있으므로 스킵
			// br.readLine();
			while ((line = br.readLine()) != null) {
				String[] data = line.split(",");
				System.out.println("데이터 길이: " + data.length); // 데이터 배열의 길이 출력
				CSV1 csv = new CSV1();
				csv.setRuinsName(data[0]);
				csv.setLatitude(data[1]);
				csv.setLongitude(data[2]);
				csv.setImageLink(data[3]);
				csv.setDescription(data[4]);

				csvList1.add(csv);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return csvList1;
	}

	private List<CSV2> csvList2(String filePath) {
		List<CSV2> csvList2 = new ArrayList<>();
		try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
			String line;
			// 첫 줄은 헤더일 수 있으므로 스킵
			// br.readLine();
			while ((line = br.readLine()) != null) {
				String[] data = line.split(",");
				System.out.println("데이터 길이: " + data.length); // 데이터 배열의 길이 출력
				CSV2 csv = new CSV2();
				csv.setMuseumName(data[0]);
				csv.setLatitude(data[2]);
				csv.setLongitude(data[3]);
				csv.setViewingHours(data[4]);
				csv.setClosedDays(data[5]);
				csv.setAdmissionFee(data[6]);
				csv.setExhibitionInformation(data[7]);

				csvList2.add(csv);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return csvList2;
	}
}
