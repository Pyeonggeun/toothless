package com.mkfactory.toothless.a.dto;

public class SemesterDto {
	
	private int semester_pk;
	private String semester_year;
	private String semester;
	private String progress_state;
	
	
	public SemesterDto() {}


	public SemesterDto(int semester_pk, String semester_year, String semester, String progress_state) {
		
		this.semester_pk = semester_pk;
		this.semester_year = semester_year;
		this.semester = semester;
		this.progress_state = progress_state;
	}


	public int getSemester_pk() {
		return semester_pk;
	}


	public void setSemester_pk(int semester_pk) {
		this.semester_pk = semester_pk;
	}


	public String getSemester_year() {
		return semester_year;
	}


	public void setSemester_year(String semester_year) {
		this.semester_year = semester_year;
	}


	public String getSemester() {
		return semester;
	}


	public void setSemester(String semester) {
		this.semester = semester;
	}


	public String getProgress_state() {
		return progress_state;
	}


	public void setProgress_state(String progress_state) {
		this.progress_state = progress_state;
	}
	
	
	
	
	
	
	
	

}
