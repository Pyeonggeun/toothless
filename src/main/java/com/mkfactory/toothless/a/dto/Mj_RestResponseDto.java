package com.mkfactory.toothless.a.dto;

import java.util.*;

public class Mj_RestResponseDto {
	
		private String result;  // 성공여부
		private Map<String, Object> data;
		
		
		public Mj_RestResponseDto() {
	        this.data = new HashMap<>();
	    }
		
		public String getResult() {
			return result;
		}
		public void setResult(String result) {
			this.result = result;
		}
		public Map<String, Object> getData() {
			return data;
		}
		public void setData(Map<String, Object> data) {
			this.data = data;
		}
		
		
		// 추가 데이터를 담기 위한..
	    public void addData(String key, Object value) {
	    	
	        this.data.put(key, value);
	    }
	  
	  
	  

}
