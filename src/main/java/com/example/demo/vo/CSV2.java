package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CSV2 {
	private int id;
	private String museumName;
	private String latitude;
	private String longitude;
	private String viewingHours;
	private String closedDays;
	private String admissionFee;
	private String exhibitionInformation;
	
}