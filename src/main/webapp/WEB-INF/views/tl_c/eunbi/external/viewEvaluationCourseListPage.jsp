<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR COMPANY </title>
<style>
	/*산업체좌측메뉴바설정*/
	.companyleftmenubar input {
	    display: none;
	}
	
	.companyleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #22212E;
	    transition: ease .1s;
	}
	
	.companyleftmenubar label:hover {
	    background: #22212E;
	    opacity: 50%;
	}
	
	.companyleftmenubar .content {
	    background: #1C1C26;
   	    transition: ease .5s;    
	}
	
	.companyleftmenubar input + label + .content {
	    display: none;
	}
	
	.companyleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">

	<!-- 좌측메뉴바 : col-2 -->
	<jsp:include page="../../common/ajdksTemplateForCompany.jsp"></jsp:include>
	
	<!-- 메인화면 -->
	<div class="col">
		<!-- 안내문구 -->
		<div class="row py-2" style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
			<div class="col ps-2">
				<span>&#035;&nbsp;ㅇㅇㅇ 님 환영합니다</span>
			</div>	
			<div class="col pe-2 text-end nolinenoblue">
				<a href="./ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		<div class="row">
			<div class="col mx-5">
			
				<div class="row">
					<div class="col">
						<div class="row mt-4">
							<div class="col fw-semibold mt-2" style="font-size:1.3em">
								<span class="text-secondary fs-3">&gt;</span>
								최종평가 입력
							</div>
						</div>
					
						<div class="row row-cols-4 mt-2">

							<div class="col px-4 py-2">
								<div class="row">
									<div class="col border px-1 py-1 d-grid">
										<a class="btn btn-light rounded-0 border py-3">
											<div class="row">
												<div class="col fw-semibold">
													실습과정제목
												</div>
											</div>
											<div class="row mt-2" style="font-size:0.9em">
												<div class="col">
													n/total명 평가 미완료
												</div>
											</div>
											<div class="row mt-1">
												<div class="col text-secondary fw-semibold" style="font-size:0.85em">
													진행기간 : 0000.00.00 - 0000.00.00
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 현장실습 정보/학생 -->
						
						<div class="row">
							<div class="col px-4">
								<div class="row">
									<div class="col border border-dark-subtle px-4 py-3">
									
										<div class="row mt-2">
											<div class="col">
												<div class="row">
													<div class="col fw-semibold" style="font-size:1.1em">
														현장실습 상세정보
													</div>
												</div>
												<div class="row mt-2">
													<div class="col border border-start-0 border-end-0 border-secondary" style="font-size:0.95em">
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																현장실습명
															</div>
															<div class="internshipCourseTitle col border-start ps-4 fw-semibold">
																현장실습명입력
															</div>
														</div>
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																산업체명
															</div>
															<div class="companyName col border-start ps-4 border-end">
																산업체명입력
															</div>
															<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
																실습인원
															</div>
															<div class="totalMember col border-start ps-4">
																실습인원 입력
															</div>
														</div>
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																모집학과
															</div>
															<div class="recruitmentDepartment col border-start ps-4 border-end">
																모집학과 입력
															</div>
															<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
																자격학기
															</div>
															<div class="semesterQualification col border-start ps-4">
																자격학기 입력
															</div>
														</div>
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																모집기간
															</div>
															<div class="applicationPeriod col border-start ps-4 border-end">
																모집기간 입력
															</div>
															<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
																결과발표일
															</div>
															<div class="announcementDate col border-start ps-4">
																결과발표일 입력
															</div>
														</div>
														<div class="row py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																실습기간
															</div>
															<div class="internshipPeriod col border-start ps-4">
																실습기간 입력
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-2 mb-4">
											<div class="col">
												<div class="row mt-4">
													<div class="col fw-semibold" style="font-size:1.1em">
														인턴목록
													</div>
												</div>

												<div id="studentInternForm">
												<div class="row mt-2" style="height:15em">
													<div class="col border-secondary border-top border-bottom overflow-y-scroll">
														<div class="row text-center border-bottom border-secondary py-1 fw-semibold" style=" background-color:#e4e4eb">
															<div class="col-1 border-end">
																학번
															</div>
															<div class="col-2 border-end">
																이름
															</div>
															<div class="col-1 border-end">
																학과
															</div>
															<div class="col-1 border-end">
																담당교수
															</div>
															<div class="col-1 border-end">
																학생정보
															</div>
															<div class="col-2 border-end">
																출결
															</div>
															<div class="col-2 border-end">
																업무일지
															</div>
															<div class="col-2">
																성적산출
															</div>
														</div>
														<div class="row">
															<div id="internListBox" class="col">
																<div class="col">
																	
																</div>
															</div>
														</div>
													</div>
												</div>
												</div>
												
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						
						
						
						
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>