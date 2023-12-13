package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class ClinicPatientWaitDto {
	
	private int clinic_patient_wait_pk;
	private int clinic_patient_pk;
	private String status;
	private Date created_at;
	private Date completed_at;
	
	public ClinicPatientWaitDto() {
		super();
	}

	public ClinicPatientWaitDto(int clinic_patient_wait_pk, int clinic_patient_pk, String status, Date created_at,
			Date completed_at) {
		super();
		this.clinic_patient_wait_pk = clinic_patient_wait_pk;
		this.clinic_patient_pk = clinic_patient_pk;
		this.status = status;
		this.created_at = created_at;
		this.completed_at = completed_at;
	}

	public int getClinic_patient_wait_pk() {
		return clinic_patient_wait_pk;
	}

	public void setClinic_patient_wait_pk(int clinic_patient_wait_pk) {
		this.clinic_patient_wait_pk = clinic_patient_wait_pk;
	}

	public int getClinic_patient_pk() {
		return clinic_patient_pk;
	}

	public void setClinic_patient_pk(int clinic_patient_pk) {
		this.clinic_patient_pk = clinic_patient_pk;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getCompleted_at() {
		return completed_at;
	}

	public void setCompleted_at(Date completed_at) {
		this.completed_at = completed_at;
	}
}
