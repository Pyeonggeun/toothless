package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class ClinicPatientLogDto {

	private int clinic_patient_log_pk;
	private int clinic_patient_pk;
	private int staff_pk;
	private int disease_code_pk;
	private String content;
	private Date created_at;
	
	public ClinicPatientLogDto() {
		super();
	}

	public ClinicPatientLogDto(int clinic_patient_log_pk, int clinic_patient_pk, int staff_pk, int disease_code_pk,
			String content, Date created_at) {
		super();
		this.clinic_patient_log_pk = clinic_patient_log_pk;
		this.clinic_patient_pk = clinic_patient_pk;
		this.staff_pk = staff_pk;
		this.disease_code_pk = disease_code_pk;
		this.content = content;
		this.created_at = created_at;
	}

	public int getClinic_patient_log_pk() {
		return clinic_patient_log_pk;
	}

	public void setClinic_patient_log_pk(int clinic_patient_log_pk) {
		this.clinic_patient_log_pk = clinic_patient_log_pk;
	}

	public int getClinic_patient_pk() {
		return clinic_patient_pk;
	}

	public void setClinic_patient_pk(int clinic_patient_pk) {
		this.clinic_patient_pk = clinic_patient_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public int getDisease_code_pk() {
		return disease_code_pk;
	}

	public void setDisease_code_pk(int disease_code_pk) {
		this.disease_code_pk = disease_code_pk;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
