package com.mkfactory.toothless.a.dto;

import java.util.Date;

public class CallAbsenceDto {
	
	private int call_absence_pk;
	private int executive_management_pk;
	private Date created_at;
	
	
	public CallAbsenceDto() {}


	public CallAbsenceDto(int call_absence_pk, int executive_management_pk, Date created_at) {
		
		this.call_absence_pk = call_absence_pk;
		this.executive_management_pk = executive_management_pk;
		this.created_at = created_at;
	}


	public int getCall_absence_pk() {
		return call_absence_pk;
	}


	public void setCall_absence_pk(int call_absence_pk) {
		this.call_absence_pk = call_absence_pk;
	}


	public int getExecutive_management_pk() {
		return executive_management_pk;
	}


	public void setExecutive_management_pk(int executive_management_pk) {
		this.executive_management_pk = executive_management_pk;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
}
