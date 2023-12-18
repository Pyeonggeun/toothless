<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<script>

// 이력서 가져오기
function getResumeDto(resume_pk){
	const url = "./getResumeDto?resume_pk="+ resume_pk;
	
	fetch(url)
	.then(response => response.json())
	.then(response => {
		const resumeWrapper = document.querySelector("#previewResume .resumeWrapper");
		
		const resumeTitle = resumeWrapper.querySelector(".resumeTitle");
		resumeTitle.innerText = response.data.resume_title;
		
		const coverWrapper = document.querySelector("#previewResume .coverWrapper");
		const coverLetter = coverWrapper.querySelector(".coverLetter");
		coverLetter.innerText = response.data.cover_letter;
		
		
	});
}
// 경력 
function getCareerDto(resume_pk){
	const url = "./getCareerDto?resume_pk="+ resume_pk;
	
	fetch(url)
	.then(response => response.json())
	.then(response => { 
		
		const careerCategoryBox =
			document.getElementById("careerCategoryBox");
			careerCategoryBox.innerHTML = "";
		
		for(e of response.data){
			
			const careerWrapper = document.querySelector("#careerTemplete .careerWrapper").cloneNode(true);
			const careerCategory = careerWrapper.querySelector(".careerCategory");
			careerCategory.innerText = e.careerName.career_category_name;
			
			const careerContents = careerWrapper.querySelector(".careerContents");
			console.log(e.careerDto.career_contents);
			careerContents.innerText = e.careerDto.career_contents;
		
			careerCategoryBox.appendChild(careerWrapper);
			
		}
		
	});
}
// 자격증 가져오기
function getLicenseDto(resume_pk){
	const url = "./getLicenseDto?resume_pk="+ resume_pk;
	
	fetch(url)
	.then(response => response.json())
	.then(response => {
		
		const licenseBox =
			document.getElementById("licenseBox");
			licenseBox.innerHTML = "";
			
		for(e of response.data){
			
			const licenseWrapper = document.querySelector("#licenseTemplete .licenseWrapper").cloneNode(true);
			
			const licenseName = licenseWrapper.querySelector(".licenseName");
			licenseName.innerText = e.lic_name;
			
			const gainYear = licenseWrapper.querySelector(".gainYear");
			gainYear.innerText = e.lic_gain_year;
			
			const gainMonth = licenseWrapper.querySelector("gainMonth");
			gainMonth.innerText = e.lic_gain_month;
			
			const center = licenseWrapper.querySelector("center");
			center.innerText = e.lic_center;
			
			licenseBox.appendChild(licenseWrapper);
		}	
			
			
	});
}

// 이력서 미리보기 
function showResume(resume_pk){
    // 필요시 여기서 백엔드하고 연동... CSR
	
    const modal = bootstrap.Modal.getOrCreateInstance("#previewResume");
    
    getResumeDto(resume_pk);
    getCareerDto(resume_pk);
    getLicenseDto(resume_pk);

    modal.show();
    // show 하면 뜨고 hide 하면 닫힘
}



</script>




</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- 가족기업 뱃지 달기 -->
			<div class="col">
				<jsp:include page="../common/companyTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img  class="opacity-55" src="../../resources/img/employment/companyBanner.png" style="width: 117rem; height : 30rem;">
			</div>		
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 가운데 여백--%>	
			<div class="col-2"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-4 pb-3 border-bottom border-3">공개된 이력서 목록</div>
				</div>
			<%-- 	<div class="row mt-4 pb-3 border-bottom border-3 border-dark">
					<div class="col-1 pt-1">
						총 <span class="fw-bold"></span>건
					</div>
				</div> --%>
				<div class="row mt-3 text-secondary border-bottom border-dark border-2">
					
					<div class="col-1"></div>
					<div class="col-8 ms-1 fw-bold ">이력서 제목</div>
					<div class="col ms-1 fw-bold">상세보기</div>
					<div class="col-1"></div>
				</div>
				<div class="row border mb-4">
					<div class="col">
						<c:forEach items="${resumeList }" var="list">
							<div class="row border-bottom">
								<div class="col-1"></div>
								<div class="col-8 p-3 fw-bold fs-4">
									${list.resume_title }
								</div>
								<div class="col p-3 ms-1">
									<button onclick="showResume(${list.resume_pk})" type="button" class="btn btn-outline-dark">선택</button>
								</div>
								<div class="col-1"></div>
							</div> 
						</c:forEach>	
					</div>
				</div>
				
					
				
				
				
				
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
	</div>
	
<!--이력서 미리보기 Modal -->
<div class="modal fade" id="previewResume" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">이력서 미리보기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="resumeWrapper row border border-top">
			<div class="col p-3 ms-2">
				
				<div class="row border-bottom border-gray">
					<div class="resumeTitle col fs-1">이력서 제목</div>
				</div>
				<div class="row mt-1">
					<div class="col">이름 : ${sessionStudentInfo.name }</div>
					<div class="col">성별 : ${sessionStudentInfo.gender }</div>
					<div class="col">
						생일 : <fmt:formatDate value="${sessionStudentInfo.birth }" pattern="yyyy-MM-dd"/>
					</div>
				</div>
				<div class="row">
					<div class="col">주소 : ${sessionStudentInfo.address }</div>
				</div>
				<div class="row">
					<div class="col">핸드폰 번호 : ${sessionStudentInfo.phone }</div>
					<div class="col">이메일 주소 : ${sessionStudentInfo.email }</div>
				</div>
			</div>
		</div>
		
		<div class="coverWrapper row mt-4 border border-top">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">자소서</div>
				</div>
				<div class="row">
					<div class="coverLetter col">자소서 내용</div>
				</div>
			</div>
		</div>
		
		<div class="row mt-4 border border-top">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">경력</div>
				</div>
				<div class="row  border-bottom">
					<div class="col fs-5">카테고리</div>
					<div class="col-10  border-start fs-5 text-center">내용</div>
				</div>
				
				<div class="row">
					<div id="careerCategoryBox" class="col"></div>
				</div>
			
			</div>
		</div>
		
		<div class="licenseWrapper row mt-4 border border-top">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">자격증</div>
				</div>
				<div class="row  border-bottom">
					<div class="col">자격증 명</div>
					<div class="col">취득 년도</div>
					<div class="col">취득 월</div>
					<div class="col">발급 기관</div>
				</div>
				
				<div class="row">
					<div id="licenseBox" class="col"></div>
				</div>
				
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        
      </div>
    </div>
  </div>
</div>

<!-- 경력 템플릿  -->
<div id="careerTemplete" class="d-none">
	<div class="careerWrapper row">
		<div class="col">
			<div class="row">
				<div class="careerCategory col"> 카테고리 명</div>
				<div class="careerContents col-10 border-start">경력 내용</div>
			</div>
		</div>
	</div>
</div>

<!-- 자격증 템플릿  -->
<div id="licenseTemplete" class="d-none">
	<div class="licenseWrapper row">
		<div class="col">
			<div class="row">
				<div class="licenseName col">자격증 명</div>
				<div class="gainYear col">취득 년</div>
				<div class="gianMonth col">취득 월</div>
				<div class="center col">발급 기관</div>
			</div>
		</div>
	</div>
</div>	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>