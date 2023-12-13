package com.mkfactory.toothless.c.dto;

public class AjdksSelfIntroductionDto {
	
	private int self_introduction_pk;
	private int student_pk;
	private int self_introduction_img_pk;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	
	public AjdksSelfIntroductionDto() {
		super();
	}
	public AjdksSelfIntroductionDto(int self_introduction_pk, int student_pk, int self_introduction_img_pk,
			String answer1, String answer2, String answer3, String answer4) {
		super();
		this.self_introduction_pk = self_introduction_pk;
		this.student_pk = student_pk;
		this.self_introduction_img_pk = self_introduction_img_pk;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
	}
	public int getSelf_introduction_pk() {
		return self_introduction_pk;
	}
	public void setSelf_introduction_pk(int self_introduction_pk) {
		this.self_introduction_pk = self_introduction_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	public int getSelf_introduction_img_pk() {
		return self_introduction_img_pk;
	}
	public void setSelf_introduction_img_pk(int self_introduction_img_pk) {
		this.self_introduction_img_pk = self_introduction_img_pk;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getAnswer3() {
		return answer3;
	}
	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}
	public String getAnswer4() {
		return answer4;
	}
	public void setAnswer4(String answer4) {
		this.answer4 = answer4;
	}

	
	
}