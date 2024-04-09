package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CSV1 {
	private int id;
	private String ruinsName;
	private String latitude;
	private String longitude;
	private String imageLink;
	private String description;

}