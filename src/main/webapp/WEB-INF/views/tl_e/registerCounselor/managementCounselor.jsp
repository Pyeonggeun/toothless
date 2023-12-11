<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	let loginStaffInfo = null;	 
	
	
	function getStaffInfo(){		
		fetch("./restGetStaffInfo")
		.then(response => response.json())
		.then(response => {
			console.log("AJAX 리스폰 성공 진입함")
			
			sessionStaffInfo = response.data;
			
			const staffInfoBox = document.getElementById("staffInfoBox");
			
			staffInfoBox.innerText = sessionStaffInfo.name;
		});		
	}
	
	function reloadCounselorList(){
		fetch("./restGetCounselorInfo")
		.then(response => response.json())
		.then(response =>{
			
			//const counselorList = [...response.data];
			
			
			const counselorListBox = document.querySelector("#counselorList");
			counselorListBox.innerHTML = "";
			
			for(e of response.data){
				
				const counselorboxWrapper = document.querySelector("#templete .counselorInfoBox").cloneNode(true);
				const counselorImageLink = counselorboxWrapper.querySelector(".imageCol .counselorImageLink");
				const counselorImage = counselorboxWrapper.querySelector(".imageCol .counselorImage");
				
				if(e.PROFILEIMAGE != null){
					counselorImage.src = "../../resources/img/counselorImage/" + e.PROFILEIMAGE;
					counselorImageLink.setAttribute("href", "./counselorDetail?id=" + e.ID);	
				}
				else{
					counselorImage.src = "../../resources/img/counselorImage/no_image.jpg";
					counselorImageLink.setAttribute("href", "./counselorDetail?id=" + e.ID);
				}
				
				const counselorName = counselorboxWrapper.querySelector(".counselorName");
				counselorName.innerText = e.NAME;
				
				counselorListBox.appendChild(counselorboxWrapper);
				
			}
		
		
		});
	}
	
	function reloadSearchTypeCategory(){
		fetch("./reloadSearchTypeCategory")
		.then(response => response.json())
		.then(response=>{
			
			console.log(response.data);
			const searchCategorySelectBox = document.querySelector("#searchCategorySelectBox");
			searchCategorySelectBox.innerHTML = "";
			
			const createHTMLElement = tagName => document.createElement(tagName);
			const newSelectOption = createHTMLElement("option");
			newSelectOption.innerText = "카테고리 선택";
			newSelectOption.setAttribute("selected", "");
			newSelectOption.setAttribute("disabled", "");
			
			searchCategorySelectBox.appendChild(newSelectOption);
			
			for(e of response.data){
				
				const searchCategoryOption = document.querySelector("#templete .searchCategoryOption").cloneNode(true);
				
				searchCategoryOption.innerText = e.name;
				
				searchCategoryOption.setAttribute("value", e.id);
				
				searchCategorySelectBox.appendChild(searchCategoryOption);
				
			}
			
		});
	}
	
	function searchCounselor(){
		
		const searchCounselorName = document.getElementById("searchByCounselorName").value;
		console.log(searchCounselorName);
		
		const searchCounselorType = document.getElementById("searchCategorySelectBox").value;
		console.log(searchCounselorType);		
		
		const searchGenderOption = getSelectGender();	
		console.log(searchGenderOption);
		
		const searchScoreOption = document.getElementById("searchScoreOption").value;
		console.log(searchScoreOption);
		
		const url = "./searchCounselor";
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
			
			console.log(response.data)
			
			
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
		return selectGender;
	}
	
	
	
	window.addEventListener("DOMContentLoaded", ()=>{
		getStaffInfo()
		reloadCounselorList()
		reloadSearchTypeCategory()		
		
	});
	
</script>
<title>상담원 등록 페이지</title>
</head>
<body>
	
	<div class="container">
	
		<div class="row border-bottom">
			<div class="col-10"></div>
			<div class="col py-2 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span id="staffInfoBox" class="fw-bold"></span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">정보 수정</a></li>
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
		</div>

		<div class="row"></div>
		<div class="row">
			<div class="col ms-4">
				<div class="row pt-5">
					<div class="col fw-bold fs-3">
						<a href="../commons/counselCenterStaffMainPage" role="button" class="btn btn-white">
							<span class="fw-bold fs-3">MENU</span>
						</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							상담원 관리
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="../registerCounselor/registerPage">상담원 등록</a></li>
						   		<li><a class="dropdown-item" href="../registerCounselor/counselorInfo">상담원 조회</a></li>
						   		<li><a class="dropdown-item" href="../registerCounselor/managementCounselor">상담원 관리(JS)</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col fs-5">
						<a class="navbar-brand" href="#">공지사항</a>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col fs-5">
						<a class="navbar-brand" href="#">집단상담</a>
					</div>
				</div>
			</div>
			
			<!-- 여기부터 레이아웃 -->
			<div class="col-10">
				<div class="row mt-5">
					<div class="col">
						<span class="fw-bold fs-2">상담원 관리</span>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5">상담원 검색</span>								
							</div>
						</div>
						<div class="row border rounded mt-3">
							<div class="col">
								<div class="row mt-2">
									<div class="col">
										<div class="row">
											<div class="col-3">
												<span class="fw-bold align-middle">상담원 이름</span>
											</div>
											<div class="col-auto">
												<input id="searchByCounselorName" type="text" class="form-control">
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
													<input class="form-check-input " type="radio" name="genderOption" id="maleCounselor" value="M">
													<label class="form-check-label " for="maleCounselor">남</label>
												</div>
												<div class="form-check form-check-inline align-middle">												
													<input class="form-check-input" type="radio" name="genderOption" id="femaleCounselor" value="F">
												 	<label class="form-check-label " for="femaleCounselor">여</label>
												</div>
												<div class="form-check form-check-inline align-middle">												
													<input class="form-check-input" type="radio" name="genderOption" id="allCounselor" value="A">
												 	<label class="form-check-label " for="allCounselor">모두</label>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								<div class="row mt-2">
									<div class="col">
										<div class="row">
											<div class="col-3">
												<span class="fw-bold align-middle">상담종류</span>	
											</div>
											<div class="col-auto">
												<select id="searchCategorySelectBox" class="form-select">
												</select>
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
													<option selected disabled>-선택-</option>
													<option value="scoreDESC">평점 높은순</option>
													<option value="scoreASC">평점 낮은순</option>
												</select>
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
							<div class="col border-bottom">
								<span class="fw-bold fs-2">상담원 목록</span>	
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
		
		<option class="searchCategoryOption"></option>
		
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>