package com.example.demo.repository;

import com.example.demo.vo.CSV;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CSVRepository {

	@Insert({ "<script>", "INSERT INTO CSV (ruinsname, latitude, longitude, creationtime) VALUES ",
			"<foreach collection='csvList' item='item' index='index' separator=','>",
			"(#{item.ruinsname},#{item.latitude}, #{item.longitude}, #{item.creationtime})", "</foreach>", "</script>" })
	void insertCSVList(List<CSV> csvList);

}