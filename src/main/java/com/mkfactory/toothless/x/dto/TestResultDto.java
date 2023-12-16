package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class TestResultDto {
	
	private int test_result_key;
	private int lecture_student_key;
	private int question_choice_key;
	private int lecture_test_key;
	private Date created_at;
	
	public TestResultDto() {
		super();
	}

	public TestResultDto(int test_result_key, int lecture_student_key, int question_choice_key, int lecture_test_key,
			Date created_at) {
		super();
		this.test_result_key = test_result_key;
		this.lecture_student_key = lecture_student_key;
		this.question_choice_key = question_choice_key;
		this.lecture_test_key = lecture_test_key;
		this.created_at = created_at;
	}

	public int getTest_result_key() {
		return test_result_key;
	}

	public void setTest_result_key(int test_result_key) {
		this.test_result_key = test_result_key;
	}

	public int getLecture_student_key() {
		return lecture_student_key;
	}

	public void setLecture_student_key(int lecture_student_key) {
		this.lecture_student_key = lecture_student_key;
	}

	public int getQuestion_choice_key() {
		return question_choice_key;
	}

	public void setQuestion_choice_key(int question_choice_key) {
		this.question_choice_key = question_choice_key;
	}

	public int getLecture_test_key() {
		return lecture_test_key;
	}

	public void setLecture_test_key(int lecture_test_key) {
		this.lecture_test_key = lecture_test_key;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
