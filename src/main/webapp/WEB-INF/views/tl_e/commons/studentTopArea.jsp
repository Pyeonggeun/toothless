<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
    <script>

    let studentPk = null;
    
    function checkLogin(){
    	
    	const url = "/toothless/tl_e/commons/getStudentInfo";
    	
    	fetch(url)
    	.then(response => response.json())
    	.then(response => {
    		
    		studentPk = response.data;
				
        	if(studentPk == null){
        		
        		if(confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?")){
        			location.href="/toothless/another/student/loginPage"
        		}else{
        			location.href= window.location.pathname;
        		}
        		
        	}
    	});
    	
    }
    
    window.addEventListener("DOMContentLoaded", () => {
    	checkLogin();
	});
    
	</script>

</head> 
  
 <body>   
    
    
	<!-- 네비바 -->
	<div class="row pb-3" style="border-top-style: solid; border-top-width: 7px; border-top-color: #8FBC8F">
		<div class="col-2 pt-3">
			<div class="row">
				<div class="col-3 pe-0 me-0">
					<a href="/toothless/tl_e/commons/counselCenterStudentMainPage"><img class="img-fluid" style="width: 60px; height: 60px; color:blue;" src="/toothless/resources/img/groupCounsel/logo_black.png"></a>
				</div>
				<div class="col">
					<div class="row" style="height: 0.55em;"></div>
					<div class="row">
						<div class="col ps-0 ms-0">
							<div class="fw-bold" style="font-size: 1.7em;"> Mk University</div>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="row">
				<div class="col">
					<div class="row" style="height: 2em;"></div>
					<div class="row">
						<div class="col-2"></div>
						<div class="col">
							<div class="row">
								<div class="col-2"></div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black; cursor:pointer;">상담 신청</a>
									  <ul class="dropdown-menu">
									    <li><a style="cursor:pointer;" class="dropdown-item" href="/toothless/tl_e/onlineCounsel/onlineCounselMainPage">온라인 상담</a></li>
									    <li><a style="cursor:pointer;" class="dropdown-item" href="/toothless/tl_e/offlineCounsel/selectCounselorPage">오프라인 상담</a></li>
									    <li><a style="cursor:pointer;" class="dropdown-item" href="/toothless/tl_e/groupcounsel/student/groupCounselListPage">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black; cursor:pointer;">예약 조회</a>
									  <ul class="dropdown-menu">
									    <li><a style="cursor:pointer;" class="dropdown-item" href="/toothless/tl_e/offlineCounsel/checkOfflineCounselReservationStudentPage">오프라인 상담</a></li>
									    <li><a style="cursor:pointer;" class="dropdown-item" href="/toothless/tl_e/groupcounsel/student/readGroupCounselReservationListByStudentPage">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<a href="/toothless/tl_e/notice/noticeMainPage_Student" class="fw-bold" style="font-size: 1.2em; text-decoration-line: none; color: black; cursor:pointer;">공지사항</a>
								</div>
								<div class="col text-center">
									<a href="/toothless/tl_e/freeboardCounsel/freeboardCounselPage" class="fw-bold" style="font-size: 1.2em; text-decoration-line: none; color: black; cursor:pointer;">자유게시판</a>
								</div>
								<div class="col text-center">
									<a href="/toothless/tl_e/registerCounselor/counselorInfo" class="fw-bold" style="font-size: 1.2em; text-decoration-line: none; color: black; cursor:pointer;">상담원 정보</a>
								</div>									
							</div>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="row">
						<div class="col-6 text-center">
							<div class="row" style="height: 2em;"></div>
							<div class="row">
								<div class="col">
									<div class="fw-bold" style="font-size: 1.2em;">[${sessionStudentInfo.name}]님</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="row" style="height: 1.7em;"></div>
							<div class="row">
								<div class="col">
									<a href="/toothless/another/student/logoutProcess"><i class="bi bi-box-arrow-right" style="font-size:1.6em; color: black;"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	
</body>
</html>
	