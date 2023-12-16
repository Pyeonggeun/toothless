package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class QuestionChoiceDto {
	
	private int question_choice_key;
	private int test_question_key;
	private String choice;
	private String answer;
	private Date created_at;
	
	public QuestionChoiceDto() {
		super();
	}

	public QuestionChoiceDto(int question_choice_key, int test_question_key, String choice, String answer,
			Date created_at) {
		super();
		this.question_choice_key = question_choice_key;
		this.test_question_key = test_question_key;
		this.choice = choice;
		this.answer = answer;
		this.created_at = created_at;
	}

	public int getQuestion_choice_key() {
		return question_choice_key;
	}

	public void setQuestion_choice_key(int question_choice_key) {
		this.question_choice_key = question_choice_key;
	}

	public int getTest_question_key() {
		return test_question_key;
	}

	public void setTest_question_key(int test_question_key) {
		this.test_question_key = test_question_key;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
