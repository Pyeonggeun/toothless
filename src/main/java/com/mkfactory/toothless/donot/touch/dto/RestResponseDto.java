package com.mkfactory.toothless.donot.touch.dto;

public class RestResponseDto {
	private String result;
	private Object data;
	
	public RestResponseDto() {
		super();
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
