package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CSV1;
import com.example.demo.vo.CSV2;

@Mapper
public interface CSVRepository {

	@Insert({ "<script>", "INSERT INTO CSV1 (ruinsName, latitude, longitude, imageLink, description) VALUES ",
			"<foreach collection='csvList1' item='item' index='index' separator=','>",
			"(#{item.ruinsName},#{item.latitude}, #{item.longitude}, #{item.imageLink}, #{item.description})",
			"</foreach>", "</script>" })
	void insertCSVList1(List<CSV1> csvList1);

	@Insert({ "<script>",
			"INSERT INTO CSV2 (museumName, latitude, longitude, viewingHours, closedDays, admissionFee, exhibitionInformation) VALUES ",
			"<foreach collection='csvList2' item='item' index='index' separator=','>",
			"(#{item.museumName},#{item.latitude}, #{item.longitude}, #{item.viewingHours}, #{item.closedDays}, #{item.admissionFee}, #{item.exhibitionInformation})",
			"</foreach>", "</script>" })
	void insertCSVList2(List<CSV2> csvList2);
}