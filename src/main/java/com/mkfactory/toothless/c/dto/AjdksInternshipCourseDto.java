package com.mkfactory.toothless.c.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AjdksInternshipCourseDto {

	public int internship_course_pk;
	public int company_pk;
	public int professor_pk;
	public int department_pk;
	public String course_title;
	public int internship_total_member;
	public int semester_qualification;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date applying_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date applying_end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date internship_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date internship_end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date announcement_date;
	public Date created_at;

	public AjdksInternshipCourseDto() {
		super();
	}

	public AjdksInternshipCourseDto(int internship_course_pk, int company_pk, int professor_pk, int department_pk,
			String course_title, int internship_total_member, int semester_qualification, Date applying_start_date,
			Date applying_end_date, Date internship_start_date, Date internship_end_date, Date announcement_date,
			Date created_at) {
		super();
		this.internship_course_pk = internship_course_pk;
		this.company_pk = company_pk;
		this.professor_pk = professor_pk;
		this.department_pk = department_pk;
		this.course_title = course_title;
		this.internship_total_member = internship_total_member;
		this.semester_qualification = semester_qualification;
		this.applying_start_date = applying_start_date;
		this.applying_end_date = applying_end_date;
		this.internship_start_date = internship_start_date;
		this.internship_end_date = internship_end_date;
		this.announcement_date = announcement_date;
		this.created_at = created_at;
	}

	public int getInternship_course_pk() {
		return internship_course_pk;
	}

	public void setInternship_course_pk(int internship_course_pk) {
		this.internship_course_pk = internship_course_pk;
	}

	public int getCompany_pk() {
		return company_pk;
	}

	public void setCompany_pk(int company_pk) {
		this.company_pk = company_pk;
	}

	public int getProfessor_pk() {
		return professor_pk;
	}

	public void setProfessor_pk(int professor_pk) {
		this.professor_pk = professor_pk;
	}

	public int getDepartment_pk() {
		return department_pk;
	}

	public void setDepartment_pk(int department_pk) {
		this.department_pk = department_pk;
	}

	public String getCourse_title() {
		return course_title;
	}

	public void setCourse_title(String course_title) {
		this.course_title = course_title;
	}

	public int getInternship_total_member() {
		return internship_total_member;
	}

	public void setInternship_total_member(int internship_total_member) {
		this.internship_total_member = internship_total_member;
	}

	public int getSemester_qualification() {
		return semester_qualification;
	}

	public void setSemester_qualification(int semester_qualification) {
		this.semester_qualification = semester_qualification;
	}

	public Date getApplying_start_date() {
		return applying_start_date;
	}

	public void setApplying_start_date(Date applying_start_date) {
		this.applying_start_date = applying_start_date;
	}

	public Date getApplying_end_date() {
		return applying_end_date;
	}

	public void setApplying_end_date(Date applying_end_date) {
		this.applying_end_date = applying_end_date;
	}

	public Date getInternship_start_date() {
		return internship_start_date;
	}

	public void setInternship_start_date(Date internship_start_date) {
		this.internship_start_date = internship_start_date;
	}

	public Date getInternship_end_date() {
		return internship_end_date;
	}

	public void setInternship_end_date(Date internship_end_date) {
		this.internship_end_date = internship_end_date;
	}

	public Date getAnnouncement_date() {
		return announcement_date;
	}

	public void setAnnouncement_date(Date announcement_date) {
		this.announcement_date = announcement_date;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

}
