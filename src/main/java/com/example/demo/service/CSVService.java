package com.example.demo.service;

import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CSVRepository;
import com.example.demo.vo.CSV1;
import com.example.demo.vo.CSV2;
import com.opencsv.CSVReader;

@Service
public class CSVService {

    @Autowired
    private CSVRepository csvRepository;

    public String readAndSaveToDB() {
        try {
            List<CSV1> csvList = new ArrayList<>();

            // 예시 파일들을 배열에 추가
            String[] fileNames = {"test1.csv"};
            

            for (String fileName : fileNames) {
                InputStreamReader is = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("CSV/" + fileName), "EUC-KR");
                CSVReader reader = new CSVReader(is);

                // 첫 번째 줄(헤더) 건너뛰기
                reader.skip(1);

                List<String[]> list = reader.readAll();

                for (String[] csvRow : list) {
                    CSV1 csv = new CSV1();
                    // 엔터티의 필드에 CSV 데이터를 할당
                    csv.setRuinsName(csvRow[0]); 
                    csv.setLatitude(csvRow[2]);
                    csv.setLongitude(csvRow[3]);
                    csv.setImageLink(csvRow[5]);
                    csv.setDescription(csvRow[6]);

                    csvList.add(csv);
                }
            }

            // CSV 데이터를 데이터베이스에 저장
            csvRepository.insertCSVList1(csvList);

            return "CSV 데이터가 성공적으로 데이터베이스에 저장되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            return "CSV 데이터를 데이터베이스에 저장하는 중 오류가 발생했습니다.";
        }
    }

    public String readAndSaveToDB2() {
        try {
            List<CSV2> csvList2 = new ArrayList<>();

            // 예시 파일들을 배열에 추가
            String[] fileNames = {"test2.csv"};
            

            for (String fileName : fileNames) {
                InputStreamReader is = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("CSV/" + fileName), "EUC-KR");
                CSVReader reader = new CSVReader(is);

                // 첫 번째 줄(헤더) 건너뛰기
                reader.skip(1);

                List<String[]> list = reader.readAll();

                for (String[] csvRow : list) {
                    CSV2 csv2 = new CSV2();
                    // 엔터티의 필드에 CSV 데이터를 할당
                    csv2.setMuseumName(csvRow[0]); 
                    csv2.setLatitude(csvRow[2]);
                    csv2.setLongitude(csvRow[3]);
                    csv2.setViewingHours(formatViewingHours(csvRow[4]));
                    csv2.setClosedDays(csvRow[5]);
                    csv2.setAdmissionFee(csvRow[6]);
                    csv2.setExhibitionInformation(csvRow[7]);


                    csvList2.add(csv2);
                }
            }
            
            System.err.println("csv");

            // CSV 데이터를 데이터베이스에 저장
            csvRepository.insertCSVList2(csvList2);

            return "CSV 데이터가 성공적으로 데이터베이스에 저장되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            return "CSV 데이터를 데이터베이스에 저장하는 중 오류가 발생했습니다.";
        }
    }

    private String formatViewingHours(String viewingHours) {
        // HTML 줄 바꿈 태그로 줄 바꿈을 유지하도록 \n 문자를 교체합니다.
        String formattedViewingHours = viewingHours.replaceAll("\n", "<br>");
        
        // JavaScript 구문 오류를 방지하기 위해 이중 인용부호를 이스케이프 처리합니다.
        formattedViewingHours = formattedViewingHours.replaceAll("\"", "\\\\\"");
        
        return formattedViewingHours;
    }
}