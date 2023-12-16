package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class TestQuestionDto {
	
	private int test_question_key;
	private int lecture_test_key;
	private String question;
	private int test_point;
	private int question_number;
	private Date created_at;
	
	public TestQuestionDto() {
		super();
	}

	public TestQuestionDto(int test_question_key, int lecture_test_key, String question, int test_point,
			int question_number, Date created_at) {
		super();
		this.test_question_key = test_question_key;
		this.lecture_test_key = lecture_test_key;
		this.question = question;
		this.test_point = test_point;
		this.question_number = question_number;
		this.created_at = created_at;
	}

	public int getTest_question_key() {
		return test_question_key;
	}

	public void setTest_question_key(int test_question_key) {
		this.test_question_key = test_question_key;
	}

	public int getLecture_test_key() {
		return lecture_test_key;
	}

	public void setLecture_test_key(int lecture_test_key) {
		this.lecture_test_key = lecture_test_key;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getTest_point() {
		return test_point;
	}

	public void setTest_point(int test_point) {
		this.test_point = test_point;
	}

	public int getQuestion_number() {
		return question_number;
	}

	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
