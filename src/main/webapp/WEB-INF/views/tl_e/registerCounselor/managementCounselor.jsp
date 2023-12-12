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
			console.log("AJAX 리스폰 성공 진입함")
			
			loginStaffInfo = response.data;
			
			const staffInfoBox = document.getElementById("staffInfoBox");
			
			staffInfoBox.innerText = loginStaffInfo.name;
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
			searchCounselor();
			
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
	
	function searchCounselor(){
		
		console.log("searchCounselor() 실행됨");
		
		const searchCounselorName = document.getElementById("searchByCounselorName").value;
		const searchCounselorType = document.getElementById("searchCategorySelectBox").value;
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
			newSelectOption.setAttribute("value", "");
			
			searchCategorySelectBox.appendChild(newSelectOption);
			
			for(e of response.data){
				
				const searchCategoryOption = document.querySelector("#templete .searchCategoryOption").cloneNode(true);
				
				searchCategoryOption.innerText = e.name;
				
				searchCategoryOption.setAttribute("value", e.id);
				
				searchCategorySelectBox.appendChild(searchCategoryOption);
				
			}
			/* <input name="type_category_id" class="form-check-input" type="checkbox" id="typeCategory" value="">
            <label class="form-check-label" for="typeCategory"></label> */
			
			
			const typeCategoryInModal = document.querySelector(".typeCategoryInModal");
			typeCategoryInModal.innerHTML = "";
			
			const typeSelectBoxInModal = createHTMLElement("input");
			typeSelectBoxInModal.setAttribute("name", "type_category_id");
			typeSelectBoxInModal.setAttribute("class", "form-check-input");
			typeSelectBoxInModal.setAttribute("type", "checkbox");
			
			
			const typeLabelInModal = createHTMLElement("label");
			typeLabelInModal.setAttribute("class", "form-check-label");
			typeLabelInModal.setAttribute("for", "위에 아이디랑 맞춰주기");
			
			for(e of response.data){
				
				typeSelectBoxInModal.setAttribute("id", "typeCategory" + e.id);
				typeSelectBoxInModal.setAttribute("value", "e.id");
				
				typeLabelInModal.setAttribute("for", "typeCategory" + e.id);
				typeLabelInModal.innerText = e.name;
				
				typeCategoryInModal.appendChild(typeSelectBoxInModal);
				typeCategoryInModal.appendChild(typeLabelInModal);
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
	
	function showModal(){
        // 필요시 여기서 백엔드하고 연동...CSR
        const modal = bootstrap.Modal.getOrCreateInstance("#registerModal");
        modal.show();
    }

    function resigterCounselorProcess(){
        // 필요시 여기서 백엔드하고 연동...CSR
        const modal = bootstrap.Modal.getOrCreateInstance("#registerModal");
        modal.hide();
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
													<option selected disabled value="">-선택-</option>
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
                                            <label for="external_id" class="fw-bold form-label">상담원아이디</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <input name="external_id" type="text" id="external_id" class="form-control" required>                                                    
                                        </div>																		
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
                                        <div class="col-auto">                                                    
                                            <div class="typeCategoryInModal form-check form-check-inline" id="type_category_id" required>
                                                <input name="type_category_id" class="form-check-input" type="checkbox" id="typeCategory" value="">
                                                <label class="form-check-label" for="typeCategory"></label>
                                            </div>
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
		
		<option class="searchCategoryOption"></option>
		
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>