package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class PrescriptionDto {

	private int prescription_pk;
	private int clinic_patient_log_pk;
	private int medicine_code_pk;
	private int quantity;
	private Date created_at;
	
	public PrescriptionDto() {
		super();
	}

	public PrescriptionDto(int prescription_pk, int clinic_patient_log_pk, int medicine_code_pk, int quantity,
			Date created_at) {
		super();
		this.prescription_pk = prescription_pk;
		this.clinic_patient_log_pk = clinic_patient_log_pk;
		this.medicine_code_pk = medicine_code_pk;
		this.quantity = quantity;
		this.created_at = created_at;
	}

	public int getPrescription_pk() {
		return prescription_pk;
	}

	public void setPrescription_pk(int prescription_pk) {
		this.prescription_pk = prescription_pk;
	}

	public int getClinic_patient_log_pk() {
		return clinic_patient_log_pk;
	}

	public void setClinic_patient_log_pk(int clinic_patient_log_pk) {
		this.clinic_patient_log_pk = clinic_patient_log_pk;
	}

	public int getMedicine_code_pk() {
		return medicine_code_pk;
	}

	public void setMedicine_code_pk(int medicine_code_pk) {
		this.medicine_code_pk = medicine_code_pk;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
