<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 네비바 -->
	<div class="row pb-3" style="border-top-style: solid; border-top-width: 7px; border-top-color: #8FBC8F">
		<div class="col-2 pt-3">
			<div class="row">
				<div class="col-3 pe-0 me-0">
					<img class="img-fluid" style="width: 60px; height: 60px; color:blue;" src="./../../resources/img/groupCounsel/logo_black.png">
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
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">상담 신청</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="../../tl_e/onlineCounsel/onlineCounselMainPage">온라인 상담</a></li>
									    <li><a class="dropdown-item" href="../../tl_e/offlineCounsel/selectCounselorPage">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="../../tl_e/groupcounsel/student/groupCounselListPage">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">예약 조회</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="../../tl_e/offlineCounsel/checkOfflineCounselReservationStudentPage">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="../../tl_e/groupcounsel/student/readGroupCounselReservationListByStudentPage">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<a href="../../tl_e/notice/noticeMainPage_Student" class="fw-bold" style="font-size: 1.2em; text-decoration-line: none; color: black">공지사항</a>
								</div>
								<div class="col text-center">
									<a href="../../tl_e/freeboardCounsel/freeboardCounselPage" class="fw-bold" style="font-size: 1.2em; text-decoration-line: none; color: black">자유게시판</a>
								</div>
								<div class="col text-center">
									<a href="../../tl_e/registerCounselor/counselorInfo" class="fw-bold" style="font-size: 1.2em; text-decoration-line: none; color: black">상담원 정보</a>
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
									<i class="bi bi-box-arrow-right" style="font-size:1.6em;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>