<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col">
		<div class="row text-center">
			<div class="col-4"></div>
            <div class="col-1 pe-2 text-end">
                   <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
          	</div>
           	<div class="col-3 ps-0 fw-bold fs-1 text-start ">
               MK University<span class="fs-6"> | </span> <span class="fs-5">보건센터</span> 
           	</div>
          	<div class="col-2"></div>
           	<div class="col-1 border-end border-secondary text-end text-secondary mt-5" style="font-size: small">
               포털이용안내
           	</div>
           	<div class="col-1 text-start text-secondary mt-5 "style="font-size: small">
                <a class="navbar-brand" href="./logoutProcess">로그아웃</a>
            </div>
        </div>
	</div>
</div>
 <div class="row text-center py-1 fw-bold text-light" style="background-color: #133369">
 	<div class="col-2"></div>
    <div class="col align-self-center">
        <a class="navbar-brand" href="./mainpage">현장실습 지원 센터</a>
    </div>
    <div class="col align-self-center">
        <a class="navbar-brand" href="../../tl_d/common/employmentMainPage">취업<i class="bi bi-dot"></i>창업 지원 센터</a>
    </div>
    <div class="col align-self-center">
        <a class="navbar-brand" href="../../tl_e/commons/counselCenterStudentMainPage">상담 센터</a>
    </div>
    <div class="col align-self-center">
        <a class="navbar-brand" href="../../tl_a/student/jw_mainPage">생활관 관리 센터</a>
    </div>
    <div class="col align-self-center">
        <a class="navbar-brand" href="../../tl_b/common/studentMainPage">보건 센터</a>
    </div>
    <div class="col-1 position-relative pb-0">
    	<a class="navbar-brand" href="#" onclick="showNotifyModal()"><i class="bi bi-bell-fill pe-1">
    	<span id="reloadNotifyCount" class="position-absolute top-70 start-50 badge rounded-pill bg-danger d-none px-1 py-0" style="font-size: xx-small;">
		</span>
		</i></a> 
	</div>
	<div class="col-2"></div>
</div>
<div class="row">
	<div class="col">
          <div id="alertBox" class="alert row border border-black position-fixed bottom-0 end-0 me-4 px-0 py-0 d-none" role="alert" style="height: 9em; width: 20em;">
            <div class="col">
                <div class="row border-bottom py-0 text-light rounded-top" style="background-color: #133369;">
                    <div id="sender" class="col-9  ">
                        취업 창업센터
                    </div>
                    <div class="col text-end " style="font-size: x-small;">
                        <button onclick="hideNotify()" class="btn-close btn-close-white btn-close-disabled-opacity mt-1"></button>
                    </div>
                </div>
                
                <div class="row bg-white pt-3">
                    <div class="col-2 ps-3 fs-3">
                        <i id ="notifyIcon" class="bi" style="color: #133369;"></i>
                    </div>
                    <div id="message" class="col fw-bold" style="font-size: small;">
                        알림 내용 블라블라블라블라블ㅓ 답글이 등록되었습니다.
                    </div>
                </div>
                
                <div class="row bg-white pb-3 rounded-bottom border-bottom border-black" style="color: #133369;">
                    <div class="col-6 text-center">
                        <button onclick="showNotifyModal()" class="btn border fw-bold mt-3 px-3 py-1" style="font-size: small; border-color: #133369;" >전체 알림확인</button>
                    </div>
                    <div class="col-6 text-center">
                        <button class="btn border fw-bold mt-3 px-4 py-1" style="font-size: small;">바로 가기</button>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</div>
    