package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CSV {
	private int id;
	private String ruinsname;
	private String latitude;
	private String longitude;
	private String creationtime;
	
}