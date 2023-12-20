<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>	
	function getSessionStaffInfo() {
		
		const fixedUrl = "/toothless/tl_e/commons/getSessionStaffInfo"
		const staffLoginUrl = "/toothless/another/staff/loginPage";
		
		fetch(fixedUrl)
		.then(response => response.json())
		.then(response => {
			
			if(response.data == null){
				
				const moveToLoginPage = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
				
				if(moveToLoginPage){
					window.location.href = staffLoginUrl;
				}
				
			}
			else{
				const sessionStaffName = document.getElementById("sessionStaffName");
				sessionStaffName.innerHTML = "";
				sessionStaffName.innerText = response.data.name;
			}
			
		});
		
	}
	window.addEventListener("DOMContentLoaded", ()=>{
		getSessionStaffInfo()
	});
	
	

</script>

    
	<div class="row py-2">
		<div class="col-1 pe-2 text-end">
			<a href="/toothless/tl_e/commons/counselCenterStaffMainPage"><img src="/toothless/resources/img/another/logo_black.png" alt="" style="height: 4em;"></a>
		</div>
		<div class="col-3 mt-2 ps-0 fw-bold fs-3 text-start ">
			<a href="/toothless/tl_e/commons/counselCenterStaffMainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">MK University<span class="fs-6 link-dark link-offset-2 link-underline link-underline-opacity-0"> | </span> <span class="fs-5 link-offset-2 link-underline link-underline-opacity-0">상담센터</span></a> 
		</div>
		<div class="col-3"></div>
		<div class="col ps-0 pt-4 text-center" style="font-size: 1.1em; font-weight: bold;"> <a href="/toothless/tl_e/registerCounselor/managementCounselor" class="link-offset-2 link-underline link-underline-opacity-0 text-primary-emphasis">상담원 관리</a></div>
		<div class="col ps-0 pt-4 text-center text-primary-emphasis" style="font-size: 1.1em; font-weight: bold;"><a href="/toothless/tl_e/groupcounsel/staff/groupCounselListPage" class="link-offset-2 link-underline link-underline-opacity-0 text-center text-primary-emphasis">집단상담</a></div>
		<div class="col ps-0 pt-4 text-center text-primary-emphasis" style="font-size: 1.1em; font-weight: bold;"><a href="/toothless/tl_e/notice/noticeMainPage_Staff" class="link-offset-2 link-underline link-underline-opacity-0 text-center text-primary-emphasis">공지사항</a></div>
		
		<div class="col pt-4 dropdown nav-item">
			<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<span id="sessionStaffName" class="fw-bold" style="font-size: 1.1em; color: darkgreen;"></span>
				<span class="fw-bold" style="font-size: 1.1em; color: black;">님</span>
			</a>
			<ul class="dropdown-menu" style="">
				<li><a class="dropdown-item" href="#">정보 수정</a></li>
				<li><a class="dropdown-item" href="#">마이페이지</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="/toothless/another/staff/logoutProcess"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			</ul>
		</div>
	</div>