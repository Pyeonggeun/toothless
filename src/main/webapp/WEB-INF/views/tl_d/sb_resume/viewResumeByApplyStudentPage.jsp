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

var job_posting_pk = ${job_posting_pk};

//이력서 가져오기
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
			
			const gainMonth = licenseWrapper.querySelector(".gainMonth");
			gainMonth.innerText = e.lic_gain_month;
			
			const center = licenseWrapper.querySelector(".center");
			center.innerText = e.lic_center;
			
			licenseBox.appendChild(licenseWrapper);
		}	
			
			
	});
}

// 이력서 미리보기 
function showResume(resume_pk){
    // 필요시 여기서 백엔드하고 연동... CSR
	
    const modal = bootstrap.Modal.getOrCreateInstance("#previewResume");
    
    getStudentInfoByResume(resume_pk);
    getResumeDto(resume_pk);
    getCareerDto(resume_pk);
    getLicenseDto(resume_pk);

    modal.show();
    // show 하면 뜨고 hide 하면 닫힘
}

function getStudentInfoByResume(resume_pk){
	const url = "./getStudentInfoByResume?resume_pk="+ resume_pk;
	
	fetch(url)
	.then(response => response.json())
	.then(response => {
		const resumeWrapper = document.querySelector("#previewResume .resumeWrapper");
		
		const stu_name = resumeWrapper.querySelector(".stu_name");
		stu_name.innerText = '이름 :' + response.data.name;
		
		const stu_gender = resumeWrapper.querySelector(".stu_gender");
		stu_gender.innerText = '성별 :' + response.data.gender;
		
		const stu_birth = resumeWrapper.querySelector(".stu_birth");
		const date = new Date(response.data.birth);
		stu_birth.innerText = '생일: ' + date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
		
		const stu_phone = resumeWrapper.querySelector(".stu_phone");
		stu_phone.innerText = '전화번호 :' + response.data.phone;
		
		const stu_email = resumeWrapper.querySelector(".stu_email");
		stu_email.innerText = '이메일 :' + response.data.email;
		
		const stu_address = resumeWrapper.querySelector(".stu_address");
		stu_address.innerText = '주소 :' + response.data.address;
		
	});
}


function getResumeListByApplyStudent(job_posting_pk){
	console.log(job_posting_pk);
	const url = "./getResumeListByApplyStudent?job_posting_pk=" + job_posting_pk;
	fetch(url)
	.then(response => response.json())
	.then(response => {
		
		const applyResumeListBox = document.getElementById("applyResumeListBox");
		applyResumeListBox.innerHTML = "";
		
		if(response.data.length ==0){
			applyResumeListBox.innerText = " 현재 공고에 지원한 이력서가 없습니다.";
			return;
		}
		for(e of response.data){
			
			const applyResumeWrapper = document.querySelector("#resumeListTemplete .applyResumeWrapper").cloneNode(true);
			
			
			const modal_resume_title = applyResumeWrapper.querySelector(".modal_resume_title");		
			modal_resume_title.innerText = e.resumeDto.resume_title;
			
			const modal_student_name = applyResumeWrapper.querySelector(".modal_student_name");
			modal_student_name.innerText = e.studentDto.name;
			
			const modal_department = applyResumeWrapper.querySelector(".modal_department");
			modal_department.innerText = e.department;
			
			const modal_select_resume = applyResumeWrapper.querySelector(".modal_select_resume");
			modal_select_resume.setAttribute("onclick","showResume("+e.resumeDto.resume_pk+")")
			
			applyResumeListBox.appendChild(applyResumeWrapper);
			
			
			
		}
	});
}





window.addEventListener("DOMContentLoaded", () => {
	getResumeListByApplyStudent(job_posting_pk);	
});

</script>




</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- 가족기업 뱃지 달기 -->
			<div class="col">
				<div class="row bg-body-white border-bottom mt-4 pb-0">
					<a class="col-1 pe-2 text-end navbar-brand" href="../common/companyMainPage">
		                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
		            </a>
		            <a class="col-4 ps-0 fw-bold fs-1 text-start navbar-brand" href="../common/companyMainPage">
		                MK University<span class="fs-6"> | </span> <span class="fs-5">취업지원센터</span> 
		            </a>
			    	<div class="col"></div>
			    	<div class="col-1 mt-5 pb-2 pe-0 text-secondary text-end">
						<%-- mainPage --%>
						<c:choose>
							<c:when test="${!empty sessionExternalInfo and company.companyDto.is_family_company=='Y'}">
								<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
									class="fw-bold nav-link dropdown-toggle" href="../../another/external/loginPage" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
										<span class="badge text-bg-info text-white me-1">Family</span>
										${company.companyDto.com_name} 님</a>
									<ul class="dropdown-menu">
										<li><a href="../common/companyLogoutProcess"
											class="dropdown-item">로그아웃</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${!empty sessionExternalInfo and company.companyDto.is_family_company=='N'}">
								<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
									class="fw-bold nav-link dropdown-toggle" href="../../another/external/loginPage" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
										${company.companyDto.com_name} 님</a>
									<ul class="dropdown-menu">
										<li><a href="../common/companyLogoutProcess"
											class="dropdown-item">로그아웃</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li style="list-style-type: none;" class="nav-item"><a href="../../another/external/loginPage"
									class="nav-link">로그인</a></li>
							</c:otherwise>
						</c:choose>
					</div>
			    	<div class="col-1 px-0"></div>
		   		</div>
		   		<div class="row text-center py-2 fw-bold text-light" style="background-color: #133369">
		            <div class="col-2"></div>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../ny_posting/myCompanyInterestListPage">관심기업체크리스트</a>
		            </div>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../ny_posting/myCompanyApplyStudentListPage">기업지원자리스트</a>
		            </div>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../ny_posting/jobPostingListForCompanyPage">채용공고리스트</a>
		            </div>
		            <c:if test="${company.companyDto.is_family_company=='Y'}">
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../sb_resume/publicResumeByStudentListPage">공개이력서리스트</a>
		            </div>	
		            </c:if>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href=" ../common/employmentMainPage">취업지원센터</a>
		            </div>
		            <div class="col-2"></div>
		        </div>
			</div>
		</div>
		<div class="row">
			<div class="col px-0">
				<img  class="opacity-55" src="../../resources/img/employment/companyBanner.png" style="width: 119rem; height : 30rem;">
			</div>		
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 가운데 여백--%>	
			<div class="col-2"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<div class="row">
					<div class="col-3 fs-4 fw-bold mt-4 pb-3 border-bottom border-3">지원한 이력서 목록</div>
					<div class="col fs-4 mt-4 pb-3">${jobPostingDto.posting_name }</div>
					<div class="col-3 text-center mt-4 pb-3">
						<a class="btn btn-outline-secondary" href="../common/companyMainPage" role="button">
							<i class="bi bi-house"></i>&nbsp;&nbsp;메인페이지로
						</a>
						<a class="btn btn-outline-secondary" href="../ny_posting/jobPostingDetailForCompanyPage?id=${job_posting_pk }" role="button">돌아가기</a>
					</div>
					
				</div>
				
				<div class="row py-2 text-secondary border-bottom border-dark border-2 text-light"  style="background-color: #133369">
					
					<div class="col-1"></div>
					<div class="col-6  fw-bold ">이력서 제목</div>
					<div class="col ms-1 fw-bold">이름</div>
					<div class="col ms-1 fw-bold">학과</div>
					<div class="col ms-1 fw-bold">상세보기</div>
					<div class="col-1"></div>
				</div>
					
				<div class="row border mb-4">
					<div class="col" id="applyResumeListBox">
						<%-- 이력서 리스트 나오는 자리 --%>	
					</div>
				</div>
				
				
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
		
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>
	
<div id="resumeListTemplete" class="d-none">
	<div class="applyResumeWrapper row border-bottom">
		<div class="col-1"></div>
		<div class="modal_resume_title col-6 p-3 fw-bold fs-5 ">이력서제목</div>
		<div class="modal_student_name col p-3 ms-1 ">학생이름</div>
		<div class="modal_department col p-3 ms-1 ">학과이름</div>
		<div class="col p-3 ms-1">
		<button  type="button" class="modal_select_resume btn btn-outline-dark">상세보기</button>
		</div>
		<div class="col-1"></div>
	</div> 
</div>						
					
<!--이력서 미리보기 Modal -->
<div class="modal fade" id="previewResume" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">이력서 상세보기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="resumeWrapper row border border-top">
			<div class="col p-3 ms-2">
				
				<div class="row border-bottom border-gray">
					<div class="resumeTitle col fs-1">이력서 제목</div>
				</div>
				<div class="row ms-2 mt-1">
							
					<div class="stu_name col">이름 : ${sessionStudentInfo.name }</div>
					<div class="stu_gender col">성별 : ${sessionStudentInfo.gender }</div>
					<div class="stu_birth col">
						생일 : <fmt:formatDate value="${sessionStudentInfo.birth }" pattern="yyyy-MM-dd"/>
					</div>
					
					<div class="col-1"></div>
				</div>
				<div class="row ms-2 mt-2">
					<div class="stu_phone col">핸드폰 번호 : ${sessionStudentInfo.phone }</div>
					<div class="stu_email col">이메일 주소 : ${sessionStudentInfo.email }</div>
					<div class="col"></div>
					<div class="col-1"></div>
				</div>
				<div class="row ms-2 mt-2 mb-2">
					<div class="stu_address col">주소 : ${sessionStudentInfo.address }</div>
					<div class="col-1"></div>
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
				<div class="gainMonth col">취득 월</div>
				<div class="center col">발급 기관</div>
			</div>
		</div>
	</div>
</div>	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>