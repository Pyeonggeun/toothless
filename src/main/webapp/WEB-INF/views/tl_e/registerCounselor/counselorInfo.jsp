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

</style>
<script>
	let loginStudentInfo = null;

	function getStudentInfo(){		
		fetch("./getStudentInfo")
		.then(response => response.json())
		.then(response => {
			
			const staffLoginUrl = "http://localhost:8181/toothless/another/student/loginPage";
			
			loginStudentInfo = response.data;
			if(loginStudentInfo == null){
				const moveToLoginPage = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
				
				if(moveToLoginPage){
					window.location.href = staffLoginUrl;
				}
				
			}
			else{
				const staffInfoBox = document.getElementById("staffInfoBox");
				
				staffInfoBox.innerText = loginStudentInfo.name;	
			}
			
			
		});		
	}

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
			counselorImageLink.setAttribute("href", "./counselorDetail?id=" + e.COUNSELORID);	
		}
		else{
			counselorImage.src = "../../resources/img/counselorImage/no_image.jpg";
			counselorImageLink.setAttribute("href", "./counselorDetail?id=" + e.COUNSELORID);
		}
		
		const counselorName = counselorboxWrapper.querySelector(".counselorName");
		counselorName.innerText = e.NAME;
		
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
	getStudentInfo()
	reloadCounselorList()
	reloadSearchTypeCategory()
});

</script>

<title>상담원 정보 페이지</title>
</head>
<body>	
	
	<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>
	
	<div class="container">			

		<div class="row"></div>
		<div class="row">
						
			<!-- 여기부터 레이아웃 -->
			<div class="col">
				<div class="row mt-5">
					<div class="col">
						<span class="fw-bold fs-2">상담원 조회</span>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5 align-middle">상담원 검색</span>								
							</div>							
						</div>
						<div class="row border rounded mt-3">
							<div class="col">
								<div class="row mt-2">
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
								<div class="row mt-4">
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
								
								<div class="row mt-4 mb-3 justify-content-center">
									<div class="col-3">
										<div class="row">
											<div class="col d-grid">
												<a href="#" onclick="searchCounselor()" role="button" class="btn btn-primary">검색</a>
											</div>
										</div>										
									</div>									
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col border-bottom pb-2">
										<span class="fw-bold fs-2">상담원 목록</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div id="counselorList" class="row">
									
								</div>	
							</div>
						</div>							
					</div>
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