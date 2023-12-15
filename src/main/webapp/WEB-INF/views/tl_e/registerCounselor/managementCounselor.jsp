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
	let searchData = null;
	
	
	
	function getStaffInfo(){		
		fetch("./restGetStaffInfo")
		.then(response => response.json())
		.then(response => {
			
			const staffLoginUrl = "http://localhost:8181/toothless/another/staff/loginPage";
			
			loginStaffInfo = response.data;
			if(loginStaffInfo == null){
				const moveToLoginPage = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
				
				if(moveToLoginPage){
					window.location.href = staffLoginUrl;
				}
				
			}
			else{
				const staffInfoBox = document.getElementById("staffInfoBox");
				
				staffInfoBox.innerText = loginStaffInfo.name;	
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
			if(searchCategoryValue[e].checked){
				searchCategoryValueList.push(searchCategoryValue[e].value);
			}
		}
		
		return searchCategoryValueList;
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
	
	function searchTypeCategoryControl(){
		
		const selectOptionAll = document.querySelector(".searchCategoryOption #categoryOptionAll");
		const selectOptionList = document.querySelectorAll(".searchCategoryOption .categoryOption:not(#categoryOptionAll)");
		
		selectOptionAll.addEventListener('click',()=>{
			selectOptionList.forEach(checkbox => {
				checkbox.checked = selectOptionAll.checked;
			});
		});
		
		selectOptionList.forEach(checkbox => {
			checkbox.addEventListener('click', ()=>{
				if(!checkbox.checked){
					selectOptionAll.checked = false;
				}
				else{
					const allChecked = Array.from(selectOptionList).every(checkbox => checkbox.checked);
					selectOptionAll.checked = allChecked;
				}
			});
		});
		
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
			categoryOption.setAttribute("value", 0);			
			
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
				
				const categoryLabel = searchCategoryOption.querySelector(".categoryLabel");				
				categoryLabel.setAttribute("for", "categoryOption" + e.id);				
				categoryLabel.innerText = e.name;
				
				searchCategoryOption.appendChild(categoryOption);
				searchCategoryOption.appendChild(categoryLabel);
				
				searchCategoryCheckBoxCol.appendChild(searchCategoryOption);
				
				
			}
			
			const typeCategoryColInModal = document.querySelector(".typeCategoryColInModal");
	    	typeCategoryColInModal.innerHTML = "";			
			
			for(e of response.data){
				
				console.log("카테고리 반복문 진입");
				
				
				const typeCheckBoxInModal = document.querySelector("#templete .typeCheckBoxInModal").cloneNode(true);
				
				const typeCheckBox = typeCheckBoxInModal.querySelector(".typeCheckBox");
				
				typeCheckBox.setAttribute("id", "typeCategory" + e.id);
				typeCheckBox.setAttribute("value", e.id);
				
				const typeCheckBoxLabel = typeCheckBoxInModal.querySelector(".typeCheckBoxLabel");				
				
				typeCheckBoxLabel.setAttribute("for", "typeCategory" + e.id);
				typeCheckBoxLabel.innerText = e.name;
				
				typeCheckBoxInModal.appendChild(typeCheckBox);
				typeCheckBoxInModal.appendChild(typeCheckBoxLabel);
				
				typeCategoryColInModal.appendChild(typeCheckBoxInModal);
			}
			
		});
		searchTypeCategoryControl();
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
	
	
	let isCheckId = false;
	
	function checkDuplicationId(target){
		
		console.log("checkDuplicationId() 실행됨");
		console.log("클릭전 inputId : " + target.value);
		const inputId = target.value;
		console.log("클릭후 inputId : " + inputId);
		
		if(inputId == ""){
			
			const checkDuplicateId_col = document.querySelector("#checkDuplicateId_col");
			
			checkDuplicateId_col.innerHTML="";
			
			const isAvailableID = document.createElement("span");
			
			isAvailableID.innerHTML="";
			
			isAvailableID.innerText = "ID는 필수 입력항목입니다.";
			
			isAvailableID.classList.add("fw-bold", "text-danger");
			
			checkDuplicateId_col.appendChild(isAvailableID);
			
			target.value = "";
			target.focus();
			return;
		}
		
		if(inputId != undefined){
			const url = "./checkDuplicationId";
			const inputValue = {
					method : "post",
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded"
					},
					body : "inputId=" + inputId
			}
			
			fetch(url, inputValue)
			.then(response => response.json())
			.then(response => {
				
				if(response.data == true){
					
					isCheckId = true;
					
					const checkDuplicateId_col = document.querySelector("#checkDuplicateId_col");
					
					checkDuplicateId_col.innerHTML="";
					
					const isAvailableID = document.createElement("span");
					
					isAvailableID.innerText = "사용 가능한 ID입니다.";
					
					isAvailableID.classList.add("fw-bold", "text-primary");
					
					checkDuplicateId_col.appendChild(isAvailableID);
					
				}
				else{
					
					isCheckId = false;
					
					const checkDuplicateId_col = document.querySelector("#checkDuplicateId_col");
					
					checkDuplicateId_col.innerHTML="";
					
					const isAvailableID = document.createElement("span");
					
					isAvailableID.innerText = "이미 사용중인 ID입니다.";
					
					isAvailableID.classList.add("fw-bold", "text-danger");
					
					checkDuplicateId_col.appendChild(isAvailableID);
				}
			});		
		}
	}
	
	function showModal(){
		// 필요시 여기서 백엔드하고 연동...CSR
        const modal = bootstrap.Modal.getOrCreateInstance("#registerModal");
        modal.show();
        
    }

    function resigterCounselorProcess(){
        
    	const categoryValueList = [];
    	
    	const categoryValue = document.getElementsByClassName("typeCheckBox");    	    	
    	
    	for(let e = 0 ; e < categoryValue.length ; e++){
    		if(categoryValue[e].checked){
    			categoryValueList.push(categoryValue[e].value);
    		}
    	}
    	
    	console.log(categoryValueList);
    	
    	const external_id = document.getElementById("external_id").value;
    	const password = document.getElementById("password").value;    	
    	const name = document.getElementById("name").value;
    	const age = document.getElementById("age").value;
    	const gender = document.querySelector('input[name="gender"]:checked').value;
    	const phonenumber = document.getElementById("phonenumber").value;
    	const email = document.getElementById("email").value;
    	const address = document.getElementById("address").value;
    	const career = document.getElementById("career").value;
    	
    	
    	const profile_ImageInput = document.getElementById("profile_Image");    	
    	const licenseInput = document.getElementById("license");
    	
    	const formData = new FormData();
    	
    	formData.append("external_id", external_id);
    	formData.append("password", password);
    	formData.append("name", name);
    	formData.append("age", age);
    	formData.append("gender", gender);
    	formData.append("phonenumber", phonenumber);
    	formData.append("email", email);
    	formData.append("address", address);
    	formData.append("career", career);
    	formData.append("type_category_id", categoryValueList);
    	
    	formData.append("profile_Image", profile_ImageInput.files[0]);
    	
    	for(let e = 0 ; e < licenseInput.length ; e++){
    		formData.append("license", licenseInput[e]);
    	}
    	
    	
    	const url = "./resigterCounselorProcess";
    	
    	fetch(url, {method : "post", body : formData})
    	.then(response => response.json())
    	.then(response =>{
    		
    		if(response.result == "success"){
    			
    			alert("신규 상담원 등록이 정상적으로 처리되었습니다.");
    			
    			const modal = bootstrap.Modal.getOrCreateInstance("#registerModal");
                modal.hide();
                reloadCounselorList();
    		}
    		
    		if(response.result == "fail"){
    			alert("정상적으로 처리되지 않았습니다. 작성내용을 확인해주시기 바랍니다.");
    		}
    	});
    	
        
    	/* 아래 코드 가능한거 확인만 함! 
    	
    	const regCounselorData = new Map(); 
        
        regCounselorData.set("external_id", external_id);
        regCounselorData.set("password", password);
        regCounselorData.set("type_category_id", categoryValueList);
        regCounselorData.set("name", name);
        regCounselorData.set("age", age);
        regCounselorData.set("gender", gender);
        regCounselorData.set("phonenumber", phonenumber);
        regCounselorData.set("email", email);
        regCounselorData.set("address", address);
        regCounselorData.set("career", career);
        regCounselorData.set("profile_Image", profile_Image);
        regCounselorData.set("license", license);
        
        console.log(regCounselorData); */
        
    	
    	
    }
    
    function pressEnter(){
    	if(window.event.keyCode == 13){
    		searchCounselor();
    	}
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
								<span class="fw-bold fs-5 align-middle">상담원 검색</span>								
							</div>
							<div class="col text-end">
								<button onclick="showModal()" class="btn btn-sm btn-success fw-bold fs-6 align-middle" data-bs-toggle="modal" data-bs-target="#registerCounselor">
									상담원 신규등록
								</button>								
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
	
<!-- 여긴 컨테이너 밖이당 -->
<!-- 모달, 오프캔버스는 컨테이너 밖으로...(pixed옵션이기 때문에) -->
   	<div id="registerModal" class="modal fade" data-bs-backdrop="static" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">                        
                    <span class="modal-title fw-bold fs-2 ms-5">상담원 신규등록</span>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>                            
                </div>
                <div class="container modal-body">
                    <div class="row mt-2">
                        <div class="col-1"></div>
                        <div class="col">                            
                            
                            <!-- 외부상담사아이디/비번 -->
                            <div class="row mt-3">
                                <!-- 아이디 -->
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col">
                                            <label for="`" class="fw-bold form-label">상담원아이디</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="external_id" onblur="checkDuplicationId(this)" type="text" id="external_id" class="form-control" required>                                                    
                                        </div>																		
                                    </div>
                                    <div class="row mt-2">
										<div id="checkDuplicateId_col" class="col-auto"></div>										
									</div>									
                                </div>
                                
                                <!-- 비밀번호 -->
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col">
                                            <label for="password" class="fw-bold form-label">상담원비밀번호</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="password" type="password" id="password" class="form-control" required>                                                    	
                                        </div>
                                    </div>								
                                </div>
                            </div>
                            
                            <div class="row mt-3">	
                                <!-- 상담원카테고리 -->
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col">
                                            <label for="type_category_id" class="fw-bold form-label">상담카테고리</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="typeCategoryColInModal col-auto">
                                        </div>
                                    </div>								
                                </div>							
                            </div>	
                            
                            <!-- 상담사 이름/나이/성별 -->
                            <div class="row mt-3">
                                <!-- 이름 -->
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col">
                                            <label for="name" class="fw-bold form-label">이름</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="name" type="text" id="name" class="form-control" required>                                                    
                                        </div>																		
                                    </div>                                    							
                                </div>
                                
                                <!-- 나이 -->
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col">
                                            <label for="age" class="fw-bold form-label">나이</label>	
                                        </div>									
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="age" id="age" type="number" class="form-control" min="0" required>                                                    
                                        </div>															
                                    </div>								
                                </div>
                                
                                <!-- 성별 -->
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <label for="gender" class="fw-bold form-label">성별</label>
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col">
                                            <input name="gender" type="radio" id="Male" class="form-check-input align-middle" value="M" checked>
                                            <label class="form-check-label align-middle" for="Male">남</label>
                                            <input name="gender" type="radio" id="Female" class="form-check-input align-middle" value="F">
                                            <label class="form-check-label align-middle" for="Female">여</label>
                                        </div>
                                    </div>								
                                </div>
                            </div>
                            
                            
                            <!-- 상담원 전화번호/이메일 -->
                            <div class="row mt-3">
                                <!-- 전화번호 -->
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col">
                                            <label for="phonenumber" class="fw-bold form-label">전화번호</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="phonenumber" id="phonenumber" type="text" class="form-control" required>                                                    
                                        </div>									
                                    </div>								
                                </div>
                                
                                <!-- 이메일 -->
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <label for="email" class="fw-bold form-label">이메일</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="email" id="email" type="text" class="form-control" required>                                                    
                                        </div>																	
                                    </div>
                                </div>							
                            </div>
                            
                            
                            <!-- 주소 -->
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <label for="address" class="fw-bold form-label">주소</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <input name="address" id="address" type="text" class="form-control" required>                                                    
                                        </div>																		
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 경력사항 -->
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <label for="career" class="fw-bold form-label">경력사항</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <textarea name="career" id="career" class="form-control" rows="10" required></textarea>                                                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 증명사진 -->
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <label for="profile_Image" class="fw-bold form-label">증명사진</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="profile_Image" type="file" id="profile_Image" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 자격증 -->
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <label for="license" class="fw-bold form-label">자격증</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="license" accept="image/*" type="file" id="license" class="form-control" multiple>
                                        </div>																	
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button onclick="resigterCounselorProcess()" type="button" class="btn btn-primary">등록하기</button>
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
		
		<div class="typeCheckBoxInModal form-check form-check-inline" id="type_category_id" required>                                                
        	<input class="typeCheckBox form-check-input" type="checkbox" >
        	<label class="typeCheckBoxLabel form-check-label"></label>                                    	
        </div>
		
		
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>