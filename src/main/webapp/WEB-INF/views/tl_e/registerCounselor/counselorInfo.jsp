<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%-- 부트스트랩 아이콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%-- 구글폰트(Quicksand, Dongle, Gowun Dodum --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
<style>
*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
}

.title-text
{
	position: absolute;
	left: 23%;
	width: 100%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.tp-borderx
{
	border-width: 4px 4px 4px 4px;
	border-style: solid;
	border-color: #CEBEE1;
	border-radius: 15px;
}

.circle-border
{	
	border-width: 3px 3px 3px 3px; 
	border-style: solid; 
	border-radius: 50%;	
	border-bottom-color: #dcdcdc;	
}

/* 컨텐츠박스 CSS */
.contentBox
{
	background-color: white;
	border: 0;
	border-radius : 0.2rem;
}

</style>
<script>
let searchData = null;

reloadCounselorList()
reloadSearchTypeCategory()
//상담원 상세정보 조회모달
function showCounselorInfoModal(counselorId){
	
	//const counselorId = target.getAttribute("value");
	
	const url = "./showCounselorInfoModal?counselorId=" + counselorId;
	
	fetch(url)
	.then(response => response.json())
	.then(response => {
		
		const counselorDetail = response.data;
		
		const counselorPhoto = document.getElementById("counselorPhoto");
		counselorPhoto.setAttribute("src", "../../resources/img/counselorImage/" + counselorDetail.counselorDto.profileImage);
		
		const counselorName = document.getElementById("counselorName");
		counselorName.innerText = counselorDetail.counselorDto.name;			
		
		const counselorNo = document.getElementById("counselorNo");
		counselorNo.innerText = counselorDetail.counselorDto.id;
		
		const counselorAge = document.getElementById("counselorAge");
		counselorAge.innerText = counselorDetail.counselorDto.age;
		
		const counselorGender = document.getElementById("counselorGender");
		if(counselorDetail.counselorDto.gender == "M"){
			counselorGender.innerText = "남"	
		}else{
			counselorGender.innerText = "여"
		}
		
		
		const counselorPhoneNum = document.getElementById("counselorPhoneNum");
		counselorPhoneNum.innerText = counselorDetail.counselorDto.phonenumber;
		
		const counselorEmail = document.getElementById("counselorEmail");
		counselorEmail.innerText = counselorDetail.counselorDto.email;
		
		const counselorAddress = document.getElementById("counselorAddress");
		counselorAddress.innerText = counselorDetail.counselorDto.address;
		
		const counselorTypeRow = document.getElementById("counselorTypeRow");
		counselorTypeRow.innerHTML ="";
		const counselorTypeList = [...counselorDetail.counselorTypeList];
		for(e of counselorTypeList){				
			const counselorType = document.createElement("div");
			counselorType.setAttribute("class", "col-auto small border rounded-pill");				
			/* counselorType.classList.add("small");
			counselorType.classList.add("border");
			counselorType.classList.add("rounded-pill"); */
			counselorType.innerText = e.CATEGORYNAME;
			counselorTypeRow.appendChild(counselorType);
			
		}
		
		const counselorCareer = document.getElementById("counselorCareer");
		counselorCareer.innerText = counselorDetail.counselorDto.career;
		
		const counselorLicenseRow = document.getElementById("counselorLicenseRow");
		counselorLicenseRow.innerHTML = "";
		const counselorLicenseList = [...counselorDetail.counselorLicenseList];
		if(counselorLicenseList.length > 0){
			for(e of counselorLicenseList){
				const counselorLicenseWrapper = document.querySelector("#templete #counselorLicenseWrapper").cloneNode(true);
				const counselorLicense = counselorLicenseWrapper.querySelector("#counselorLicense");
				counselorLicense.setAttribute("src", "/toothless/resources/img/counselorImage/license/" + e.license);
				counselorLicenseRow.appendChild(counselorLicenseWrapper);
			}
		}
		else{
			const counselorLicenseWrapper = document.querySelector("#templete #counselorLicenseWrapper").cloneNode(true);
			counselorLicenseWrapper.innerHTML ="";
			const licenseNotExist = document.createElement("span");
			licenseNotExist.innerText = "- 등록된 자격증 정보가 없습니다. -"
			licenseNotExist.setAttribute("class", "fs-4");
			counselorLicenseWrapper.appendChild(licenseNotExist);
			counselorLicenseRow.appendChild(counselorLicenseWrapper);
		}
		
		const counselorScoreAvg = document.getElementById("counselorScoreAvg");
		counselorScoreAvg.innerText = counselorDetail.totalScoreInfo.TOTALAVG;
		const starRateIcon = document.getElementById("starRateIcon");
		starRateIcon.innerHTML = "";
		if(counselorDetail.totalScoreInfo.TOTALAVG >= 2.5){
			const goodRate = document.createElement("img");
			goodRate.setAttribute("src", "/toothless/resources/img/counselorImage/icon/goodRate.png");
			goodRate.setAttribute("class", "img-fluid");				
			starRateIcon.appendChild(goodRate);
			/* const goodRate = document.createElement("i");
			goodRate.setAttribute("class", "bi bi-emoji-sunglasses-fill");				
			starRateIcon.appendChild(goodRate); */
		}
		else{
			const badRate = document.createElement("img");
			badRate.setAttribute("src", "/toothless/resources/img/counselorImage/icon/badRate.png");				
			badRate.setAttribute("class", "img-fluid");				
			starRateIcon.appendChild(badRate);
			/* const badRate = document.createElement("i");
			badRate.setAttribute("class", "bi bi-emoji-expressionless-fill");				
			starRateIcon.appendChild(badRate); */
		}
		
		
		const star01 = document.getElementById("star01");
		star01.innerText = "(" + counselorDetail.totalScoreInfo.SCORE1 + ")";
		const star02 = document.getElementById("star02");
		star02.innerText = "(" + counselorDetail.totalScoreInfo.SCORE2 + ")";
		const star03 = document.getElementById("star03");
		star03.innerText = "(" + counselorDetail.totalScoreInfo.SCORE3 + ")";
		const star04 = document.getElementById("star04");
		star04.innerText = "(" + counselorDetail.totalScoreInfo.SCORE4 + ")";
		const star05 = document.getElementById("star05");
		star05.innerText = "(" + counselorDetail.totalScoreInfo.SCORE5 + ")";
		
	});
	
	/*
	CounselorDto counselorDto = registerCounselorSqlMapper.selectCounselorDetailByCounselorId(counselorId);
	List<Map<String, Object>> counselorTypeList =  registerCounselorSqlMapper.selectCounselorTypeByCounselorId(counselorId);
	List<LicenseImageDto> counselorLicenseList = registerCounselorSqlMapper.selectLicenseImgByCounselorId(counselorId);		
	List<Map<String, Object>> counselList =  registerCounselorSqlMapper.selectCompleteCounselListByCounselorId(counselorId);
	Map<String, Object> totalScoreInfo = registerCounselorSqlMapper.selectTotalScoreInfoByCounselorId(counselorId);
	*/
	
	const modal = bootstrap.Modal.getOrCreateInstance("#counselorInfoModal");
    modal.show();
}
/* 여기까지 상담원 정보조회 모달 */




function reloadCounselorList(){
	fetch("./restGetCounselorInfo")
	.then(response => response.json())
	.then(response =>{
		
		console.log("reloadCounselorList() 실행됨");
		
		//const counselorList = [...response.data];
		searchData = response.data;
		console.log("reloadCounselorList()결과 : " + searchData);			
		processSearchData(searchData);
	});
}

function processSearchData(searchData){
	
	console.log("processSearchData(searchData) 실행됨");
	
	const counselorListBox = document.querySelector("#counselorList");
	counselorListBox.innerHTML = "";
	
	for(e of searchData){
		
		const counselorboxWrapper = document.querySelector("#templete .counselorInfoBox").cloneNode(true);
		const counselorImageLink = counselorboxWrapper.querySelector(".imageCol .counselorImageLink");
		const counselorImage = counselorboxWrapper.querySelector(".imageCol .counselorImage");
		
		if(e.PROFILEIMAGE != null){
			counselorImage.src = "../../resources/img/counselorImage/" + e.PROFILEIMAGE;			
		}
		else{
			counselorImage.src = "../../resources/img/counselorImage/no_image.jpg";			
		}
		
		const counselorName = counselorboxWrapper.querySelector(".counselorName");
		counselorName.innerText = e.NAME;
		
		counselorboxWrapper.setAttribute("onclick", "showCounselorInfoModal(e.COUNSELORID)");	
		counselorListBox.appendChild(counselorboxWrapper);
		
	}
	
}

function getSearchCounselorType(){
	const searchCategoryValueList = [];
	
	const searchCategoryValue = document.getElementsByClassName("categoryOption");
	
	for(let e = 0 ; e < searchCategoryValue.length ; e++){
		if(searchCategoryValue[e].checked && searchCategoryValue[e].value !== "0" && searchCategoryValue[e].value !== "on"){
			searchCategoryValueList.push(searchCategoryValue[e].value);
		}
	}
	if(searchCategoryValueList.length > 0){
		return searchCategoryValueList;			
	}else{
		return [];	
	}
}

function searchCounselor(){
	
	console.log("searchCounselor() 실행됨");
	
	
	
	const searchCounselorType = getSearchCounselorType();
	const searchCounselorName = document.getElementById("searchByCounselorName").value;		
	const searchScoreOption = document.getElementById("searchScoreOption").value;		
	const searchGenderOption = getSelectGender();
	
	
	const url = "./restGetCounselorInfo";
	const searchOption = {
			method : "post",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded"
			},
			body : "searchCounselorName=" +  searchCounselorName + "&searchCounselorType=" + searchCounselorType
					+ "&searchGenderOption=" + searchGenderOption + "&searchScoreOption=" + searchScoreOption
	}
	fetch(url, searchOption)
	.then(response => response.json())
	.then(response =>{			
		
		searchData = response.data;
		console.log("searchCounselor()결과 : " + searchData);
		processSearchData(searchData);
		
	});
	
}

function searchTypeCategoryControl(target){
	
	const isChecked = target.checked;
	
	const selectOptionList = document.querySelectorAll(".searchCategoryOption .categoryOption:not(#categoryOptionAll)");
	
	selectOptionList.forEach((e)=>{
		e.checked = isChecked;
	});
	
}

function doUncheck(target){
	
	const categoryOptionAll = document.getElementById("categoryOptionAll");
	const selectOptionList = document.querySelectorAll(".searchCategoryOption .categoryOption:not(#categoryOptionAll)");
	
	const isAllChecked = Array.from(selectOptionList).every(option => option.checked);
	
	if(target.checked == false){			
		categoryOptionAll.checked = false;
	}else{
		if(isAllChecked){
			categoryOptionAll.checked = true;
		}
	}	
}


function reloadSearchTypeCategory(){
	fetch("./reloadSearchTypeCategory")
	.then(response => response.json())
	.then(response=>{
		
		console.log("reloadSearchTypeCategory()실행됨 : " + response.data);
		const searchCategoryCheckBoxCol = document.querySelector(".searchCategoryCheckBoxCol");
		searchCategoryCheckBoxCol.innerHTML = "";
		
		const selectOptionAll = document.querySelector("#templete .searchCategoryOption").cloneNode(true);
		const categoryOption = selectOptionAll.querySelector(".categoryOption");
		categoryOption.setAttribute("id", "categoryOptionAll");
		categoryOption.setAttribute("value", "0");
		categoryOption.setAttribute("onclick", "searchTypeCategoryControl(this)");
		
		const categoryLabel = selectOptionAll.querySelector(".categoryLabel");				
		categoryLabel.setAttribute("for", "categoryOptionAll");			
		categoryLabel.innerText = "전체";
		
		selectOptionAll.appendChild(categoryOption);
		selectOptionAll.appendChild(categoryLabel);
		
		searchCategoryCheckBoxCol.appendChild(selectOptionAll);
		
		for(e of response.data){
			
			const searchCategoryOption = document.querySelector("#templete .searchCategoryOption").cloneNode(true);
			
			const categoryOption = searchCategoryOption.querySelector(".categoryOption");
			categoryOption.setAttribute("id", "categoryOption" + e.id);			
			categoryOption.setAttribute("value", e.id);
			categoryOption.setAttribute("onclick", "doUncheck(this)");
			
			const categoryLabel = searchCategoryOption.querySelector(".categoryLabel");				
			categoryLabel.setAttribute("for", "categoryOption" + e.id);				
			categoryLabel.innerText = e.name;
			
			searchCategoryOption.appendChild(categoryOption);
			searchCategoryOption.appendChild(categoryLabel);
			
			searchCategoryCheckBoxCol.appendChild(searchCategoryOption);
			
			
		}				
		
	});
	
}


function getSelectGender(){
	
	const genderOptions = document.getElementsByName("genderOption");
	let selectGender;
	
	for(e of genderOptions){
		if(e.checked){
			selectGender = e.value;
			break;
		}
	}
	return selectGender || "";
}

function refreshPage(){
	
	location.reload();
}

function pressEnter(){
	if(window.event.keyCode == 13){
		searchCounselor();
	}
}

window.addEventListener("DOMContentLoaded", ()=>{	
	
});

</script>

<title>상담원 정보 페이지</title>
</head>
<body>
	<div class="container-fluid bg-body-secondary bg-opacity-25">
	
	<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>
	
	<div class="row">
	    <div class="col mx-0 px-0" style="height: 35em; position: relative;">
	        <img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
	
	        <div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
	
	        <div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20.5%; transform: translate(-50%, 50%);">MKU 상담센터</div>
	
	        <div style="color: white; position: absolute; font-size: 5em; bottom: 36%; transform: translate(-50%, -50%); text-align: center; left: -8%; border-top: 1px; border-top-style: solid; border-top-color: white; width: 80%;"></div>
	
	        <div style="color: white; position: absolute; font-size: 1.4em; bottom: 24.5%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
	
	        <div style="color: white; position: absolute; font-size: 1.4em; bottom: 17.5%; transform: translate(-50%, -50%); text-align: center; left: 24.2%;">마음도 관리가 필요합니다</div>
	
	        <div style="height: 17em; width: 18em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity: 0.9; position: absolute; bottom: -24.2%; transform: translate(-50%, -50%); text-align: center; left: 85%;"></div>
	
	        <div style="font-weight: 900; color: #464646; position: absolute; font-size: 1.5em; bottom: 34%; transform: translate(-50%, -50%); text-align: center; left: 82%;">Contact Us</div>
	
	        <div style="font-weight: 900; color: white; position: absolute; font-size: 2.6em; bottom: 10%; transform: translate(-50%, -50%); text-align: center; left: 84%;">1544-3054</div>
	
	        <div style="color: white; position: absolute; font-size: 0.9em; bottom: 8%; transform: translate(-50%, -50%); text-align: center; left: 83.5%;">E-mail. mkmk@naver.com</div>
	
	        <div style="color: white; position: absolute; font-size: 0.9em; bottom: 3%; transform: translate(-50%, -50%); text-align: center; left: 82.5%;">Tel. 010-4097-3054</div>
	    </div>
	</div>			

	<div class="row mb-5">
		<div class="col-1"></div>			
		<!-- 여기부터 레이아웃 -->
		<div class="col">
			<div class="row mt-4 contentBox">
				<div class="col">
					<span class="fw-bold fs-2 mx-3">상담원 조회</span>
				</div>
			</div>
			
			<div class="row contentBox">
				<div class="col">
					<div class="row">
						<div class="col">
															
						</div>							
					</div>
					<div class="row border rounded mt-3 mb-3 mx-3">
						<div class="col">
							<div class="row mt-3 mx-2">
								<div class="col">
									<div class="row">
										<div class="col-3">
											<span class="fw-bold align-middle">이름</span>
										</div>
										<div class="col-auto">
											<input id="searchByCounselorName" onkeyup="pressEnter()" type="text" class="form-control">
										</div>
									</div>										
								</div>
								
								<div class="col">
									<div class="row">
										<div class="col-2">
											<span class="fw-bold align-middle">성별</span>
										</div>
										<div class="col-auto">
											<div class="form-check form-check-inline align-middle">
												<input class="form-check-input " type="radio" name="genderOption" id="maleCounselor" value="male">
												<label class="form-check-label " for="maleCounselor">남</label>
											</div>
											<div class="form-check form-check-inline align-middle">												
												<input class="form-check-input" type="radio" name="genderOption" id="femaleCounselor" value="female">
											 	<label class="form-check-label " for="femaleCounselor">여</label>
											</div>
											<div class="form-check form-check-inline align-middle">												
												<input class="form-check-input" type="radio" name="genderOption" id="allCounselor" value="all">
											 	<label class="form-check-label " for="allCounselor">모두</label>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col">
									<div class="row">
										<div class="col-2">
											<span class="fw-bold align-middle">평점</span>	
										</div>
										<div class="col-auto">
											<select id="searchScoreOption" class="form-select">													
												<option selected value="">-선택-</option>
												<option value="scoreDESC">평점 낮은순</option>
												<option value="scoreASC">평점 높은순</option>
											</select>
										</div>
									</div>										
								</div>
								
								<div class="col">
									<div class="row justify-content-end">
										<div class="col-auto" role="button" onclick="refreshPage()">
											<span class="fw-bold align-middle">선택초기화<i class="bi bi-arrow-clockwise"></i></span>	
										</div>											
									</div>										
								</div>
								
							</div>
							<div class="row mt-4 mx-2">
								<div class="col">
									<div class="row">
										<div class="col-auto">
											<span class="fw-bold align-middle">상담종류</span>	
										</div>
										<div class="searchCategoryCheckBoxCol col-auto">												
										</div>
									</div>										
								</div>																		
							</div>
							
							<div class="row mt-4 mb-3">
								<div class="col">
									<div class="row justify-content-center">
										<div class="col-2 d-grid">
											<a href="#" onclick="searchCounselor()" role="button" class="btn btn-primary">검색</a>
										</div>
									</div>										
								</div>									
							</div>
						</div>
					</div>
					
				</div>
			</div>
			<div class="row mt-5 contentBox">
				<div class="col">
					<div class="row mt-3 mx-3">
						<div class="col">
							<div class="row">
								<div class="col border-bottom pb-2">
									<span class="fw-bold fs-2">상담원 목록</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3 mb-5 mx-3">
						<div class="col">
							<div id="counselorList" class="row">
								
							</div>	
						</div>
					</div>							
				</div>
			</div>			
		</div>
		<div class="col-1"></div>			
	</div>
	
	<!-- footer -->
	<div class="row mt-5" style="background-color: #5a5a5a; height: 14em;">
		<div class="col-1"></div>
		<div class="col">
			<div class="row" style="height: 4em;"></div>
			<div class="row">
				<div class="col">
					<span style="font-size: 1.4em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
					<span style="font-size: 1.2em; color: white; font-weight: 500;">▪</span>
					<span style="font-size: 1.2em; color: white; font-weight: 500;">이메일무단수집거부</span>
				</div>
			</div>
			<div class="row pt-4">
				<div class="col">
					<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col">
					<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
				</div>
			</div>
			<div class="row pt-4" style="border-bottom-style: solid; border-bottom-color: gray; border-bottom-width: 1px;"></div>
		</div>
		<div class="col-1"></div>
	</div>	
</div>


<div id="counselorInfoModal" class="modal fade" area-hidden="true" tabindex="-1">
      <div class="modal-dialog modal-lg">
          <div class="modal-content">
              <div class="modal-header">                        
                  <span class="modal-title fw-bold fs-2 ms-5">상담원 상세정보</span>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>                            
              </div>
              <div class="container modal-body">
                  <div class="row mt-2">
                      <div class="col-1"></div>
                      
                      <!-- 상담사 상세정보 컨텐츠 시작점 -->
	                <div class="col">
	                	<div class="row">
	                		<div class="col">
	                			
	                 			<!-- 상담사정보 상단로우 -->
	                 			<div class="row">
	                 				<!-- 상담사 사진 출력 -->                        			
	                 				<div class="col-4 text-center">
	                 					<div class="row">
	                 						<div class="col-auto">
	                 							<img id="counselorPhoto" class="img-fluid align-middle">
	                 						</div>
	                 					</div>
	                 				</div>
	                 				
	                 				<!-- 상담사 인적사항 -->
	                 				<div class="col-8">
	                 					<!-- 이름 -->
	                 					<div class="row">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">이름</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorName" class="fw-bold fs-4"></span> 상담사
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 상담원번호 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">No.</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorNo" class=""></span>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 나이 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">나이</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorAge" class=""></span>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 성별 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">성별</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorGender" class=""></span>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 전화번호 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">연락처</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorPhoneNum" class=""></span>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 이메일 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">이메일</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorEmail" class=""></span>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 주소 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-2">
	                 									<span class="fw-bold">주소</span>
	                 								</div>
	                 								<div class="col-auto">
	                 									<span id="counselorAddress" class=""></span>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 상담분야 -->
	                 					<div class="row mt-2">
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-auto">
	                 									<span class="fw-bold">상담분야</span>
	                 								</div>                        								
	                 							</div>
	                 							<div id="counselorTypeRow" class="row align-items-center mt-2">                        								
	                 								
	                 							</div>
	                 						</div>
	                 					</div>
	                 				</div>                        				
	                 			</div>
	                 			
	                 			<!-- 상담사 정보조회 중간로우 -->
	                 			<div class="row mt-3">
	                 				<div class="col">
	                 					<!-- 상담사 경력사항 -->
	                 					<div class="row">                        						
	                 						<div class="col">
	                 							<div class="row">
	                 								<div class="col">
	                 									<span class="fw-bold fs-4">경력사항</span>
	                 								</div>
	                 							</div>
	                 							<div class="row mt-2">
	                 								<div class="col border rounded">
	                 									<div class="row mt-2 mb-2">
	                 										<div id="counselorCareer" class="col">
	                 										
	                 										</div>
	                 									</div>                        								
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 상담사 자격정보 -->
	                 					<div class="row mt-3">                        						
	                 						<div class="col">
	                 							<div class="row">
	                 								<div class="col">
	                 									<span class="fw-bold fs-4">상담원 자격정보</span>
	                 								</div>
	                 							</div>
	                 							<div id="counselorLicenseRow" class="row mt-2">
	                 								
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 상담사 평점 -->
	                 					<div class="row mt-3">                        						
	                 						<div class="col">
	                 							<div class="row align-items-center">
	                 								<div class="col-auto">
	                 									<span class="fw-bold fs-4">상담원 평점</span>
	                 								</div>                        								
	                 								<div class="col">
	                 									<div class="row">
	                 										<div class="col-auto">
	                 											<div class="row">
	                 												<div id="starRateIcon" class="col-8">                 										
	                 												</div>
	                 											</div>
	                 										</div>
	                 									</div>
	                 								</div>
	                 							</div>
	                 							<div class="row mt-2">
	                 								<div class="col border rounded">
	                 									<div class="row mt-2 mb-2">
	                 										<div class="col-2">
	                 											<span class="fw-bold">평균 만족도</span>
	                 										</div>
	                 										<div class="col-auto">
	                 											<span id="counselorScoreAvg"></span>
	                 										</div>
	                 									</div>
	                 									<div class="row mt-2 mb-2">
	                 										<div class="col-2">
	                 											<span class="fw-bold">만족도 현황</span>
	                 										</div>
	                 										<div class="col">
	                 											<div class="row">
	                 												<div class="col-auto">
	                 													<span class="text-warning">
																			<i class="bi bi-star-fill small"></i>													
																		</span>
																		<span id="star01"></span>
	                 												</div>
	                 												<div class="col-auto">
	                 													<span class="text-warning lh-1 small">
																			<i class="bi bi-star-fill"></i>													
																			<i class="bi bi-star-fill"></i>
																		</span>
																		<span id="star02"></span>
	                 												</div>
	                 												<div class="col-auto">
	                 													<span class="text-warning lh-1 small">
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																		</span>
																		<span id="star03"></span>
	                 												</div>
	                 												<div class="col-auto">
	                 													<span class="text-warning lh-1 small">
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																		</span>
																		<span id="star04"></span>
	                 												</div>
	                 												<div class="col-auto">
	                 													<span class="text-warning lh-1 small">
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																			<i class="bi bi-star-fill"></i>
																		</span>
																		<span id="star05"></span>
	                 												</div>
	                 											</div>
	                 										</div>
	                 									</div>
	                 								</div>
	                 							</div>
	                 						</div>
	                 					</div>
	                 					
	                 					<!-- 상담원 상담이력 -->
                    					<div class="row mt-3">
                    						<div class="col">
                    						
                    						</div>
                    					</div>
                    				</div>
                    			</div>
                    			
                    		</div>	
                    	</div>
                   	</div>
                   	 <div class="col-1"></div>
               	</div>
              	</div>            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>                    
            </div>
		</div>
	</div>
</div>
	
<!-- 템플릿 짜두는 공간 -->
<div id="templete" class="d-none">
	
	<div class="counselorInfoBox col-2">
		<div class="row mt-2">				
			<div class="imageCol col">					
				<a class="counselorImageLink">
					<img src="" class="counselorImage img-fluid img-thumbnail">
				</a>						
			</div>													
		</div>
		<div class="row mt-2">
			<div class="col text-center">					
				<span class="counselorName fw-bold"></span> 상담사					
			</div>
		</div>								
	</div>
	
	
	<div class="searchCategoryOption form-check form-check-inline align-middle" id="" required>                                                
       	<input class="categoryOption form-check-input" type="checkbox" >
       	<label class="categoryLabel form-check-label"></label>                                    	
    </div>	
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>