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
	const counselorDetail = 
	
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
			
			counselorList = response.data;
			
			const counselorList = document.querySelector("#counselorList");
			counselorList.innerHTML = "";
			
			for(e of counselorList){
				
				const counselorboxWrapper = document.querySelector("#templete .counselorInfoBox").cloneNode(true);
				const counselorImageLink = counselorboxWrapper.querySelector(".counselorImage .counselorImageLink");
				
				if(e.PROFILEIMAGE != null){
					counselorImageLink.src = "../../resources/img/counselorImage/" + e.PROFILEIMAGE;
					counselorImageLink.setAttribute("onclick", "getCounselorDetail(e.ID)");	
				}
				else{
					counselorImageLink.src = "../../resources/img/counselorImage/no_image.jpg";
					counselorImageLink.setAttribute("onclick", "getCounselorDetail(e.ID)");
				}
				
				const counselorName = counselorboxWrapper.querySelector(".counselorName");
				counselorName.InnerText = e.NAME;
				
				counselorList.appendChild(counselorboxWrapper);
				
			}
		
		
		});
	}
	
	function getCounselorDetail(int id){
		fetch("./counselorDetail?id=" + id)
		.then(response => response.json())
		.then(response =>{
			
		});
	}
	
	
	
	window.addEventListener("DOMContentLoaded", ()=>{
		getStaffInfo()
		reloadCounselorList()
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
						<span class="fw-bold fs-2">상담원 관리 페이지</span>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<span class="fw-bold fs-2">검색 기능 구현 부분</span>
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
				<div class="counselorImage col">					
					<img src="" class="counselorImageLink img-fluid img-thumbnail">					
				</div>													
			</div>
			<div class="row mt-2">
				<div class="col text-center">
					<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
						<span class="counselorName fw-bold"></span> 상담사
					</a>
				</div>
			</div>								
		</div>
		
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>