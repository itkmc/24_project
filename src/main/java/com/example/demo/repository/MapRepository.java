package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.CSV1;

@Mapper
public interface MapRepository {

	@Select("""
			SELECT *
			from csv1
			""")
	List<CSV1> selectList1();

}