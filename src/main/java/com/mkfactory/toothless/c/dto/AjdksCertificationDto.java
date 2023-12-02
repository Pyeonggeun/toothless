package com.mkfactory.toothless.c.dto;

public class AjdksCertificationDto {
	
	public int certification_pk;
	public int student_pk;
	public String certification_name;
	public String certification_acquisition_date;
	public String certification_file;
	
	public AjdksCertificationDto() {
		super();
	}

	public AjdksCertificationDto(int certification_pk, int student_pk, String certification_name,
			String certification_acquisition_date, String certification_file) {
		super();
		this.certification_pk = certification_pk;
		this.student_pk = student_pk;
		this.certification_name = certification_name;
		this.certification_acquisition_date = certification_acquisition_date;
		this.certification_file = certification_file;
	}

	public int getCertification_pk() {
		return certification_pk;
	}

	public void setCertification_pk(int certification_pk) {
		this.certification_pk = certification_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public String getCertification_name() {
		return certification_name;
	}

	public void setCertification_name(String certification_name) {
		this.certification_name = certification_name;
	}

	public String getCertification_acquisition_date() {
		return certification_acquisition_date;
	}

	public void setCertification_acquisition_date(String certification_acquisition_date) {
		this.certification_acquisition_date = certification_acquisition_date;
	}

	public String getCertification_file() {
		return certification_file;
	}

	public void setCertification_file(String certification_file) {
		this.certification_file = certification_file;
	}
	
}
