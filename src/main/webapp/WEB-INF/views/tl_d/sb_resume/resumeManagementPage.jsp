<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>ResumeManagementPage</title>

<script>

	const student_pk = ${sessionStudentInfo.student_pk};
	
	/* function getSessionStudentId(){
		fetch("./getSessionStudentId")
		.then(response => response.json())
		.then(response => {
			student_pk = response.data;
			
		});
	} */
	
	// 일반이력서 목록 가져오기
	function reloadGeneralResumeList(){
		
		const url = "./getGeneralResumeList?student_pk=" + student_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const generalResumeListBox = document.getElementById("generalResumeListBox");
			generalResumeListBox.innerHTML = "";
		
			if(response.data.length ==0){
				generalResumeListBox.classList.add("py-3")
				
				generalResumeListBox.innerText ="등록된  이력서가 없습니다.";
				return;
			}
			
			
			
			for(e of response.data){
				
				const generalResumeWrapper = document.querySelector("#templeteGeneral .generalResumeWrapper").cloneNode(true);
				
				const generalResumeTitle = generalResumeWrapper.querySelector(".generalResumeTitle");
				generalResumeTitle.innerText = e.resume_title;
				
				
				const generalResumeDate = generalResumeWrapper.querySelector(".generalResumeDate");
				const date = new Date(e.created_at);
				generalResumeDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
				
				
				const generalResumeSelectMain = generalResumeWrapper.querySelector(".generalResumeSelectMain");
				generalResumeSelectMain.setAttribute("onclick","changeMainStatus("+e.resume_pk+")")
				
				const resumeDelete = generalResumeWrapper.querySelector(".resumeDelete");
				
				resumeDelete.setAttribute("onclick", "deleteResume("+e.resume_pk+")");
				generalResumeTitle.setAttribute("onclick","showResume("+e.resume_pk+")")
				if(student_pk == null || student_pk != e.student_pk){
					resumeDelete.remove();
				}
				
				generalResumeListBox.appendChild(generalResumeWrapper);
				
			}	
		});
				
	}
	
	// 메인 이력서 출력
	function reloadMainResume(){
		
		const url = "./getMainResume?student_pk=" + student_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const resumeDto = response.data;
			const mainResumeBox = document.getElementById("mainResumeBox");
			mainResumeBox.innerHTML = "";
			if(resumeDto == null){
				mainResumeBox.innerText ="등록된 메인 이력서가 없습니다.";
				return;
			}
			
			
			
			const mainResumeWrapper = document.querySelector("#templeteMain .mainResumeWrapper").cloneNode(true);
			
			const mainResumeTitle = mainResumeWrapper.querySelector(".mainResumeTitle");
			mainResumeTitle.innerText = resumeDto.resume_title;
			/* const e = document.createElement('button');
			e.classList.add("btn", "btn-outline-primary");
			e.innerText = "resumeDto.resume_title"; */
			
			const mainResumeDate =  mainResumeWrapper.querySelector(".mainResumeDate");  
			const date = new Date(resumeDto.created_at);
			mainResumeDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
			
			const mainResumeSelectPublic =  mainResumeWrapper.querySelector(".mainResumeSelectPublic");
			
			if(resumeDto.is_public == "N"){
				const c = document.createElement('button');
				c.classList.add("btn", "btn-outline-primary");
				c.innerText = "공개하기";
				mainResumeSelectPublic.appendChild(c);
			}else{
				const d = document.createElement('button');
				d.classList.add("btn", "btn-outline-danger");
				d.innerText = "비공개하기";
				mainResumeSelectPublic.appendChild(d);
			}
			
			const currentPublicStatus =  mainResumeWrapper.querySelector(".currentPublicStatus");
			
			if(resumeDto.is_public == "Y"){
				const a = document.createElement('button');
				a.classList.add("btn", "btn-outline-primary");
				a.disabled = true;
				a.innerText = "공개중";
				currentPublicStatus.appendChild(a);
			}else{
				const b = document.createElement('button');
				b.classList.add("btn", "btn-outline-danger");
				b.disabled = true;
				b.innerText = "비공개중";
				currentPublicStatus.appendChild(b);
			}
			
			
			const resumeDelete =  mainResumeWrapper.querySelector(".resumeDelete");
			//이력서 삭제
			resumeDelete.setAttribute("onclick", "deleteResume("+resumeDto.resume_pk+")");
			// 이력서 미리보기
			mainResumeTitle.setAttribute("onclick","showResume("+resumeDto.resume_pk+")")
			// 이력서 공개
			mainResumeSelectPublic.setAttribute("onclick","changePublicStatus("+resumeDto.resume_pk+")")
			
			
			
			
			mainResumeBox.appendChild(mainResumeWrapper);
			
		});
	}
	

	// 이력서 삭제
	function deleteResume(resume_pk){
		const url = "./deleteResume?resume_pk=" + resume_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			reloadGeneralResumeList();
			reloadMainResume();
		});
	}
	
	// 이력서 미리보기
	function previewResume(resume_pk){
		const url = "./previewResume?resume_pk=" + resume_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
		});
		
	}
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
				
				const gainMonth = licenseWrapper.querySelector(".gainMonth");
				gainMonth.innerText = e.lic_gain_month;
				
				const center = licenseWrapper.querySelector(".center");
				center.innerText = e.lic_center;
				
				licenseBox.appendChild(licenseWrapper);
			}	
				
				
		});
	}
	
	
	// 메인이력서 공개 비공개 선택
	function changePublicStatus(resume_pk){
		const url = "./changePublicStatus?resume_pk=" + resume_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			reloadGeneralResumeList();
			reloadMainResume();
			
		});
		
	}
	
	// 메인이력서 공개 비공개 선택
	function changeMainStatus(resume_pk){
		const url = "./changeMainStatus?resume_pk=" + resume_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			reloadGeneralResumeList();
			reloadMainResume();
			
		});
		
	}
	
	// 이력서 추가하기
	function addResume(){
		const resume_title = document.getElementById("resume_title");
		const titleValue = resume_title.value;
		
		const cover_letter = document.getElementById("cover_letter");
		const letterValue = cover_letter.value;
		
		const radioBox = document.querySelector(".radioBox");
		const main_resume = radioBox.querySelectorAll(".main_resume");
		
		let mainValue = "";
		
		main_resume.forEach((e) => {
            if(e.checked == true){
            	mainValue = e.value;
            }
         });
		
		
		
		const url = "./addResume";
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "resume_title=" + titleValue + "&cover_letter=" + letterValue + "&main_resume=" + mainValue
		})
		.then(response => response.json())
		.then(response => {
			reloadGeneralResumeList();
			reloadMainResume();
			
			
		});
		
		
	}
	// 이력서 추가
	function showModal(){
        // 필요시 여기서 백엔드하고 연동... CSR

		const resume_title = document.getElementById('resume_title');
		resume_title.value = "";
		const cover_letter = document.getElementById('cover_letter');
		cover_letter.value = "";
		
        const modal = bootstrap.Modal.getOrCreateInstance("#addResume");
        modal.show();
        // show 하면 뜨고 hide 하면 닫힘
    }
	// 이력서 추가 저장
	function save(){
        //  필요시 여기서 백엔드하고 연동... CSR

        const modal = bootstrap.Modal.getOrCreateInstance("#addResume");
        addResume();
        modal.hide();
        
    }
	
    // 모달 내용 초기화 안됨..
	function closeModal() {
		document.getElementById('main_resume').value = '';
		const resume_title = document.getElementById('resume_title');
		resume_title.innerText = "";
		document.getElementById('cover_letter').value = '';
		const modal = bootstrap.Modal.getOrCreateInstance("#addResume");
		modal.hide();
	   
	 }
	
    // 이력서 미리보기 
	function showResume(resume_pk){
        // 필요시 여기서 백엔드하고 연동... CSR
		
        const modal = bootstrap.Modal.getOrCreateInstance("#previewResume");
        
        getResumeDto(resume_pk);
        getCareerDto(resume_pk);
        getLicenseDto(resume_pk);
       	const aaa = document.querySelector(".aaa");
       	aaa.setAttribute("href", "./resumeDetailPage?resume_pk="+resume_pk);
       	const update_resume = document.querySelector(".update_resume");
       	update_resume.setAttribute("href", "./resumeUpdatePage?resume_pk="+resume_pk);
       	const update_career = document.querySelector(".update_career");
       	update_career.setAttribute("href", "./careerDetailPage?resume_pk="+resume_pk);
       	const update_license = document.querySelector(".update_license");
       	update_license.setAttribute("href", "./licenseDetailPage?resume_pk="+resume_pk);
        modal.show();
        // show 하면 뜨고 hide 하면 닫힘
    }
	<%-- 포워딩 방식으로 하고 싶을 때 a태그 걸고 링크 이동
	const showReview = reservationDataWrapper.querySelector(".showReview");
	showReview.setAttribute("href", "./counselReviewPage?reservation_id="+e.offlineReservationDto.id);
	--%>
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadGeneralResumeList();
		reloadMainResume();
	});


</script>

</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 pb-3 border-bottom border-3">이력서 목록</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col-6 fw-bold">제목(메인 이력서)</div>
							<div class="col fw-bold text-center">작성일</div>
							<div class="col fw-bold text-center">공개 여부</div>
							<div class="col fw-bold text-center">공개 선택</div>
							<div class="col fw-bold text-center">이력서 삭제</div>
						</div>
					</div>
				</div>
				
				
				<div class="row border-bottom ">
					<div id="mainResumeBox" class="col">
						<%-- 메인 이력서 나오는 위치 --%>

					</div>	
				</div>	
			
				
				
				<div class="row">
					<div class="col ">
						
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col-6 fw-bold">제목(추가 이력서)</div>
							<div class="col fw-bold text-center">작성일</div>
							
							<div class="col fw-bold text-center">메인이력서로 변경</div>
							<div class="col fw-bold text-center">이력서 삭제</div>
						</div>
						
						<div class="row border-bottom">
							<div id="generalResumeListBox" class="col">
								<%-- 이력서 목록 출력될 위치 --%>
							
							</div>						
						</div>
						
					</div>	
				</div>
				
				<div class="row mt-3">
					<div class="col-9"></div>
					<div class="col">
						<form action="../common/studentMyPage" method="post">
							<input type="hidden" name="student_pk" value="${sessionStudentInfo.student_pk }">
							<button type="submit" class="btn btn-outline-secondary">돌아가기</button>
						</form>
					</div>
					<div class="col">
						<!-- <form action="./resumeRegistrationPage" method="post">
							<button type="submit" class="btn btn-secondary">이력서 추가</button>
						</form> -->
						<button onclick="showModal()" type="button" class="btn btn-primary" data-bs-toggle="modal" >
						  이력서 추가
						</button>
					</div>
				</div>
				
				
			</div>
			
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
	
	<div id="templeteGeneral" class="d-none">
		<div class="generalResumeWrapper row border-top">
			<div class="col">
				<div class="row my-3">
					<div class="generalResumeTitle col-6 mt-1">이력서 제목</div>
					<div class="generalResumeDate col text-center mt-1">2023.12.07</div>
					
					<div class="generalResumeSelectMain col text-center">
						<button type="button" class="btn btn-outline-dark">선택</button>
					</div>
					<div class="resumeDelete col text-center">
						<button type="button" class="btn btn-outline-danger">삭제</button>
					</div> 
				</div>
			</div>
		</div>
	</div>
	
	<div id="templeteMain" class="d-none">
		<div class="mainResumeWrapper row">
			<div class="col">
				<div class="row my-3">
					<div class="mainResumeTitle col-6 mt-1"> 이력서 제목</div>
					<div class="mainResumeDate col text-center mt-1">2023.12.07</div>
					<div class="currentPublicStatus col text-center"></div>
					<div class="mainResumeSelectPublic col text-center"></div>
					<div class="resumeDelete col text-center">
						<button type="button" class="btn btn-outline-danger">삭제</button>
					</div> 
				</div>
			</div>
		</div>
	</div>
	
<!--이력서 추가 Modal -->
<div class="modal fade" id="addResume" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">이력서 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					
				<div class="row">
					<div class="col">
						
						<div class="row border border-top">
							<div class="col">
								<div class="row  border-bottom">
									<div class="col p-3 ms-2">
										<div class="row border-bottom border-gray">
											<div class="col fs-3">인적사항</div>
										</div>
									</div>
									<div class="row">
										<div class="col">이름 : ${sessionStudentInfo.name }</div>
									<div class="col">생일 : <fmt:formatDate value="${sessionStudentInfo.birth}" pattern="yy.MM.dd"/></div>
									<div class="col">성별 : ${sessionStudentInfo.gender }</div>
									<div class="col">이메일 : ${sessionStudentInfo.email }</div>
								</div>
								<div class="row mb-3">
									<div class="col">전화번호 : ${sessionStudentInfo.phone }</div>
									<div class="col">주소 : ${sessionStudentInfo.address }</div>
									</div>
								</div>
							</div>	
						</div>
								
						<div class="row mt-3 border border-top">
							<div class="col">
								<div class="row  border-bottom">
									<div class="col p-3 ms-2">
										<div class="row border-bottom border-gray">
											<div class="col fs-3">메인 이력서 선택</div>
										</div>
										<div class="row mt-2">
											<div class="radioBox col">
												<input class="main_resume" name="main_resume" type="radio" value="Y"> 메인이력서
												<input class="main_resume" name="main_resume" type="radio" value="N"> 추가이력서
												
											</div>
										</div>
									</div>	
								</div>
							</div>
						</div>				
							
							
						<div class="row mt-3 border border-top">
							<div class="col">
								<div class="row  border-bottom">
									<div class="col p-3 ms-2">
										<div class="row border-bottom border-gray">
											<div class="col fs-3">이력서 제목</div>
										</div>
										<div class="row mt-2">
											<div class="col">
											<textarea id="resume_title" name="resume_title" rows="2" cols="80"></textarea>
											</div>
										</div>
									</div>
									
									
								</div>
							</div>
						</div>				
							
						<div class="row mt-3 border border-top">
							<div class="col">
								<div class="row  border-bottom">
									<div class="col p-3 ms-2">
										<div class="row border-bottom border-gray">
											<div class="col fs-3">자소서</div>
										</div>
										<div class="row mt-2">
											<div class="col">
											<textarea id="cover_letter" name="cover_letter" rows="30" cols="80"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button onclick="save()" type="button" class="btn btn-primary">추가하기</button>
			</div>
		</div>
	</div>
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
				
				<div class="row mt-3 border-bottom border-gray">
					<div class="resumeTitle col fs-1">${resumeDto.resume_title }</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold">인적사항</div>
							
						</div>
					</div>
				</div>
				
				<div class="row border-bottom">
					<div class="col">
						<div class="row ms-2 mt-1">		
							<div class="col">이름 : ${sessionStudentInfo.name }</div>
							<div class="col">성별 : ${sessionStudentInfo.gender }</div>
							<div class="col">
								생일 : <fmt:formatDate value="${sessionStudentInfo.birth }" pattern="yyyy-MM-dd"/>
							</div>
							
							<div class="col-1"></div>
						</div>
						<div class="row ms-2 mt-2">
							<div class="col">핸드폰 번호 : ${sessionStudentInfo.phone }</div>
							<div class="col">이메일 주소 : ${sessionStudentInfo.email }</div>
							
							
						</div>
						<div class="row ms-2 mt-2 mb-2">
							<div class="col">주소 : ${sessionStudentInfo.address }</div>
							<div class="col-1"></div>
						</div>
					</div>
				</div>
				
				<div class="coverWrapper row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold">자소서</div>
							<div class="col-2">
								<a class="update_resume btn btn-outline-secondary"role="button"><i class="bi bi-pencil"></i>수정</a>
							</div>							
						</div>
						
						<div class="row border-bottom">
							<div class="coverLetter col "></div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold">경력 사항</div>
							<div class="col-2">
							<a class="update_career btn btn-outline-secondary"role="button"><i class="bi bi-pencil"></i>상세</a>
							</div>
						</div>
						<div class="row border-bottom border-2 border-gray pb-3 mt-5">
							<div class="col fw-bold">카테고리</div>
							<div class="col-10 fw-bold text-center">경력 내용</div>
						</div>
					</div>
				</div>	
				
				<div class="row border-bottom">
					<div id="careerCategoryBox" class="col"></div>
				</div>			
				
				<div class="row licenseWrapper">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold">자격증</div>
							<div class="col-2">
								<a class="update_license btn btn-outline-secondary"role="button"><i class="bi bi-pencil"></i>상세</a>
							</div>
						</div>
						<div class="row border-bottom border-2 border-gray pb-3 mt-5">
							<div class="col fw-bold">자격증 명</div>
							<div class="col fw-bold">취득 년도</div>
							<div class="col fw-bold">취득 월</div>
							<div class="col fw-bold">발급 기관</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div id="licenseBox" class="col"></div>
				</div>
				
				
				
				
				<%-- <div class="row border-bottom border-gray">
					<div class="resumeTitle col fs-1">이력서 제목</div>
				</div>
				<div class="row ms-2 mt-1">
							
					<div class="col">이름 : ${sessionStudentInfo.name }</div>
					<div class="col">성별 : ${sessionStudentInfo.gender }</div>
					<div class="col">
						생일 : <fmt:formatDate value="${sessionStudentInfo.birth }" pattern="yyyy-MM-dd"/>
					</div>
					
					<div class="col-1"></div>
				</div>
				<div class="row ms-2 mt-2">
					<div class="col">핸드폰 번호 : ${sessionStudentInfo.phone }</div>
					<div class="col">이메일 주소 : ${sessionStudentInfo.email }</div>
					<div class="col"></div>
					<div class="col-1"></div>
				</div>
				<div class="row ms-2 mt-2 mb-2">
					<div class="col">주소 : ${sessionStudentInfo.address }</div>
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
				<div class="row  border-bottom text-light"  style="background-color: #133369">
					<div class="col fs-5">카테고리</div>
					<div class="col-10  border-start fs-5 text-center">내용</div>
				</div>
				
				<div class="row border-bottom">
					<div id="careerCategoryBox" class="col"></div>
				</div>
			
			</div>
		</div>
		
		<div class="licenseWrapper row mt-4 border border-top">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">자격증</div>
				</div>
				<div class="row  border-bottom text-light" style="background-color: #133369">
					<div class="col">자격증 명</div>
					<div class="col">취득 년도</div>
					<div class="col">취득 월</div>
					<div class="col">발급 기관</div>
				</div>
				
				<div class="row">
					<div id="licenseBox" class="col"></div>
				</div>--%>
				
			</div>
		</div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <form action="./resumeDetailPage">
        	<input type="hidden" name="resume_pk" value="">
        </form>
        <a class="aaa btn btn-primary" role="button">상세보기</a>
      </div>
    </div>
  </div>
</div>

<!-- 경력 템플릿  -->
<div id="careerTemplete" class="d-none">
	<div class="careerWrapper row">
		<div class="col">
			<div class="row border-bottom mt-3">
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