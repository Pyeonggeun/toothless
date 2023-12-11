package com.mkfactory.toothless.e.dto;

public class RestResponseOfflineDto {
	
	private String result;
	private Object data;
	
	public RestResponseOfflineDto() {
		super();
	}

	public RestResponseOfflineDto(String result, Object data) {
		super();
		this.result = result;
		this.data = data;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
}
