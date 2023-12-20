<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <script>
        	<%--function modifyPostingContent(){
        		
        		const url = "./modifyJobPostingPage?id=" + data.jobPostingDto.jobPosting_pk;
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        		
        		const content = document.querySelector(".content");
        		
        		content.innerText = data.jobPostingDto.posting_contents;
        		
        		});
        	}
        	
        	window.addEventListener("DOMContentLoaded", () => {
        		modifyPostingContent();
        		
        		
        	});--%>
        	
        	<%-- 이미지 입력 알람 --%>
        	function formSubmit(){
        		const frm = document.getElementById("frm");
        		
        		const inputName = document.getElementById("inputName"); 
        		
        		if(inputName.value == ''){
        			alert("공고제목을 입력해주세요");
        			inputName.focus();
        			return;
        		}
        		
        	       		
        		const inputField = document.getElementById("inputField");
        		
        		if(inputField.value == '채용분야'){
        			alert("채용분야를 선택해주세요");
        			inputField.focus();
        			return;
        		}
        		
        		
        		const inputPosition = document.getElementById("inputPosition");
        		
        		if(inputPosition.value == ''){
        			alert("구인직무를 입력해주세요");
        			inputPosition.focus();
        			return;
        		}
        		
        		const inputImg = document.getElementById("inputImg"); 
        		
        		if(inputImg.value == ''){
        			alert("이미지를 입력해주세요");
        			inputImg.focus();
        			return;
        		}
        		
        		const inputHire = document.getElementById("inputHire");
        		
        		const hireValue = parseInt(inputHire.value, 10);

        		if (isNaN(hireValue) || inputHire.value.trim() === '') {
        		    alert("채용인원을 입력해주세요");
        		    inputHire.focus();
        		    return;
        		}
        		
        		const inputDate = document.getElementById("inputDate");

        		if (!inputDate.value || inputDate.value === 'yy-MM-dd') {
        		    alert("채용마감일을 입력해주세요");
        		    inputDate.focus();
        		    return;
        		}
        		<%-- form태그 전용 함수--%>
        		frm.submit();
        	}
        </script>
        
        
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-2">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 등록 양식 --%>
			<div class="col">
				<form id="frm" action="./modifyJobPostingProcess" method="post" enctype="multipart/form-data">
				<input name="job_posting_pk" type="hidden" value="${modifyJobPosting.jobPostingDto.job_posting_pk}">
				<%-- 채용공고 --%>
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고수정</div>
				</div>
				<%-- 공고 제목 --%>
				<div class="row mt-3">
					<div class="col">
						<input id="inputName" class="form-control form-control-sm border-black" name="posting_name" type="text" value="${modifyJobPosting.jobPostingDto.posting_name}">
					</div>
				</div>
				<%-- 채용분야 --%>
				<div class="row mt-3">
					<div class="col">
						<select id="inputField" class="form-select py-0 border-dark" name="job_field_category_pk">
						    <c:forEach items="${jobFieldCategory}" var="jobField">
						        <option value="${jobField.job_field_category_pk}" ${jobField.job_field_category_pk eq modifyJobPosting.jobFieldCategoryDto.job_field_category_pk ? 'selected' : ''}>
						            ${jobField.job_field_category_name}
						        </option>
						    </c:forEach>
						</select>
					</div>
					<div class="col-9"></div>
				</div>
				<%-- 구인직무 --%>
				<div class="row mt-3">
					<div class="col">
						<input id="inputPosition" class="form-control form-control-sm border-black" name="job_position" type="text" value="${modifyJobPosting.jobPostingDto.job_position}">
					</div>
				</div>
				<%-- 메인이미지 --%>
				<div class="row my-4">
					<div class="col">
						<input id="inputImg" class="form-control border-dark" name="modifyimage" type="file" accept="image/*">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<img src="../../resources/img/employment/${modifyJobPosting.jobPostingDto.posting_mainimage}">
					</div>				
				</div>
				<%-- 채용내용 --%>
				<div class="row mt-3">
					<div class="col fw-bold">
						채용내용
					</div>
				</div>
				<div class="row mt-2">
					<div class="col d-grid">
						<textarea class="form-control border-dark" name="posting_contents" rows="10">${modifyJobPosting.jobPostingDto.posting_contents}</textarea>						
					</div>
				</div>
				<%-- 우대사항 --%>
				<div class="row mt-3">
					<div class="col fw-bold">
						우대사항
					</div>
				</div>
				<div class="row mt-2">
					<div class="col d-grid">
						<textarea class="form-control border-dark" name="preference" rows="10">${modifyJobPosting.jobPostingDto.preference}</textarea>						
					</div>
				</div>
				<%-- 채용인원 --%>
				<div class="row mt-3">
					<div class="col fw-bold">
						채용인원
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<div class="row">
							<div class="col-9 pe-0">
								<input id="inputHire" class="form-control form-control-sm border-black" name="hire_number" type="text" value="${modifyJobPosting.jobPostingDto.hire_number}">
							</div>
							<div class="col pt-1">명</div>
						</div>
					</div>
					<div class="col-9"></div>
				</div>
				<%-- 채용 마감일 --%>
				<div class="row mt-3">
					<div class="col">
						<span class="fw-bold">기존 채용마감일</span> &nbsp;&nbsp;<fmt:formatDate value="${modifyJobPosting.jobPostingDto.posting_deadline}" pattern="yyyy-MM-dd"/>
					</div>
				</div> 
				<%-- 채용마감일 --%>
				<div class="row mt-3">
					<div class="col">
						<input id="inputDate" class="form-control form-control-sm border-black" name="posting_deadline" type="date" value="<fmt:formatDate value="${modifyJobPosting.jobPostingDto.posting_deadline}" pattern="yyyy-MM-dd"/>">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col"><a class="btn btn-secondary" href="./jobPostingListPage">목록으로</a></div>
					<div class="col-9"></div>
					<div class="col pe-0">
						<c:choose>
							<c:when test="${empty sessionStaffInfo}">
								<input class="btn btn-dark d-grid" type="button" value="공고수정" disabled>
							</c:when>
							<c:otherwise>
								<input class="btn btn-dark d-grid" type="button" onclick="formSubmit()" value="공고수정">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col"></div>
				</div>
				</form>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col"></div></div>
		<%-- futter --%>
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>