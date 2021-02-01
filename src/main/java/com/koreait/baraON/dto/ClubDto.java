package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ClubDto {

	private int c_no;			// 번호
	private String c_title;		// 클럽 제목
	private String c_content;	// 클럽 내용
	private Date c_postDate;	// 클럽 등록 날짜
	private Date c_startDate;	// 클럽 시작 날짜
	private Date c_endDate;  	// 클럽 종료 날짜
	private int c_min;			// 최소인원
	private int c_max;			// 최대인원
	private int c_count;		// 현재 인원
	private int c_totalClass;	// 총 클럽 진행 횟수
	private String mainThumnail;// 메인 화면 사진
	private String subThumbnail1;// 삽입시 화면 사진1
	private String subThumbnail2;// 삽입시 화면 사진2
	private String subThumbnail3;// 삽입시 화면 사진3
	private int c_money;		// 활동 비용
	
}
