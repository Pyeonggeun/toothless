package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class LectureInfoDto {
	
	private int lecture_info_key;
	private int lecture_category_key;
	private String name;
	private int total_hour;
	private int credit;
	private int essential_attendance;
	private int essential_grade;
	private String study_target;
	private String need_knowledge;
	private String study_goal;
	private String study_content;
	private Date created_at;
	
	
	public LectureInfoDto() {}


	public LectureInfoDto(int lecture_info_key, int lecture_category_key, String name, int total_hour, int credit,
			int essential_attendance, int essential_grade, String study_target, String need_knowledge,
			String study_goal, String study_content, Date created_at) {
	
		this.lecture_info_key = lecture_info_key;
		this.lecture_category_key = lecture_category_key;
		this.name = name;
		this.total_hour = total_hour;
		this.credit = credit;
		this.essential_attendance = essential_attendance;
		this.essential_grade = essential_grade;
		this.study_target = study_target;
		this.need_knowledge = need_knowledge;
		this.study_goal = study_goal;
		this.study_content = study_content;
		this.created_at = created_at;
	}


	public int getLecture_info_key() {
		return lecture_info_key;
	}


	public void setLecture_info_key(int lecture_info_key) {
		this.lecture_info_key = lecture_info_key;
	}


	public int getLecture_category_key() {
		return lecture_category_key;
	}


	public void setLecture_category_key(int lecture_category_key) {
		this.lecture_category_key = lecture_category_key;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getTotal_hour() {
		return total_hour;
	}


	public void setTotal_hour(int total_hour) {
		this.total_hour = total_hour;
	}


	public int getCredit() {
		return credit;
	}


	public void setCredit(int credit) {
		this.credit = credit;
	}


	public int getEssential_attendance() {
		return essential_attendance;
	}


	public void setEssential_attendance(int essential_attendance) {
		this.essential_attendance = essential_attendance;
	}


	public int getEssential_grade() {
		return essential_grade;
	}


	public void setEssential_grade(int essential_grade) {
		this.essential_grade = essential_grade;
	}


	public String getStudy_target() {
		return study_target;
	}


	public void setStudy_target(String study_target) {
		this.study_target = study_target;
	}


	public String getNeed_knowledge() {
		return need_knowledge;
	}


	public void setNeed_knowledge(String need_knowledge) {
		this.need_knowledge = need_knowledge;
	}


	public String getStudy_goal() {
		return study_goal;
	}


	public void setStudy_goal(String study_goal) {
		this.study_goal = study_goal;
	}


	public String getStudy_content() {
		return study_content;
	}


	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
}
